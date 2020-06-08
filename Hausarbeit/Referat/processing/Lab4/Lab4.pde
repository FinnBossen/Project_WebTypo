
Konus konus;
Zylinder zylinder;
Sphere sphere1;
Sphere sphere2;
World world;
boolean showShadows;
boolean showAxis;
Axis3D axis3d;
Grid grid;
Camera camera;
HelpControl help;

private int[] input_key; //define keyCodes for player input
private boolean[] input_held; //define keyCodes for player input


void setup()
{
  showShadows=false;
  showAxis=true;
  world=new World();
  camera=new Camera();
  frameRate(60);
  grid=new Grid(10, 10, 100);

  size(1200, 700, P3D);
  konus=new Konus(new PVector(0, 300, 0), new PVector(0, 0, 0), 100, 100, 16, true);
  zylinder=new Zylinder (new PVector(300, 0, 0), new PVector(0, 0, 0), 100, 100, 16, true);
  sphere1=new Sphere (new PVector(0, 0, 0), new PVector(0, 0, 0), 100, 100, 12, true);
  sphere2=new Sphere (new PVector(200, 100, 200), new PVector(0, 0, 0), 100, 100, 12, true);
  axis3d=new Axis3D();
  axis3d.setScale(100);


  input_key=new int[6]; //control guff
  input_key[0]=38; //up
  input_key[1]=40; //down
  input_key[2]=39; //right
  input_key[3]=37; //left
  input_key[4]=93; //plus
  input_key[5]=47; //minus (dash)
  input_held=new boolean [input_key.length];
  for (int n=0; n<input_held.length; n++)
  {
    input_held[n]=false;
  }

  help=new HelpControl();
}

void draw()
{

  pushMatrix();
  camera.update();
  camera.set();
  control();


  strokeWeight(0.01);
  //noStroke();
  background(98, 72, 128);
  fill(255, 216, 50);

  /*sphere1.render();
  sphere2.render();
  sphere1.renderSlime(sphere2, 500, 8, 12);*/

  axis3d.render();


  world.update();
  stroke(0, 0, 0);
  //grid.draw();
  noStroke();
  world.draw();
  popMatrix();
  camera.reset();
  help.draw();
}

void keyPressed()
{
  println(keyCode);
  for (int n=0; n<input_held.length; n++)
  {
    if (keyCode==input_key[n])
    {
      input_held[n]=true;
    }
  }

  camera.keyPressed(keyCode);
  help.keyPressed(keyCode);
  
  switch(keyCode)
  {
    case 65:
    showAxis=!showAxis;
    break;
    
        case 83:
    showShadows=!showShadows;
    break;
 
  }
}

void keyReleased()
{
  for (int n=0; n<input_held.length; n++)
  {
    if (keyCode==input_key[n])
    {
      input_held[n]=false;
    }
  }
}

public void control()
{


  if (input_held[4])
    sphere2.position.x+=4;

  if (input_held[5])
    sphere2.position.x-=4;
}

public void mousePressed()
{
  if (mouseButton==LEFT)
  {
    world.explode(new PVector(0, 0, 0));
  }

  if (mouseButton==RIGHT)
  {
    world.init();
  }
}