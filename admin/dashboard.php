<?php
session_start();
require_once("../config/db.php");

// Check if user is logged in and is an admin
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'admin') {
    header("Location: ../auth/login.php");
    exit();
}

// Get admin info
$admin_id = $_SESSION['user_id'];
$admin_name = $_SESSION['name'];

// Get statistics
$stats = [
    'total_doctors' => 0,
    'total_students' => 0,
    'total_courses' => 0,
    'total_admins' => 0,
    'pending_requests' => 0
];

// Count doctors
$result = $conn->query("SELECT COUNT(*) as count FROM doctor WHERE is_active = 1");
$stats['total_doctors'] = $result ? $result->fetch_assoc()['count'] : 0;

// Count students
$result = $conn->query("SELECT COUNT(*) as count FROM student WHERE is_active = 1");
$stats['total_students'] = $result ? $result->fetch_assoc()['count'] : 0;

// Count courses
$result = $conn->query("SELECT COUNT(*) as count FROM courses");
$stats['total_courses'] = $result ? $result->fetch_assoc()['count'] : 0;

// Count admins
$result = $conn->query("SELECT COUNT(*) as count FROM admin");
$stats['total_admins'] = $result ? $result->fetch_assoc()['count'] : 0;

// Count pending enrollment requests
$result = $conn->query("SELECT COUNT(*) as count FROM enrollment_requests WHERE status = 'pending'");
$stats['pending_requests'] = $result ? $result->fetch_assoc()['count'] : 0;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - BTU LMS</title>
    
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

        body {
            display: flex;
            overflow-x: hidden;
        }

        /* ============ SIDEBAR ============ */
        .sidebar {
            width: 280px;
            height: 100vh;
            background: linear-gradient(135deg, #614b6f 0%, #4a3a53 100%);
            color: white;
            padding: 30px 20px;
            position: fixed;
            overflow-y: auto;
            box-shadow: 2px 0 15px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .sidebar-brand {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid rgba(255, 255, 255, 0.2);
        }

        .sidebar-brand h5 {
            margin: 0;
            font-weight: 700;
            font-size: 1.2rem;
        }

        .sidebar-menu {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .sidebar-menu li {
            margin: 8px 0;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            gap: 12px;
            color: rgba(255, 255, 255, 0.85);
            padding: 12px 15px;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 0.95rem;
            font-weight: 500;
        }

        .sidebar-menu a:hover {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            padding-left: 20px;
        }

        .sidebar-menu a i {
            width: 20px;
            text-align: center;
        }

        .sidebar-divider {
            border-color: rgba(255, 255, 255, 0.2);
            margin: 20px 0;
        }

        .sidebar-logout {
            margin-top: auto;
            padding-top: 20px;
            border-top: 2px solid rgba(255, 255, 255, 0.2);
        }

        /* ============ CONTENT AREA ============ */
        .content {
            margin-left: 280px;
            flex: 1;
            padding: 30px;
            min-height: 100vh;
        }

        /* ============ PAGE HEADER ============ */
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

        .page-header p {
            color: #666;
            font-size: 0.95rem;
            margin: 0;
        }

        /* ============ STAT CARDS ============ */
        .stat-card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            padding: 24px;
            margin-bottom: 20px;
        }

        .stat-card .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            margin-right: 20px;
        }

        .stat-card h3 {
            font-family: 'Poppins', sans-serif;
            font-weight: 700;
            margin: 0;
            font-size: 1.8rem;
        }

        .stat-card p {
            color: #666;
            font-size: 0.9rem;
            margin: 0;
        }

        .stat-card .d-flex {
            align-items: center;
        }

        /* ============ CARDS ============ */
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

        .card-header {
            background: #f8f9fa !important;
            border-bottom: 1px solid #e9ecef;
        }

        /* ============ BUTTONS ============ */
        .btn {
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
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
            width: 100%;
            text-align: left;
        }

        .menu-list a:hover {
            background: #614b6f;
            color: white;
            text-decoration: none;
        }

        .menu-list i {
            margin-right: 10px;
            width: 20px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
                margin-bottom: 20px;
            }

            .content {
                margin-left: 0;
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="sidebar-brand">
        <i class="fas fa-lock"></i>
        <h5>Admin Panel</h5>
    </div>

    <ul class="sidebar-menu">
        <li><a href="dashboard.php"><i class="fas fa-chart-line"></i> Dashboard</a></li>
        <li><a href="manage_doctors.php"><i class="fas fa-chalkboard-user"></i> Manage Doctors</a></li>
        <li><a href="manage_students.php"><i class="fas fa-users"></i> Manage Students</a></li>
        <li><a href="manage_courses.php"><i class="fas fa-book"></i> Manage Courses</a></li>
        <li><a href="manage_admins.php"><i class="fas fa-user-shield"></i> Manage Admins</a></li>
        <li><a href="reports.php"><i class="fas fa-file-csv"></i> Reports</a></li>
        <li><a href="audit_log.php"><i class="fas fa-history"></i> Audit Log</a></li>
        <li><a href="settings.php"><i class="fas fa-cog"></i> Settings</a></li>
        <hr class="sidebar-divider">
        <li class="sidebar-logout"><a href="../auth/logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</div>

<!-- CONTENT AREA -->
<div class="content">
    <div class="page-header">
        <h2><i class="fas fa-chart-line"></i> Admin Dashboard</h2>
        <p>Welcome, <?= htmlspecialchars($admin_name) ?> | System Overview</p>
    </div>

    <!-- Statistics Row -->
    <div class="row mb-4">
        <div class="col-md-3 mb-3">
            <div class="card stat-card">
                <div class="d-flex">
                    <div class="stat-icon" style="background: #e3f2fd; color: #1976d2;">
                        <i class="fas fa-chalkboard-user"></i>
                    </div>
                    <div>
                        <p>Active Doctors</p>
                        <h3><?= $stats['total_doctors'] ?></h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card stat-card">
                <div class="d-flex">
                    <div class="stat-icon" style="background: #f3e5f5; color: #7b1fa2;">
                        <i class="fas fa-users"></i>
                    </div>
                    <div>
                        <p>Active Students</p>
                        <h3><?= $stats['total_students'] ?></h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card stat-card">
                <div class="d-flex">
                    <div class="stat-icon" style="background: #e8f5e9; color: #388e3c;">
                        <i class="fas fa-book"></i>
                    </div>
                    <div>
                        <p>Total Courses</p>
                        <h3><?= $stats['total_courses'] ?></h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card stat-card">
                <div class="d-flex">
                    <div class="stat-icon" style="background: #fff3e0; color: #f57c00;">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div>
                        <p>Pending Requests</p>
                        <h3><?= $stats['pending_requests'] ?></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Management Sections -->
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-users"></i> User Management</h5>
                    <ul class="menu-list">
                        <li><a href="manage_doctors.php"><i class="fas fa-chalkboard-user"></i> Manage Doctors (<?= $stats['total_doctors'] ?>)</a></li>
                        <li><a href="manage_students.php"><i class="fas fa-users"></i> Manage Students (<?= $stats['total_students'] ?>)</a></li>
                        <li><a href="manage_admins.php"><i class="fas fa-user-shield"></i> Manage Admins (<?= $stats['total_admins'] ?>)</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-book"></i> Academic Management</h5>
                    <ul class="menu-list">
                        <li><a href="manage_courses.php"><i class="fas fa-book"></i> Manage Courses (<?= $stats['total_courses'] ?>)</a></li>
                        <li><a href="enrollment_requests.php"><i class="fas fa-clock"></i> Enrollment Requests (<?= $stats['pending_requests'] ?>)</a></li>
                        <li><a href="reports.php"><i class="fas fa-file-csv"></i> View Reports</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-cog"></i> System Management</h5>
                    <ul class="menu-list">
                        <li><a href="audit_log.php"><i class="fas fa-history"></i> Audit Log</a></li>
                        <li><a href="settings.php"><i class="fas fa-cog"></i> System Settings</a></li>
                        <li><a href="backups.php"><i class="fas fa-database"></i> Backups</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-info-circle"></i> Quick Info</h5>
                    <p class="mb-2"><strong>System Version:</strong> 1.0.0</p>
                    <p class="mb-2"><strong>Database:</strong> lms</p>
                    <p class="mb-0"><strong>Last Updated:</strong> <?= date('M d, Y H:i:s') ?></p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
