var container = document.getElementById('box1');

const app = new PIXI.Application({transparent: true}, {autoResize: true,});
app.renderer.resize(container.clientWidth, container.clientHeight);
document.getElementById('sticky').appendChild(app.view);
app.view.setAttribute("id", "DepthPicture");

var texture01 = PIXI.Texture.fromFrame("images/Working Finn.png");
var texture02 = PIXI.Texture.fromFrame("images/Matrix.png");
var texture03 = PIXI.Texture.fromFrame("images/ShawshankRedemptionRain.png");
var texture04 = PIXI.Texture.fromFrame("images/ThanosPortal.png");
var texture05 = PIXI.Texture.fromFrame("images/hacker.png");
var texture06 = PIXI.Texture.fromFrame("images/NormalPose.png");

const img = new PIXI.Sprite(texture06);


img.width = 1000;
img.height = 1000;
app.stage.addChild(img);

var depthTexture01 = PIXI.Texture.fromFrame("images/Working Finn_Depth.png");
var depthTexture02 = PIXI.Texture.fromFrame("images/Matrix_Depth.png");
var depthTexture03 = PIXI.Texture.fromFrame("images/ShawshankRedemptionRainDepth.png");
var depthTexture04 = PIXI.Texture.fromFrame("images/ThanosPortalDepth.png");
var depthTexture05 = PIXI.Texture.fromFrame("images/hackerDepth.png");
var depthTexture06 = PIXI.Texture.fromFrame("images/NormalPoseDepth.png");


const depthMap = new PIXI.Sprite(depthTexture06);


depthMap.width = 1000;
depthMap.height = 1000;

app.stage.addChild(depthMap);

displacementFilter = new PIXI.filters.DisplacementFilter(depthMap);
app.stage.filters = [displacementFilter];

checkMediaQuerry();

$(window).resize(function () {
    var typeText = document.getElementById("changingShortText");
    var typeText1 = document.getElementById("changingShortText1");
    var typeText2 = document.getElementById("changingShortText2");
    var typeText3 = document.getElementById("changingShortText3");
    var typeText4 = document.getElementById("changingShortText4");
    var typeText5 = document.getElementById("changingShortText5");

    typeText.style.animation = 'none';
    typeText.offsetHeight; /* trigger reflow */
    typeText.style.animation = null;

    typeText1.style.animation = 'none';
    typeText1.offsetHeight; /* trigger reflow */
    typeText1.style.animation = null;

    typeText2.style.animation = 'none';
    typeText2.offsetHeight; /* trigger reflow */
    typeText2.style.animation = null;

    typeText3.style.animation = 'none';
    typeText3.offsetHeight; /* trigger reflow */
    typeText3.style.animation = null;

    typeText4.style.animation = 'none';
    typeText4.offsetHeight; /* trigger reflow */
    typeText4.style.animation = null;

    typeText5.style.animation = 'none';
    typeText5.offsetHeight; /* trigger reflow */
    typeText5.style.animation = null;
    app.renderer.resize(container.clientWidth, container.clientHeight);

    img.width = 1000;
    img.height = 1000;
    depthMap.width = 1000;
    depthMap.height = 1000;
    document.getElementById("changingShortText5").style.display = "none";
    document.getElementById("changingShortText4").style.display = "none";
    document.getElementById("changingShortText3").style.display = "none";
    document.getElementById("changingShortText2").style.display = "none";
    document.getElementById("changingShortText1").style.display = "none";
    document.getElementById("changingShortText").style.display = "none";
    document.getElementById("rain").style.display = "none";
    document.getElementById("MatrixRain").style.display = "none";
    document.getElementById("Portal").style.display = "none";

    checkMediaQuerry();


});


var balls = document.getElementsByClassName("ball");

var containerEyes = document.getElementById("eyes");


window.onmousemove = function (e) {
    displacementFilter.scale.x = (window.innerWidth / 2 - e.clientX) / 20;
    displacementFilter.scale.y = (window.innerHeight / 2 - e.clientY) / 20;

    var rect = containerEyes.getBoundingClientRect();

    var x = (event.clientX - rect.left) * 100 / window.innerWidth + "%";
    var y = (event.clientY - rect.top) * 100 / window.innerHeight + "%";

    console.log(x);
    console.log(y);
    //event.clientX => get the horizontal coordinate of the mouse
    //event.clientY => get the Vertical coordinate of the mouse
    //window.innerWidth => get the browser width
    //window.innerHeight => get the browser height


    for (var i = 0; i < 4; i++) {
        if (parseFloat(x) < 80 && parseFloat(x) > 15) {
            balls[i].style.cx = x;
        }
        if (parseFloat(y) > 15 && parseFloat(y) < 85)
            balls[i].style.cy = y;
    }

    console.log(x + "&" + y)

};


