var IDs = [];
var scrollTrigger ;
var firstTrigger;
var CurrentID;
var lastTrigger;

$( document ).ready(function() {

    $("svg").find("tspan").each(function(){ IDs.push(this.id); });

    console.log(IDs);
    firstTrigger =100/IDs.length;
   lastTrigger = 0;
    scrollTrigger = firstTrigger;
    CurrentID = 0;
});


    $(window).on('scroll', function(){

    var s = $(window).scrollTop(),
        d = $(document).height(),
        c = $(window).height();

    var scrollPercent = (s / (d - c)) * 100;
    $( "tspan" ).each(function() {
        if(scrollPercent > scrollTrigger) {

            lastTrigger = scrollTrigger;
            scrollTrigger = scrollTrigger + firstTrigger-0.00009;
            console.log("ID: #"+IDs[CurrentID]+"added");
            console.log("ScrollTrigger"+scrollTrigger);
            console.log("Percentage"+scrollPercent);

            $('#' + IDs[CurrentID]).fadeIn();
            $('#Q' + IDs[CurrentID]).addClass('hidden');
            $('#Q' + IDs[CurrentID]).fadeOut();



            CurrentID++;
        }
        if(scrollPercent < lastTrigger){
            CurrentID--;

            scrollTrigger = lastTrigger;
            lastTrigger = lastTrigger - firstTrigger-0.00009;
            console.log("ID: #"+IDs[CurrentID]+"removed");
            console.log("ScrollTrigger"+scrollTrigger);
            console.log("Percentage"+scrollPercent);
            $('#' + IDs[CurrentID]).fadeOut();
            $('#Q' + IDs[CurrentID]).fadeIn();
            $('#Q' + IDs[CurrentID]).removeClass('hidden');





        }
    });




});