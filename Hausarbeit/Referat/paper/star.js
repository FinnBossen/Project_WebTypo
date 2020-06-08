var layer = project.activeLayer;
var canvasSize=this.view.size;
var maxRadius=Math.min(canvasSize.width*0.5,canvasSize.height*0.5);

var values = {
    count: 34,
    points: 32
    
};

initPaths();

function initPaths()
{
    layer.children=undefined;
for (var i = 0; i < values.count; i++) {
    var path = new Path({
        fillColor: i % 2 ? 'red' : 'black',
        closed: true
    });

    var offset = new Point(20 + ((maxRadius-40)/values.points) * i, 0);
    var l = offset.length;
    for (var j = 0; j < values.points * 2; j++) {
        offset.angle += 360 / values.points;
        var vector = offset.normalize(l * (j % 2 ? 0.1 : -0.1));
        path.add(offset + vector);
    }
    path.smooth({ type: 'continuous' });
    layer.insertChild(0, new Group({
        children: [path],
        applyMatrix: false
    }));
}
}


function onFrame(event) {
    for (var i = 0; i < values.count; i++) {
        var item = layer.children[i];
        var angle = (values.count - i) * Math.sin(event.count / 128) / 10;
        item.rotate(angle);
    }
}

// Reposition and rescale the paths whenever the window is resized:
function onResize(event) {
    canvasSize=view.size;
    maxRadius=Math.min(canvasSize.width*0.5,canvasSize.height*0.5)*0.95;
    initPaths();
    layer.position = view.center;
}