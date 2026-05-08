<?php
require_once("../config/db.php");
include 'layout.php';

$student_id = (int) $_SESSION['user_id'] ?? 0;

if (!$student_id) {
    header("Location: ../auth/login.php");
    exit();
}

$query = "
    SELECT 
        courses.id, 
        courses.course_name,
        (SELECT COUNT(*) FROM attendance WHERE attendance.student_id = $student_id AND attendance.course_id = courses.id AND attendance.status = 'present') as present,
        (SELECT COUNT(*) FROM attendance WHERE attendance.student_id = $student_id AND attendance.course_id = courses.id) as total
    FROM courses
    WHERE courses.id IN (SELECT course_id FROM enrollments WHERE student_id = $student_id)
    ORDER BY courses.course_name ASC
";

$courses = $conn->query($query);

// Debug: log the query result
if (!$courses) {
    error_log("Query Error: " . $conn->error);
} else {
    // Test query to verify enrollment
    $test_query = "SELECT COUNT(*) as count FROM enrollments WHERE student_id = $student_id";
    $test_result = $conn->query($test_query);
    $test_row = $test_result ? $test_result->fetch_assoc() : null;
    error_log("Student $student_id has " . ($test_row['count'] ?? 0) . " course enrollments");
    
    // Test attendance data
    $att_query = "SELECT COUNT(*) as count FROM attendance WHERE student_id = $student_id";
    $att_result = $conn->query($att_query);
    $att_row = $att_result ? $att_result->fetch_assoc() : null;
    error_log("Student $student_id has " . ($att_row['count'] ?? 0) . " attendance records");
}
?>

<div class="page-header">
    <h2><i class="fas fa-calendar-check"></i> Attendance</h2>
    <p>View your attendance records across all courses</p>
    <!-- Debug Info -->
    <small style="color: #999; font-size: 10px;"> Student ID = <?= $student_id ?></small>
</div>

<div class="row">
    <?php 
    if ($courses && $courses->num_rows > 0):
        while ($course = $courses->fetch_assoc()): 
            $total = $course['total'] ?? 0;
            $present = $course['present'] ?? 0;
            $percentage = $total > 0 ? round(($present / $total) * 100) : 0;
            
            $status_class = $percentage >= 75 ? 'success' : 
                           ($percentage >= 50 ? 'warning' : 'danger');
    ?>
    <div class="col-md-4 mb-4">
        <div class="card h-100">
            <div class="card-body">
                <h5 class="card-title mb-3"><?= htmlspecialchars($course['course_name'] ?? 'N/A') ?></h5>
                
                <div class="mb-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <small class="text-muted">Attendance Rate</small>
                        <span class="badge badge-<?= $status_class ?>"><?= $percentage ?>%</span>
                    </div>
                    <div class="progress">
                        <div class="progress-bar bg-<?= $status_class ?>" style="width: <?= $percentage ?>%"></div>
                    </div>
                </div>

                <div class="row text-center mb-3">
                    <div class="col-6 border-end">
                        <small class="text-muted d-block">Present</small>
                        <h6 class="mb-0"><?= $present ?></h6>
                    </div>
                    <div class="col-6">
                        <small class="text-muted d-block">Total</small>
                        <h6 class="mb-0"><?= $total ?></h6>
                    </div>
                </div>

                <a href="course_attendance.php?course_id=<?= (int) $course['id'] ?>" 
                   class="btn btn-dark btn-sm w-100">
                   <i class="fas fa-eye"></i> View Details
                </a>
            </div>
        </div>
    </div>
    <?php 
        endwhile;
    else:
    ?>
    <div class="col-12">
        <div class="empty-state">
            <i class="fas fa-inbox"></i>
            <p>No attendance records available</p>
        </div>
    </div>
    <?php endif; ?>
</div>

</div>
</body>
</html>