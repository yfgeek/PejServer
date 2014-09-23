<?php include("header.php");?>

<div class="col-md-3 lft"><h3 class="title"><?php echo $_SERVER["SERVER_NAME"] ?></h3>
	<div class="list-group lists">
	<a href="#" class="list-group-item active list1">配置文件</a>	
	<a href="#" class="list-group-item list2">操作记录</a>	
	</div>
</div>
<div class="col-md-9">
	<div class="right-1" >	
		<?php include("plugin/config.php");?>
	</div>
	<div class="right-2" style="display:none">	
		<?php include("plugin/file.php");?>
	</div>

</div> 

</div>
</div>

<?php include("footer.php");?>
