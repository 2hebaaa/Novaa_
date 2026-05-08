<?php
require_once("../config/db.php");
session_start();

$student_id = (int) $_SESSION['user_id'] ?? 0;
$assignment_id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

if (!$student_id || !$assignment_id) {
    die("Invalid request");
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Validate file upload
    if (!isset($_FILES['file']) || $_FILES['file']['error'] != UPLOAD_ERR_OK) {
        die("No file uploaded or upload error");
    }

    $file = $_FILES['file'];
    $allowed = ['pdf', 'doc', 'docx', 'txt', 'jpg', 'png'];
    $file_ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));

    if (!in_array($file_ext, $allowed)) {
        die("Invalid file type");
    }

    if ($file['size'] > 5 * 1024 * 1024) { // 5MB
        die("File too large");
    }

    // Create unique filename
    $filename = time() . '_' . basename($file['name']);
    $upload_path = "../uploads/assignments/" . $filename;

    // Create directory if it doesn't exist
    if (!is_dir("../uploads/assignments")) {
        mkdir("../uploads/assignments", 0755, true);
    }

    if (move_uploaded_file($file['tmp_name'], $upload_path)) {
        // Check if submission already exists
        $check_stmt = $conn->prepare("SELECT id FROM submissions WHERE assignment_id = ? AND student_id = ?");
        $check_stmt->bind_param("ii", $assignment_id, $student_id);
        $check_stmt->execute();
        $result = $check_stmt->get_result();
        $check_stmt->close();

        if ($result->num_rows > 0) {
            // Update existing submission
            $update_stmt = $conn->prepare("UPDATE submissions SET file = ? WHERE assignment_id = ? AND student_id = ?");
            $update_stmt->bind_param("sii", $filename, $assignment_id, $student_id);
            $success = $update_stmt->execute();
            $update_stmt->close();
        } else {
            // Insert new submission
            $insert_stmt = $conn->prepare("INSERT INTO submissions (assignment_id, student_id, file) VALUES (?, ?, ?)");
            $insert_stmt->bind_param("iis", $assignment_id, $student_id, $filename);
            $success = $insert_stmt->execute();
            $insert_stmt->close();
        }

        if ($success) {
            header("Location: assignments.php?success=1");
            exit();
        }
    }

    die("Upload failed");
}

include 'layout.php';

// Get assignment details
$assignment = $conn->query("SELECT * FROM assignments WHERE id = $assignment_id");
$assignment = $assignment ? $assignment->fetch_assoc() : null;

if (!$assignment) {
    die("<div class='alert alert-danger m-4'><i class='fas fa-exclamation-circle'></i> Assignment not found</div>");
}
?>

<div class="page-header">
    <h2><i class="fas fa-upload"></i> Submit Assignment</h2>
    <p><?= htmlspecialchars($assignment['title'] ?? 'N/A') ?></p>
</div>

<div class="row">
    <div class="col-md-8">
        <div class="card">
            <div class="card-body">
                <h5 class="mb-3">Assignment Details</h5>
                
                <p><strong>Title:</strong> <?= htmlspecialchars($assignment['title'] ?? 'N/A') ?></p>
                <p><strong>Description:</strong> <?= htmlspecialchars($assignment['description'] ?? 'N/A') ?></p>
                <p><strong>Deadline:</strong> <?= date('M d, Y H:i', strtotime($assignment['deadline'] ?? 'now')) ?></p>

                <hr>

                <h5 class="mb-3">Upload Your Submission</h5>

                <form method="POST" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label class="form-label"><i class="fas fa-file"></i> Select File</label>
                        <input 
                            type="file" 
                            name="file" 
                            class="form-control" 
                            required
                            accept=".pdf,.doc,.docx,.txt,.jpg,.png"
                        >
                        <small class="text-muted">Allowed: PDF, DOC, DOCX, TXT, JPG, PNG (Max 5MB)</small>
                    </div>

                    <button type="submit" class="btn btn-dark">
                        <i class="fas fa-upload"></i> Submit Assignment
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

</div>
</body>
</html>