<?php
session_start();
include("../config/db.php");

if(!isset($_SESSION['doctor_id'])){
  header("Location: ../login.php");
  exit();
}

$message = "";
$selected_course_id = isset($_POST['course_id']) ? (int)$_POST['course_id'] : 0;
$selected_date = isset($_POST['date']) ? trim($_POST['date']) : date('Y-m-d');

if(isset($_POST['save'])){
  if(!empty($selected_course_id) && !empty($selected_date)){
    $statuses = isset($_POST['status']) ? $_POST['status'] : [];
    $saved_count = 0;
    $error_count = 0;
    
    foreach($statuses as $student_id => $status){
      if(!empty($status)){
        $student_id = (int)$student_id;
        $status = strtolower(trim($status)); // Ensure lowercase (present or absent)
        
        // Use prepared statements to prevent SQL injection
        $check_query = "SELECT id FROM attendance WHERE student_id = ? AND course_id = ? AND date = ?";
        $check_stmt = mysqli_prepare($conn, $check_query);
        mysqli_stmt_bind_param($check_stmt, "iis", $student_id, $selected_course_id, $selected_date);
        mysqli_stmt_execute($check_stmt);
        $check_result = mysqli_stmt_get_result($check_stmt);
        
        if(mysqli_num_rows($check_result) > 0){
          // Update existing record
          $update_query = "UPDATE attendance SET status = ? WHERE student_id = ? AND course_id = ? AND date = ?";
          $update_stmt = mysqli_prepare($conn, $update_query);
          mysqli_stmt_bind_param($update_stmt, "siis", $status, $student_id, $selected_course_id, $selected_date);
          if(mysqli_stmt_execute($update_stmt)){
            error_log("✓ Attendance UPDATED: student=$student_id, course=$selected_course_id, date=$selected_date, status=$status");
            $saved_count++;
          } else {
            error_log("✗ Attendance update ERROR: " . mysqli_stmt_error($update_stmt));
            $error_count++;
          }
          mysqli_stmt_close($update_stmt);
        } else {
          // Insert new record
          $insert_query = "INSERT INTO attendance (student_id, course_id, date, status) VALUES (?, ?, ?, ?)";
          $insert_stmt = mysqli_prepare($conn, $insert_query);
          mysqli_stmt_bind_param($insert_stmt, "iiss", $student_id, $selected_course_id, $selected_date, $status);
          if(mysqli_stmt_execute($insert_stmt)){
            error_log("✓ Attendance INSERTED: student=$student_id, course=$selected_course_id, date=$selected_date, status=$status");
            $saved_count++;
          } else {
            error_log("✗ Attendance insert ERROR: " . mysqli_stmt_error($insert_stmt));
            $error_count++;
          }
          mysqli_stmt_close($insert_stmt);
        }
      }
    }
    
    if($saved_count > 0 && $error_count == 0){
      $message = "✓ Attendance saved successfully for $saved_count student(s)!";
    } elseif($error_count > 0){
      $message = "⚠ Saved $saved_count records, but $error_count had errors. Check server logs.";
    } else {
      $message = "No attendance data was provided.";
    }
  } else {
    $message = "⚠ Please select a course and date";
  }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Take Attendance</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/site.css">
    
    <style>
        * {
            font-family: 'Inter', sans-serif;
        }

        html, body {
            height: 100%;
            background: #f0f2f5;
        }

        .content {
            padding: 30px;
            min-height: 100vh;
        }

        .page-header {
            margin-bottom: 30px;
        }

        .page-header h2 {
            font-family: 'Poppins', sans-serif;
            font-weight: 700;
            color: #1a1a2e;
            margin-bottom: 8px;
            font-size: 1.8rem;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .card:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
            transform: translateY(-4px);
        }

        .card-body {
            padding: 20px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            font-size: 0.9rem;
            border: none;
        }

        .btn-dark {
            background: #614b6f;
            color: white;
        }

        .btn-dark:hover {
            background: #4a3a53;
            color: white;
        }

        .form-control, .form-select {
            border-radius: 8px;
            border: 1.5px solid #ddd;
            padding: 10px 15px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            border-color: #614b6f;
            box-shadow: 0 0 0 3px rgba(97, 75, 111, 0.1);
        }

        .form-label {
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
            font-size: 0.9rem;
        }

        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .alert {
            border-radius: 10px;
            border: none;
            padding: 14px 16px;
        }

        .alert-success {
            background: #efe;
            color: #3c3;
        }
    </style>
</head>
<body>
    <div class="content">
        <div class="page-header">
            <h2>Take Attendance</h2>
            <p>Mark student attendance for your course</p>
        </div>

        <?php if($message): ?>
        <div class="alert alert-success"><?php echo $message; ?></div>
        <?php endif; ?>

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <form method="POST">
                            <div class="mb-3">
                                <label for="course_id" class="form-label">Select Course</label>
                                <div class="d-flex gap-2">
                                    <select class="form-select" id="course_id" name="course_id" required>
                                        <option value="">Choose Course</option>
                                        <?php
                                        $res = mysqli_query($conn,"SELECT * FROM courses WHERE doctor_id = {$_SESSION['doctor_id']}");
                                        while($row=mysqli_fetch_assoc($res)){
                                          echo "<option value='{$row['id']}' ".(isset($_POST['course_id']) && $_POST['course_id']==$row['id'] ? 'selected' : '').">{$row['course_name']}</option>";
                                        }
                                        ?>
                                    </select>
                                    <button type="submit" name="load_students" class="btn btn-dark" style="min-width: 150px;">Load Students</button>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="date" class="form-label">Date</label>
                                <input type="date" class="form-control" id="date" name="date" value="<?php echo date('Y-m-d'); ?>" required>
                            </div>

                            <?php if(isset($_POST['load_students']) || (isset($_POST['course_id']) && !isset($_POST['save']) && isset($_POST['course_id']))): ?>
                            <?php if($selected_course_id): ?>
                            <h5 class="mt-4">Students:</h5>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Student Name</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $students = mysqli_query($conn,"SELECT users.id, users.name FROM enrollments JOIN users ON enrollments.student_id = users.id WHERE enrollments.course_id = '$selected_course_id' ORDER BY users.name ASC");
                                        if($students && mysqli_num_rows($students) > 0){
                                          while($student = mysqli_fetch_assoc($students)){
                                            echo "<tr>
                                              <td>{$student['name']}</td>
                                              <td>
                                                <select name='status[{$student['id']}]' class='form-select' required>
                                                  <option value=''>-- Select --</option>
                                                  <option value='present'>Present</option>
                                                  <option value='absent'>Absent</option>
                                                </select>
                                              </td>
                                            </tr>";
                                          }
                                        } else {
                                          echo "<tr><td colspan='2' class='text-center text-muted'>No students enrolled</td></tr>";
                                        }
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                            <button type="submit" name="save" class="btn btn-dark w-100">Save Attendance</button>
                            <?php endif; ?>
                            <?php endif; ?>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="dashboard.php" class="btn btn-outline-dark">Back to Dashboard</a>
        </div>
    </div>

    <a href="../auth/logout.php" class="btn btn-dark logout-btn">Logout</a>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>