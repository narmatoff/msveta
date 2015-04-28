$(document).ready(function () {


	//	main_flexslider
	$('.main_flexslider').flexslider({
		animation: "slide"
	});

	//    aside_flexslider
	$('.aside_flexslider').flexslider({
		animation: "fade"
	});


	//bookmarks for region area on main page
	$(".head_add div").hide(); // hide content
	$(".heading div:first").attr("class", "active_btn"); // activate first bookmark
	$(".head_add div:first").fadeIn(); // show content

	$('.heading div').click(function (e) {
		e.preventDefault();
		$(".head_add div").hide(); //hide all content
		$(".heading div").attr("class", ""); //reset ID
		$(this).attr("class", "active_btn"); // activate bookmark
		$('#' + $(this).attr('title')).fadeIn(); // show content on current bookmark
	});



//	catalog menu events
	$(".catalogbtn").click(function () {
//		$(".catalog").toggle( "slow" );
		$(".catalog").toggleClass("showCat");
	});

	$("body").click(function (event) {
		if ($(event.target).closest(".catalogbtn").length === 0) {
			$(".catalog").removeClass("showCat");
		}
	});
//end catalog menu events

//	top menu events
	$(".burger_top_menu").click(function () {
//		$(".catalog").toggle( "slow" );
		$(".top_menu").toggleClass("show_top_menu");
	});

	$("body").click(function (event) {
		if ($(event.target).closest(".burger_top_menu").length === 0) {
			$(".top_menu").removeClass("show_top_menu");
		}
	});
//end catalog menu events


});
