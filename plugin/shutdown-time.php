<?php 
header("Content-type: text/html; charset=gb2312"); 
$myfile = fopen("../tmp/time.json", "w") or die("Unable to open file!");
$arr = array ('shutdown'=>$shutdown,'time'=>$time,'timex'=>$timex);
fwrite($myfile, json_encode($arr));
fclose($myfile);
?>