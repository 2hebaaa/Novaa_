<?php
session_start();
include("../config/db.php");

if(!isset($_SESSION['doctor_id'])){
  header("Location: ../login.php");
  exit();
}

if(isset($_POST['save'])){
  $id = $_POST['id'];
  $grade = $_POST['grade'];

  mysqli_query($conn,"UPDATE submissions
  SET grade='$grade' WHERE id='$id'");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Submissions</title>
    
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

        .table {
            font-size: 0.95rem;
            margin-bottom: 0;
        }

        .table thead th {
            background: #f8f9fa;
            font-weight: 600;
            border-top: none;
            color: #333;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 12px;
        }

        .table tbody td {
            padding: 12px;
            vertical-align: middle;
        }

        .table tbody tr {
            transition: 0.2s;
            border-bottom: 1px solid #f0f0f0;
        }

        .table tbody tr:hover {
            background: #f8f9fa;
        }

        .form-control {
            border-radius: 8px;
            border: 1.5px solid #ddd;
            padding: 8px 12px;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #614b6f;
            box-shadow: 0 0 0 3px rgba(97, 75, 111, 0.1);
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
            <h2>Assignment Submissions</h2>
            <p>Review and grade student submissions</p>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Submission</th>
                                <th>Grade</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $res = mysqli_query($conn,"
                            SELECT submissions.*, users.name
                            FROM submissions
                            JOIN users ON submissions.student_id = users.id
                            WHERE submissions.assignment_id IN (SELECT id FROM assignments WHERE course_id IN (SELECT id FROM courses WHERE doctor_id = {$_SESSION['doctor_id']}))
                            ");

                            while($row=mysqli_fetch_assoc($res)){
                              echo "<tr>
                                <td>{$row['name']}</td>
                                <td><a href='../uploads/assignments/{$row['file']}' target='_blank' class='btn btn-sm btn-outline-dark'>Download</a></td>
                                <td>
                                  <form method='POST' class='d-inline'>
                                    <input type='hidden' name='id' value='{$row['id']}'>
                                    <input type='number' name='grade' class='form-control d-inline-block' style='width: 80px;' placeholder='Grade' value='{$row['grade']}'>
                                </td>
                                <td>
                                    <button type='submit' name='save' class='btn btn-dark btn-sm'>Save</button>
                                  </form>
                                </td>
                              </tr>";
                            }
                            ?>
                        </tbody>
                    </table>
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