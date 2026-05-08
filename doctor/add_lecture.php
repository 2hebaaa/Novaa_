<?php
session_start();
include("../config/db.php");

if(!isset($_SESSION['doctor_id'])){
  header("Location: ../login.php");
  exit();
}

if(isset($_POST['add'])){
  $title = $_POST['title'];
  $course_id = $_POST['course_id'];

  $file = $_FILES['file']['name'];
  move_uploaded_file($_FILES['file']['tmp_name'],"../uploads/materials/".$file);

  mysqli_query($conn,"INSERT INTO materials (course_id,title,file,type)
  VALUES ('$course_id','$title','$file','lecture')");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Lecture</title>
    
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
    </style>
</head>
<body>
    <div class="content">
        <div class="page-header">
            <h2>Add New Lecture</h2>
            <p>Upload lecture materials for your course</p>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <form method="POST" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="title" class="form-label">Lecture Title</label>
                                <input type="text" class="form-control" id="title" name="title" placeholder="Enter lecture title" required>
                            </div>
                            <div class="mb-3">
                                <label for="course_id" class="form-label">Course</label>
                                <select class="form-select" id="course_id" name="course_id" required>
                                    <option value="">Select Course</option>
                                    <?php
                                    $res = mysqli_query($conn,"SELECT * FROM courses WHERE doctor_id = {$_SESSION['doctor_id']}");
                                    while($row=mysqli_fetch_assoc($res)){
                                      echo "<option value='{$row['id']}'>{$row['course_name']}</option>";
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="file" class="form-label">Lecture File</label>
                                <input type="file" class="form-control" id="file" name="file" required>
                            </div>
                            <button type="submit" name="add" class="btn btn-dark w-100">Add Lecture</button>
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