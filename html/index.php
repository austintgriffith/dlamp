<?php
echo "<h1>Lamp Lamp</h1>";
//phpinfo();

$mysqli = new mysqli("mysql", "root", "supersecret123");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    exit(0);
}

if (!$mysqli->query("CREATE DATABASE IF NOT EXISTS hellodatabase")){
    echo "Failed to create database.";
    exit(0);
}

if(!$mysqli->select_db("hellodatabase")){
    echo "Failed to select database.";
    exit(0);
}

$result = $mysqli->query("INSERT INTO hellotable (id) VALUES (".rand(1000000,9999999).")");
echo "<div><i>Insert result: $result</i></div>";

if(!$result){
    echo "Creating Table...";
    $mysqli->query("CREATE TABLE hellotable(id INT)");
}else{
    $result = $mysqli->query("SELECT * FROM hellotable");
    echo "<ul>";
    while ($row = $result->fetch_object()){
       echo "<li>".print_r($row,true)."</li>";
    }
    echo "</ul>";
}




?>
