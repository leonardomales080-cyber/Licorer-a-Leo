<?php
if (isset($_POST['btn-login'])) {
    $ucedula = $_POST['txtCedula'];
    $upass = $_POST['txtPassword'];
    if (UserData::getLogin($ucedula, $upass)) {
        Core::redir("./?view=index");
    } else {
        print "<script>window.location='./'</script>";
        $error = "Acceso fallido !";
    }
}
