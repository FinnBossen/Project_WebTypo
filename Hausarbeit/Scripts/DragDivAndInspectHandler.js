dragElement(document.getElementById("firstNode"));
dragElement(document.getElementById("secondNode"));
dragElement(document.getElementById("thirdNode"));
dragElement(document.getElementById("fourthNode"));
dragElement(document.getElementById("fifthNode"));

var IfInside = document.getElementById("inspectZone");

function dragElement(elmnt) {

    var currentPositionX;
    var currentPositionY;

    var pin = document.getElementById(elmnt.id).childNodes;
    var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;


    elmnt.onmousedown = dragMouseDown;


    function dragMouseDown(e) {
        e = e || window.event;
        e.preventDefault();
        // get the mouse cursor position at startup:
        pos3 = e.clientX;
        pos4 = e.clientY;

        pin[1].src = "images/pinOpen.png";
        pin[1].style.transform = "translate(-20px, -60px)";
        document.onmouseup = closeDragElement;
        // call a function whenever the cursor moves:
        document.onmousemove = elementDrag;
    }

    function elementDrag(e) {
        e = e || window.event;
        e.preventDefault();
        // calculate the new cursor position:
        pos1 = pos3 - e.clientX;
        pos2 = pos4 - e.clientY;
        pos3 = e.clientX;
        pos4 = e.clientY;

        // set the element's new position:
        elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
        elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
        currentPositionY = e.clientY;
        currentPositionX = e.clientX;
    }

    function closeDragElement() {

        // stop moving when mouse button is released:
        pin[1].src = "images/pinClosed.png";
        pin[1].style.transform = "";

        for (var i = 0; i < pin.length; i++) {

            console.log(i)
            if (pin[i].className == "PreviewPictureNode") {

                document.getElementById("InspectExperimentPicture").src =
                    pin[i].src;
                break;
            }
            if (pin[i].className == "ExperimentName") {
                document.getElementById("ExperimentNameInspetion").innerHTML = pin[i].innerHTML;
            }
        }
        if (isEventInElement(currentPositionX, currentPositionY, IfInside)) {

            if (elmnt.id === "firstNode") {

                document.getElementById("ExperimentLink").href = "Experiment1/Experiment1.html";
                document.getElementById("Description").style.display = "unset";
                document.getElementById("Description2").style.display = "none";
                document.getElementById("Description3").style.display = "none";
                document.getElementById("Description4").style.display = "none";
                document.getElementById("Description5").style.display = "none";
            } else if (elmnt.id === "secondNode") {
                document.getElementById("ExperimentLink").href = "Experiment2/Experiment2.html";
                document.getElementById("Description").style.display = "none";
                document.getElementById("Description2").style.display = "unset";
                document.getElementById("Description3").style.display = "none";
                document.getElementById("Description4").style.display = "none";
                document.getElementById("Description5").style.display = "none";
            } else if (elmnt.id === "thirdNode") {
                document.getElementById("ExperimentLink").href = "Experiment3/";
                document.getElementById("Description").style.display = "none";
                document.getElementById("Description2").style.display = "none";
                document.getElementById("Description3").style.display = "unset";
                document.getElementById("Description4").style.display = "none";
                document.getElementById("Description5").style.display = "none";
            } else if (elmnt.id === "fourthNode") {

                document.getElementById("ExperimentLink").href = "Experiment4/index.html";
                document.getElementById("Description").style.display = "none";
                document.getElementById("Description2").style.display = "none";
                document.getElementById("Description3").style.display = "none";
                document.getElementById("Description4").style.display = "unset";
                document.getElementById("Description5").style.display = "none";
            } else if (elmnt.id === "fifthNode") {
                document.getElementById("ExperimentLink").href = "Referat/index.html";
                document.getElementById("Description").style.display = "none";
                document.getElementById("Description2").style.display = "none";
                document.getElementById("Description3").style.display = "none";
                document.getElementById("Description4").style.display = "none";
                document.getElementById("Description5").style.display = "unset";
            }
        }
        document.onmouseup = null;
        document.onmousemove = null;
    }
}


function isEventInElement(event1, event2, element) {
    var rect = element.getBoundingClientRect();
    var x = event1;
    console.log(event1);

    if (x < rect.left || x >= rect.right) return false;
    var y = event2;
    console.log(event2);
    if (y < rect.top || y >= rect.bottom) return false;
    else {
        document.getElementById("curtainLeft").style.transform = "translateX(0)";
        document.getElementById("curtainRight").style.transform = "translateX(100%)";


        return true
    }
    ;

}