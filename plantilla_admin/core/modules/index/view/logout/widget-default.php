<?php

// -- eliminamos el usuario
if (isset($_SESSION['user_idrol'])) {
    unset($_SESSION['user_idrol']);
}
session_destroy();
print "<script>window.location='index.php';</script>";
?>

