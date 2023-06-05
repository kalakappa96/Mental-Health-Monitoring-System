<?php
session_start();
error_reporting(0);
include('include/config.php');
include('include/checklogin.php');

check_login();

if (isset($_GET['cancel'])) {
    mysqli_query($con, "UPDATE appointment SET ap_status='0', doctorStatus='0' WHERE id='" . $_GET['id'] . "'");
    require __DIR__ . '/send-email.php';
    $sql = mysqli_query($con, "SELECT users.email AS userEmail, users.fullName AS userFullName FROM users WHERE id='" . $_GET['userId'] . "'");
    $user = mysqli_fetch_array($sql);
    $body = "Hi, " . $user['userFullName'] . "  <br>". "Your Appointment Has been cancelled by doctor!" . " <br>" . "Thank you.";
    sendEmail($user['userEmail'],$body);
    $_SESSION['msg'] = "Appointment canceled!";
}

if (isset($_GET['accept'])) {
    mysqli_query($con, "UPDATE appointment SET ap_status='1' WHERE id='" . $_GET['id'] . "'");
    require __DIR__ . '/send-email.php';
    $sql = mysqli_query($con, "SELECT users.email AS userEmail, users.fullName AS userFullName FROM users WHERE id='" . $_GET['userId'] . "'");
    $user = mysqli_fetch_array($sql);
    $body = "Hi, " . $user['userFullName'] . "  <br>". "Your appointment has been confirmed by the doctor!, and you can join the meeting using the following link :https://us04web.zoom.us/j/76049731730?pwd=dhSk4DTD0PHDJuP3z2xjHuN8LwDLpI.1  at the scheduled time." . " <br>" . "Thank you.";
    sendEmail($user['userEmail'],$body);
    $_SESSION['msg'] = "Appointment accepted!";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Doctor | Appointment History</title>

    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
    <link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
    <link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
    <link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
    <link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
</head>
<body>
<div id="app">
    <?php include('include/sidebar.php'); ?>
    <div class="app-content">
        <?php include('include/header.php'); ?>
        <div class="main-content">
            <div class="wrap-content container" id="container">
                <section id="page-title">
                    <div class="row">
                        <div class="col-sm-8">
                            <h1 class="mainTitle"><b><u>Appointment History</u></b></h1>
                        </div>
                    </div>
                </section>
                <div class="container-fluid container-fullw bg-white">
                    <div class="row">
                        <div class="col-md-12">
                            <p style="color: red;"><?php echo htmlentities($_SESSION['msg']); ?></p>
                            <table class="table table-hover" id="sample-table-1">
                                <thead>
                                <tr>
                                    <th class="center">#</th>
                                    <th class="hidden-xs">Patient Name</th>
                                    <th>Specialization</th>
                                    <th>Consultancy Fee</th>
                                    <th>Appointment Date / Time</th>
                                    <th>Appointment Creation Date</th>
                                    <th>Current Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <?php
                                $sql = mysqli_query($con, "SELECT users.id AS userId, users.fullName AS fname, appointment.* FROM appointment JOIN users ON users.id=appointment.userId WHERE appointment.doctorId='" . $_SESSION['id'] . "'");
                                $cnt = 1;
                                while ($row = mysqli_fetch_array($sql)) {
                                    ?>
                                    <tr>
                                        <td class="center"><?php echo $cnt; ?>.</td>
                                        <td class="hidden-xs"><?php echo $row['fname']; ?></td>
                                        <td><?php echo $row['doctorSpecialization']; ?></td>
                                        <td><?php echo $row['consultancyFees']; ?></td>
                                        <td><?php echo $row['appointmentDate']; ?> / <?php echo $row['appointmentTime']; ?></td>
                                        <td><?php echo $row['postingDate']; ?></td>
                                        <td>
                                            <?php
                                            if (($row['userStatus'] == 1) && ($row['doctorStatus'] == 1)) {
                                                echo "Active";
                                            }
                                            if (($row['userStatus'] == 0) && ($row['doctorStatus'] == 1)) {
                                                echo "Canceled by Patient";
                                            }
                                            if (($row['userStatus'] == 1) && ($row['doctorStatus'] == 0)) {
                                                echo "Canceled by you";
                                            }
                                            ?>
                                        </td>
                                        <td>
                                            <div class="visible-md visible-lg hidden-sm hidden-xs">
                                                <?php if (($row['userStatus'] == 1) && ($row['doctorStatus'] == 1)) { ?>
                                                    <a href="appointment-history.php?id=<?php echo $row['id']; ?>&cancel=update&userId=<?php echo $row['userId'];?>" onClick="return confirm('Are you sure you want to cancel this appointment?')" class="btn btn-transparent btn-xs tooltips" title="Cancel Appointment" tooltip-placement="top" tooltip="Remove">Cancel</a>
                                                <?php } else {
                                                    echo "Canceled";
                                                } ?>
                                                <?php if (($row['userStatus'] == 1) && ($row['doctorStatus'] == 1) && $row['ap_status']==0 ) { ?>
                                                    <a href="appointment-history.php?id=<?php echo $row['id']; ?>&accept=update&userId=<?php echo $row['userId'];?>" onClick="return confirm('Are you sure you want to accept this appointment?')" class="btn btn-transparent btn-xs tooltips" title="Accept Appointment" tooltip-placement="top" tooltip="Update">Accept</a>
                                                <?php } if($row['ap_status']==1) {
                                                    echo "Accepted";
                                                } ?>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php
                                    $cnt = $cnt + 1;
                                }
                                ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php include('include/footer.php'); ?>
</div>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/modernizr/modernizr.js"></script>
<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="vendor/switchery/switchery.min.js"></script>
<script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
<script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
<script src="vendor/autosize/autosize.min.js"></script>
<script src="vendor/selectFx/classie.js"></script>
<script src="vendor/selectFx/selectFx.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/form-elements.js"></script>
<script>
    jQuery(document).ready(function () {
        Main.init();
        FormElements.init();
    });
</script>
</body>
</html>
