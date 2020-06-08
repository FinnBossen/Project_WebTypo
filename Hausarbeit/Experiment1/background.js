var layer = project.activeLayer;
var canvasSize=this.view.size;
var maxRadius=Math.min(canvasSize.width*0.5,canvasSize.height*0.5);
var view = this.view;

var rec1 = [];
var rec2 = [];

var randomdes1 = [];
var randomdes2 = [];

var options = {
    animate: true,
    patternWidth: 100,
    patternHeight: 100,
    grainOpacity: 0.4,
    grainDensity: 1.5,
    grainWidth: 0.6,
    grainHeight: 0.6
};

grained('#container', options);


initPaths();



function initPaths() {

    for (i = 0; i <= 9; i++) {
        var rectangle = new Rectangle([20, 20], [450, 450]
        );
        var path = new Path.Rectangle(rectangle)
        path.style = {
            fillColor: '#46768C',
        };

        path.rotate(45)
        path.scale(1, 2);

        path.opacity = 0.5;
        var symbol = new Symbol(path);
        console.log(view.size.multiply(Point.random()));

        symbol.place(view.size.multiply(Point.random()));
        rec1.push(symbol)

        var path2 = new Path.Rectangle(rectangle);
        path2.style = {
            fillColor: '#33334C',
        };


        path2.rotate(45);
        path2.scale(1, 2);

        path2.opacity = 0.5;
        var symbo2 = new Symbol(path2);

        symbo2.place(view.size.multiply(Point.random()));
        rec2.push(symbo2);
    }






}
for (i = 0; i <= project.activeLayer.children.length; i++) {
    randomdes1.push(Point.random()* view.size) ;

}


function onFrame(event) {
//initPaths();

    for (var i = 0; i < project.activeLayer.children.length ; i++) {
        var item = project.activeLayer.children[i];

        var vector = randomdes1[i] - item.position;
        // Move the item 1/20th of its width to the right. This way
        // larger circles move faster than smaller circles:
        item.position+= vector/ 160;

        // If the item has left the view on the right, move it back
        // to the left:
        if (vector.length < 5) {
           randomdes1[i]= Point.random() * view.size;
        }

    }





}




// Reposition and rescale the paths whenever the window is resized:

function onResize(event) {
    canvasSize = view.size;
    maxRadius = Math.min(canvasSize.width * 0.5, canvasSize.height * 0.5) * 0.95;

    layer.position = view.center;



}

