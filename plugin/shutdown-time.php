<?php 
header("Content-type: text/html; charset=gb2312"); 
$myfile = fopen("../tmp/time.txt", "w") or die("Unable to open file!");
fwrite($myfile, $time);
fclose($myfile);
?>