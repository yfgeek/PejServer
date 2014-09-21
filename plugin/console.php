
<h3>运行状态</h3>
	<blockquote>
	<p>您的基本信息及权限</p>
	</blockquote>
	<table class="table table-striped">
	<tr>
	<td>您的IP</td>
	<td><?php echo $_SERVER['REMOTE_ADDR']?></td>
	</tr>
	<tr>
	<td>用户权限</td>
	<td><?php system(whoami)?></td>
	</tr>
	<tr>
	<td>内存总量</td>


	<td><?php echo memory_get_usage()?>MB</td>
	</tr><tr>
	<td>运行时间</td>
	<td></td>
	</tr>	
	</table>
<?php
//$infosys =explode(" ", system('systeminfo'))
?>	
	