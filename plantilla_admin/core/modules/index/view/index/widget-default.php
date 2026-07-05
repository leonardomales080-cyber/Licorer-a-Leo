<?php
UserData::verificaSession();
date_default_timezone_set("America/Bogota");
$fechahoy = date("Y-m-d");
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INDEX</title>
</head>

<body>
    <h1>ESTOY EN INDEX</h1>
    <h2>Bienvenido</h2>
    <?php
    $lista_de_ids_roles = $_SESSION['roles'];
    // Validamos si el usuario tiene roles asignados
    if (!empty($lista_de_ids_roles)) {
        // implode junta los elementos del array con el separador que elijas
        echo "Roles del usuario: " . implode(", ", $lista_de_ids_roles);
    } else {
        echo "El usuario no tiene roles asignados.";
    }
    ?>
    <hr>
    <?php
    echo "ROL ACTUAL :" . $_SESSION['user_rol'];
    ?>
</body>

</html>