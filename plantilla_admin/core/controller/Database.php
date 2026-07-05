<?php

class Database
{
    public static $db;
    public static $con;

    public $user = "";
    public $pass = "";
    public $puerto = "";
    public $host = "";
    public $ddbb = "";



    public function __construct()
    {


        $this->host = "localhost";
        $this->ddbb = "db_empresa_foto";
        $this->user = "root";
        $this->pass = "";
        $this->puerto = "3306";
    }

    function connect()
    {
        try {
            // Configuración moderna y limpia
            $dsn = "mysql:host=$this->host;dbname=$this->ddbb;charset=utf8mb4";
            $con = new PDO($dsn, $this->user, $this->pass);
            $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $con->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
            $con->exec("SET time_zone = '-05:00';");
            return $con;
        } catch (PDOException $e) {
            die("No se puede conectar a la base de datos" . $e->getMessage());
        }
    }

    public static function getCon()
    {
        if (self::$con == null && self::$db == null) {
            self::$db = new Database();
            self::$con = self::$db->connect();
        }
        return self::$con;
    }
}
