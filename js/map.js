var myMap;
ymaps.ready(init);

var userDeviceArray = [
    {device: 'Android', platform: /Android/},
    {device: 'iOS', platform: /iPhone/},
    {device: 'iOS', platform: /iPad/}
];
var platform = navigator.userAgent;
function getPlatform() {
    for (var i in userDeviceArray) {
        if (userDeviceArray[i].platform.test(platform)) {
            return userDeviceArray[i].device;
        }
    }
    return null;
}


function open(id) {
    objectManager.objects.balloon.open(id);
}

function detectmob() {
   if(window.innerWidth <= 800 && window.innerHeight <= 600) {
     return true;
   } else {
     return false;
   }
}

function init() {
    myMap = new ymaps.Map('maps_main', {
        center: [59.939095, 30.315868],
        zoom: 11,
        controls: ['zoomControl', 'typeSelector'],
    },{
        suppressMapOpenBlock: true
    });
    if (detectmob()) {   
        myMap.behaviors.disable('drag');
    }
    objectManager = new ymaps.ObjectManager();
    objectManager.objects.options.set({
        iconLayout: 'default#image',
        iconImageHref: '/images/icons/map-icon.png',
        iconImageOffset: [-35, -60],
        iconImageSize: [72, 68]
    });

    myMap.geoObjects.add(objectManager);

    $.ajax({
        url: "/udata://custom/maps.json?user_agent="+getPlatform()
    }).done(function(data) {
        objectManager.add(data);
        // myMap.setBounds(objectManager.getBounds());
        if ($('div.active_btn').attr('data-id')) {
        	open($('div.active_btn').attr('data-id'));
        }
    });
    objectManager.objects.events.add('click', function(e) {
        var objectId = e.get('objectId');
        $(".head_add div, .type_gallery div").hide(); //hide all content
        $(".heading div").attr("class", ""); //reset ID
        $('[data-id=' + objectId + ']').attr("class", "active_btn"); // activate bookmark
        $('.' + $('[data-id=' + objectId + ']').attr('data-tab')).fadeIn(); // show content on current bookmark
    });
    $('.heading div').click(function() {
        open($('div.active_btn').attr('data-id'));
    });

    $(".maps-contact").click(function () {
		open($(this).attr('data-id'));
	});
}