function checkMediaQuerry() {
    var $theWindowSize = $(this).width();
    if ($theWindowSize <= 500) {


        document.getElementById("MatrixRain").style.display = "unset";
        document.getElementById("rain").style.display = "none";
        // You can use the 'screen' property as the renderer visible
        // area, this is more useful than view.width/height because
        // it handles resolution

        img.texture = texture02;
        depthMap.texture = depthTexture02;
        img.width = container.clientWidth;
        img.height = container.clientHeight;
        depthMap.width = container.clientWidth;
        depthMap.height = container.clientHeight;
        document.getElementById("changingShortText1").style.display = "unset";
        document.getElementById("changingShortText2").style.display = "none";
        displacementFilter = new PIXI.filters.DisplacementFilter(depthMap);
        app.stage.filters = [displacementFilter];

    } else if ($theWindowSize > 500 && $theWindowSize <= 784) {
        document.getElementById("changingShortText1").style.display = "none";
        document.getElementById("MatrixRain").style.display = "none";
        document.getElementById("rain").style.display = "unset";
        document.getElementById("Portal").style.display = "none";
        document.getElementById("changingShortText2").style.display = "unset";

        img.texture = texture03;
        depthMap.texture = depthTexture03;
        document.getElementById("box1").style.backgroundImage = "url(images/night.png)";
        AnimationSwitcher = false;
        displacementFilter = new PIXI.filters.DisplacementFilter(depthMap);
        app.stage.filters = [displacementFilter];

        document.getElementById("changingShortText3").style.display = "none";
    } else if ($theWindowSize > 784 && $theWindowSize <= 1068) {
        document.getElementById("Portal").style.display = "unset";
        document.getElementById("rain").style.display = "none";
        document.getElementById("changingShortText2").style.display = "none";
        document.getElementById("changingShortText").style.display = "none";
        document.getElementById("changingShortText3").style.display = "unset";
        img.texture = texture04;
        depthMap.texture = depthTexture04;
        AnimationSwitcher = true;
        document.getElementById("box1").style.backgroundImage = "url(images/space.jpg)"
        displacementFilter = new PIXI.filters.DisplacementFilter(depthMap);
        app.stage.filters = [displacementFilter];
    } else if ($theWindowSize > 1068 && $theWindowSize <= 1352) {
        document.getElementById("Portal").style.display = "none";
        document.getElementById("changingShortText3").style.display = "none";
        img.texture = texture01;
        depthMap.texture = depthTexture01;
        AnimationSwitcher = false;
        document.getElementById("box1").style.backgroundImage = "url(images/working.jpg)";
        document.getElementById("changingShortText").style.display = "unset";
        document.getElementById("changingShortText4").style.display = "none";
        displacementFilter = new PIXI.filters.DisplacementFilter(depthMap);
        app.stage.filters = [displacementFilter];
    } else if ($theWindowSize > 1352 && $theWindowSize <= 1636) {
        document.getElementById("changingShortText").style.display = "none";

        app.renderer.resize(container.clientWidth * 0.75, container.clientHeight);
        img.width = 1200;
        img.height = 1200;
        depthMap.width = 1200;
        depthMap.height = 1200;
        img.texture = texture05;
        depthMap.texture = depthTexture05;
        document.getElementById("box1").style.backgroundImage = "url(images/coding.jpg)"
        displacementFilter = new PIXI.filters.DisplacementFilter(depthMap);
        app.stage.filters = [displacementFilter];
        document.getElementById("changingShortText4").style.display = "unset";
        document.getElementById("changingShortText5").style.display = "none";
    } else if ($theWindowSize > 1636) {
        app.renderer.resize(container.clientWidth / 2, container.clientHeight);
        img.texture = texture06;
        depthMap.texture = depthTexture06;
        document.getElementById("changingShortText4").style.display = "none";
        document.getElementById("changingShortText5").style.display = "unset";
        document.getElementById("box1").style.backgroundImage = "url(images/peopleBackground.jpg)"
        displacementFilter = new PIXI.filters.DisplacementFilter(depthMap);
        app.stage.filters = [displacementFilter];

    }
}
