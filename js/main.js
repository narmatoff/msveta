$(document).ready(function () {


	//	main_flexslider
	$('.main_flexslider').flexslider({
		animation: "slide"
	});

	//    aside_flexslider
	$('.aside_flexslider').flexslider({
		animation: "fade"
	});


	//закладки регионов на галвной
	$(".head_add div").hide(); // Скрываем содержание
	$(".heading div:first").attr("class", "active_btn"); // Активируем первую закладку
	$(".head_add div:first").fadeIn(); // Выводим содержание

	$('.heading div').click(function (e) {
		e.preventDefault();
		$(".head_add div").hide(); //Скрыть все сожержание
		$(".heading div").attr("class", ""); //Сброс ID
		$(this).attr("class", "active_btn"); // Активируем закладку
		$('#' + $(this).attr('title')).fadeIn(); // Выводим содержание текущей закладки
	});



//	catalog menu events
	$(".catalogbtn").click(function () {
		$(".catalog").toggleClass("showCat");
	});

	$("body").click(function (event) {
		if ($(event.target).closest(".catalogbtn").length === 0) {
			$(".catalog").removeClass("showCat");
		}
	});
//end catalog menu events


});
