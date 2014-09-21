$(function() {
	var n;
	n=0;
//栏目切换	
	$(".list1").click(function() {
		$(".right-1").siblings().hide();
		$(this).siblings().removeClass("active");
		$(".right-1").fadeIn();
		$(this).addClass("active");
	});	 
	$(".list2").click(function() {
		$(".right-2").siblings().hide();
		$(this).siblings().removeClass("active");
		$(".right-2").fadeIn();
		$(this).addClass("active");
	});	 
	$(".list3").click(function() {
		$(".right-3").siblings().hide();
		$(this).siblings().removeClass("active");
		$(".right-3").fadeIn();
		$(this).addClass("active");
	});	 
	$(".list4").click(function() {
		$(".right-4").siblings().hide();
		$(this).siblings().removeClass("active");
		$(".right-4").fadeIn();
		$(this).addClass("active");
	});
	$(".list5").click(function() {
		$(".right-5").siblings().hide();
		$(this).siblings().removeClass("active");
		$(".right-5").fadeIn();
		$(this).addClass("active");
	});
	$(".list6").click(function() {
		$(".right-6").siblings().hide();
		$(this).siblings().removeClass("active");
		$(".right-6").fadeIn();
		$(this).addClass("active");
	});	

//命令执行
	$(".btn-cmd").click(function() {
	$.get("plugin/cmd-run.php", {command:$(".txt-cmd").val()},
	function(data){
    $(".text-cmd").html(data);
	});
	});

//取消关机
	$(".btn-cancelst").click(function() {
	$.get("plugin/cmd-run.php", { command:"shutdown -a"} );
	$(this).hide();
	$(".btn-shutdown").show();
	$(".modal-case3").hide();	
	$(".modal-case4").show();
	});
	
//取消重启	
	$(".btn-rcancelst").click(function() {
	$.get("plugin/cmd-run.php", { command:"shutdown -a"} );
	$(".btn-rshutdown").show();
	$(".modal-case1").hide();	
	$(".modal-case2").show();
	$(this).hide();
	});	
	
//定时关机	
	$(".btn-shutdown").click(function() {
	var timex,shutdownstring;
	timex = $(".txt-time").val() * 60;
	shutdownstring = "shutdown -s -t " + timex;
	$.get("plugin/cmd-run.php", { command:shutdownstring} );
	$.get("plugin/shutdown-time.php", { time:timex} );	
	$(".btn-cancelst").show();	
	$(this).hide();
	$(".modal-case4").hide();	
	$(".modal-case3").show();
	});
//定时重启	
	$(".btn-rshutdown").click(function() {
	var timex,shutdownstring;
	timex = $(".txt-rtime").val() * 60;
	shutdownstring = "shutdown -r -t " + timex;
	$.get("plugin/cmd-run.php", { command:shutdownstring} );
	$(this).hide();
	$(".btn-rcancelst").show();
	$(".modal-case2").hide();	
	$(".modal-case1").show();
	});

//进程管理	
	$("#process").click(function() {
	$.get("plugin/cmd-run.php",{command:"tasklist"},
	function(data){
	$(".text-tasklist").html(data);
	});	
	});

//结束进程	
	$(".btn-process").click(function() {
	var processstring;
	processstring = "taskkill /f /im " + $(".txt-process").val() + ".exe";
	$.get("plugin/cmd-run.php", { command:processstring} );
	$("#process").click;
	});

//截图	
	$(".btn-shot").click(function() {
	$.get("plugin/cmd-run.php", { command:"webserver.exe -shot"} );
	$(".imgshot").html("<a href=plugin/shot.bmp target=_blank ><img src=plugin/shot.bmp class=img-responsive id=shots></a>");
	});
	
//查看截图完毕后删除截图	
	$(".btn-delshot").click(function() {
	$.get("plugin/cmd-run.php", { command:"del shot.bmp"} );
	});	

//teamviewer重启	
	$(".btn-team").click(function() {
	var processstring;
	processstring = "taskkill /f /im Teamviewer.exe";
	$(".text-team").append("正在结束Teamviewer\n");
	$.get("plugin/cmd-run.php", { command:processstring} );	
	$(".text-team").append("成功结束Teamviewer\n");
	});		
	$(".btn-team-on").click(function() {
	$.get("plugin/cmd-run.php", { command:"webserver.exe -team"} );	
	$(".text-team").append("成功启动Teamviewer\n");
	});		
	
//声音调整	
	$(".volup").click(function() {
	$.get("plugin/cmd-run.php", { command:"webserver.exe -volup"} );	
	$(".volmute").html("静音");
	});		
	$(".voldown").click(function() {
	$.get("plugin/cmd-run.php", { command:"webserver.exe -voldown"} );
	$(".volmute").html("静音");
	});		
	$(".volmute").click(function() {
	$.get("plugin/cmd-run.php", { command:"webserver.exe -volmute"} );
	if(n%2==0){$(".volmute").html("不静音")}else{$(".volmute").html("静音")}
	n=n+1;
	});		
});