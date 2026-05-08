<?php
include 'layout.php';
require_once("../config/db.php");

$student_id = (int) $_SESSION['user_id'] ?? 0;

if (!$student_id) {
    header("Location: ../auth/login.php");
    exit();
}

// Get statistics
$stats = [
    'courses' => 0,
    'assignments' => 0,
    'attendance' => 0,
    'pending_assignments' => 0
];

// Count enrolled courses
$result = $conn->query("SELECT COUNT(*) as count FROM enrollments WHERE student_id = $student_id");
$stats['courses'] = $result ? $result->fetch_assoc()['count'] ?? 0 : 0;

// Count total assignments
$result = $conn->query("
    SELECT COUNT(*) as count FROM assignments 
    JOIN enrollments ON assignments.course_id = enrollments.course_id 
    WHERE enrollments.student_id = $student_id
");
$stats['assignments'] = $result ? $result->fetch_assoc()['count'] ?? 0 : 0;

// Count present days
$result = $conn->query("SELECT COUNT(*) as count FROM attendance WHERE student_id = $student_id AND status = 'Present'");
$stats['attendance'] = $result ? $result->fetch_assoc()['count'] ?? 0 : 0;

// Get latest materials
$latest = $conn->query("
    SELECT materials.id, materials.title, materials.file, materials.created_at, courses.course_name
    FROM materials
    JOIN courses ON courses.id = materials.course_id
    JOIN enrollments ON enrollments.course_id = courses.id
    WHERE enrollments.student_id = $student_id
    ORDER BY materials.created_at DESC 
    LIMIT 5
");
?>

<div class="page-header">
    <h2><i class="fas fa-home"></i> Dashboard</h2>
    <p>Welcome back, <?= htmlspecialchars($user_name ?? 'Student') ?></p>
</div>

<!-- Statistics Row -->
<div class="row mb-4">
    <div class="col-md-4 mb-3">
        <div class="card stat-card border-0">
            <div class="card-body">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <p class="mb-1">Active Courses</p>
                        <h3 class="mb-0"><?= $stats['courses'] ?></h3>
                    </div>
                    <div class="stat-icon bg-primary bg-opacity-10">
                        <i class="fas fa-book text-primary"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4 mb-3">
        <div class="card stat-card border-0">
            <div class="card-body">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <p class="mb-1">Assignments</p>
                        <h3 class="mb-0"><?= $stats['assignments'] ?></h3>
                    </div>
                    <div class="stat-icon bg-success bg-opacity-10">
                        <i class="fas fa-tasks text-success"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4 mb-3">
        <div class="card stat-card border-0">
            <div class="card-body">
                <div class="d-flex align-items-center justify-content-between">
                    <div>
                        <p class="mb-1">Present Days</p>
                        <h3 class="mb-0"><?= $stats['attendance'] ?></h3>
                    </div>
                    <div class="stat-icon bg-info bg-opacity-10">
                        <i class="fas fa-calendar-check text-info"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Latest Materials -->
<div class="card">
    <div class="card-header">
        <h5 class="mb-0"><i class="fas fa-file-alt"></i> Latest Course Materials</h5>
    </div>
    <div class="card-body">
        <?php if ($latest && $latest->num_rows > 0): ?>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Course</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($material = $latest->fetch_assoc()): ?>
                            <tr>
                                <td>
                                    <i class="fas fa-file-pdf"></i>
                                    <?= htmlspecialchars($material['title'] ?? 'N/A') ?>
                                </td>
                                <td><?= htmlspecialchars($material['course_name'] ?? 'N/A') ?></td>
                                <td><?= date('M d, Y', strtotime($material['created_at'] ?? now())) ?></td>
                                <td>
                                    <a href="../uploads/materials/<?= urlencode($material['file'] ?? '') ?>" 
                                       class="btn btn-sm btn-outline-dark" download>
                                        <i class="fas fa-download"></i> Download
                                    </a>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        <?php else: ?>
            <div class="empty-state">
                <i class="fas fa-inbox"></i>
                <p>No course materials available yet</p>
            </div>
        <?php endif; ?>
    </div>
</div>

</div>
</body>
</html>