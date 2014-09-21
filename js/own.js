$(function() {
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

	$(".btn-cmd").click(function() {
	$.get("plugin/cmd-run.php", {command:$(".txt-cmd").val()},
	function(data){
    $(".text-cmd").html(data);
	});
	});
	
	$(".btn-shutdown").click(function() {
	var timex,shutdownstring;
	timex = $(".txt-time").val() * 60;
	shutdownstring = "shutdown -s -t " + timex;
	$.get("plugin/cmd-run.php", { command:shutdownstring} );
	});

	$(".btn-cancelst").click(function() {
	$.get("plugin/cmd-run.php", { command:"shutdown -a"} );
	});
	
	$(".btn-shutdown").click(function() {
	var timex,shutdownstring;
	timex = $(".txt-time").val() * 60;
	shutdownstring = "shutdown -s -t " + timex;
	$.get("plugin/cmd-run.php", { command:shutdownstring} );
	});
	
	$(".btn-rshutdown").click(function() {
	var timex,shutdownstring;
	timex = $(".txt-rtime").val() * 60;
	shutdownstring = "shutdown -r -t " + timex;
	$.get("plugin/cmd-run.php", { command:shutdownstring} );
	});
	
	$("#process").click(function() {
	$.get("plugin/cmd-run.php", {command:"tasklist"},
	function(data){
    $(".text-tasklist").html(data);
	});	
	});
	$(".btn-process").click(function() {
	var processstring;
	processstring = "taskkill /f /im " + $(".txt-process").val() + ".exe";
	$.get("plugin/cmd-run.php", { command:processstring} );
	$("#process").click;
	});
	
	$(".btn-shot").click(function() {
	$.get("plugin/cmd-run.php", { command:"webserver.exe -shot"} );
	$(".imgshot").html("<a href=plugin/shot.bmp target=_blank ><img src=plugin/shot.bmp class=img-responsive id=shots></a>");
	});	
	
	$(".btn-delshot").click(function() {
	$.get("plugin/cmd-run.php", { command:"del shot.bmp"} );
	});	
	
});