<?php
session_start();
include("../config/db.php");

if(!isset($_SESSION['doctor_id'])){
  header("Location: ../login.php");
  exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
    
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

        .menu-list {
            list-style: none;
            padding: 0;
        }

        .menu-list li {
            margin: 10px 0;
        }

        .menu-list a {
            display: inline-block;
            padding: 12px 20px;
            background: white;
            color: #614b6f;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .menu-list a:hover {
            background: #614b6f;
            color: white;
            text-decoration: none;
        }

        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
        }
    </style>
</head>
<body>
    <div class="content">
        <div class="page-header">
            <h2>Doctor Dashboard</h2>
            <p>Welcome, <?php echo $_SESSION['name']; ?>!</p>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Course Management</h5>
                        <ul class="menu-list">
                            <li><a href="add_lecture.php"><i class="fas fa-book"></i> Add Lecture</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Assessment & Evaluation</h5>
                        <ul class="menu-list">
                            <li><a href="add_assignment.php"><i class="fas fa-tasks"></i> Add Assignment</a></li>
                            <li><a href="add_quiz.php"><i class="fas fa-question-circle"></i> Add Quiz</a></li>
                            <li><a href="add_attendance.php"><i class="fas fa-calendar-check"></i> Take Attendance</a></li>
                            <li><a href="view_submissions.php"><i class="fas fa-file-alt"></i> View Submissions</a></li>
                            <li><a href="dd_result.php"><i class="fas fa-chart-line"></i> Add Result</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <a href="../auth/logout.php" class="btn btn-dark logout-btn">Logout</a>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>