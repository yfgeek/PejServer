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
});