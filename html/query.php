<?php
echo "<h2>Query...</h2>";
ini_set('memory_limit', '-1');
//phpinfo();
$dbname = "marketing_M5541";

$mysqli = new mysqli("mysql", "root", "supersecret123",$dbname);
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error."";
    echo "<div><b>Server may still be booting up...</b></div>";
    exit(0);
}

$query = "SELECT device, SUM(`AllConversions`) as conversions, SUM(Clicks)  as clicks from gads_keywords where date between '2016-01-02' AND '2016-04-01' GROUP BY device";
//$query = "SELECT * FROM gads_campaigns";
echo "<div>Making query: $query</div>";
$start = microtime(true);
$result = $mysqli->query($query);
$time_elapsed_secs = microtime(true) - $start;
echo "<div>Done with query in $time_elapsed_secs</div>";


echo "<ul>";
while ($row = $result->fetch_object()){
   echo "<li>".print_r($row,true)."</li>";
}
echo "</ul>";

?>
