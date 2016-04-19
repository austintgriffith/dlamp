<?php
echo "<h2>Import...</h2>";
//phpinfo();
$dbname = "marketing_M5541";

$mysqli = new mysqli("mysql", "root", "supersecret123");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error."";
    echo "<div><b>Server may still be booting up...</b></div>";
    exit(0);
}

if (!$mysqli->query("CREATE DATABASE IF NOT EXISTS $dbname")){
    echo "Failed to create database.";
    exit(0);
}

if(!$mysqli->select_db("hellodatabase")){
    echo "Failed to select database.";
    exit(0);
}
echo "DB Created, running import....";
ob_flush();
flush(); 
passthru("mysql -h mysql -u root -psupersecret123 $dbname < marketing_M5541_2016-04-18.sql");

?>
