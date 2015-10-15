$(document).ready(function() {


    //  main_flexslider
    $('.main_flexslider').flexslider({
        animation: "slide"
    });

    //    aside_flexslider
    $('.aside_flexslider').flexslider({
        animation: "fade"
    });


    //bookmarks for region area on main page
    var locnHash = window.location.hash;

    if (locnHash) {
        //      console.log("не");
        $(".head_add div, .type_gallery div").hide(); //hide all content
        $(".heading div").attr("class", ""); //reset ID
        $(locnHash).attr("class", "active_btn"); // activate bookmark
        $('.' + $(locnHash).attr('data-tab')).fadeIn(); // show content on current bookmark
    } else {

        //bookmarks for region area on main page
        $(".head_add div, .type_gallery div").hide(); // hide content
        $(".heading div:first").attr("class", "active_btn"); // activate first bookmark
        $(".head_add div:first, .type_gallery div:first").fadeIn(); // show content
    }



    $('.heading div').click(function(e) {
        e.preventDefault();
        $(".head_add div, .type_gallery div").hide(); //hide all content
        $(".heading div").attr("class", ""); //reset ID
        $(this).attr("class", "active_btn"); // activate bookmark
        $('.' + $(this).attr('data-tab')).fadeIn(); // show content on current bookmark
    });


    //  catalog menu events
    $(".catalogbtn").click(function() {
        //      $(".catalog").toggle( "slow" );
        $(".catalog").toggleClass("showCat");
    });

    $("body").click(function(event) {
        if ($(event.target).closest(".catalogbtn").length === 0) {
            $(".catalog").removeClass("showCat");
        }
    });
    //end catalog menu events

    //  top menu events
    $(".burger_top_menu").click(function() {
        //      $(".catalog").toggle( "slow" );
        $(".top_menu").toggleClass("show_top_menu");
    });


    $(".maglink_nphone_item a").click(function() {
        /* Act on the event */
        $(this).parent(".maglink_nphone_item").children('.maglink_nphone_item_links').show(100);

        console.log("11111111111");

        // if ($(this).parent("maglink_nphone_item").children('maglink_nphone_item_links').css({display: "none"})) {
        //     console.log("11111111111");
        // } else {
        //     console.log("2222222222");

        // }
    });

    // скрыть блоки по клику body
    $("body").click(function(event) {
        // меню
        if ($(event.target).closest(".burger_top_menu").length === 0) {
            $(".top_menu").removeClass("show_top_menu");
        }

        // телефоны

        if ($(window).width() < 1024) {
            if ($(event.target).closest(".maglink_nphone_item a").length === 0) {
                $(".maglink_nphone_item_links").hide(100);
            }
        }
    });

    //end catalog menu events

    //  fancybox_init
    // $("[rel=single_1]").fancybox({
    //              caption : {
    //                  type : 'outside'
    //              },
    //              openEffect  : 'elastic',
    //              closeEffect : 'elastic',
    //              nextEffect  : 'elastic',
    //              prevEffect  : 'elastic'
    //          }); 
    $(".type_gallery ul li a").fancybox({
        caption: {
            type: 'outside'
        },
        openEffect: 'elastic',
        closeEffect: 'elastic',
        nextEffect: 'elastic',
        prevEffect: 'elastic'
    });


    //  fancybox_form_init
    $(".connect_partnership").fancybox({
        openEffect: 'elastic',
        closeEffect: 'elastic'
    });

    $('.connect_partnership').click(function() {
        id = $(this).data('id');
        $.ajax({
            url: '/udata://webforms/add/92/?transform=/modules/ajax_form.xsl',
            dataType: 'html',
            success: function(data) {
                $("form#feedback_form").html(data);
            }
        });
    });



    $('#feedback_form').bind('submit', function() {
        console.debug($("#feedback_form").serialize());
        $.ajax({
            type: 'POST',
            url: '/webforms/send/',
            data: $("#feedback_form").serialize(),
            success: function(data) {
                var msg = '<span>Спасибо! Ваше сообщение отправленно! Мы свяжемся с вами!</span>';
                $("form#feedback_form").html(msg);
                setTimeout(function() {
                    $.fancybox.close();
                }, 4500);
            }
        });
        return false;


    });
    // Initialize scrollbar
    //    jQuery('.catalog').scrollbar();

    // EGG init
    var egg = new Egg();
    egg.AddCode("up,up,down,down,left,left,right,right", function() {

            $('#egggif').fadeIn(500, function() {
                window.setTimeout(function() {
                    $('#egggif').hide();
                }, 40000);

            });

        }, "konami-code")
        .AddHook(function() {
            //     console.log("Hook called for: " + this.activeEgg.keys);
            //     console.log(this.activeEgg.metadata);
        }).Listen();



    //     check flexbox by modernizr
    if (Modernizr.flexbox) {
        // функции
        console.log('flexbox & svg: ok');
    } else {

        alert("Вы используете устаревшую версию интернет обозревателя, пожалуйста обновите ваш обозреватель. Если у вас iPad или iPhone - обновите вашу операционную систему.");
    }



});
