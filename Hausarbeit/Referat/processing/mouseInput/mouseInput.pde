color[] colours;
ArrayList<Circle> circles;
int mouseState;
int mouseButtonPressed;

void setup()
{
 size(1200,750,P2D);
 colours=new color[2];
 colours[0]=#FFF300;
 colours[1]=#FF0099;
 circles=new ArrayList<Circle>();
 
 mouseState=0;
 
}

void draw()
{
  background(colours[0]);
  
  mouseUpdate();
  
  for(int n=0; n<circles.size(); n++)
  {
  circles.get(n).draw();
  }
}

void mouseUpdate()
{
  switch(mouseState)
  {
   case 0:
   if(mousePressed)
   {
     mouseButtonPressed=mouseButton;
     mouseState=1;
     circles.add(new Circle(mouseX,mouseY,0,mouseButton == LEFT?colours[1]:colours[0]));
   }
   break;
   
   case 1:
   Circle c=circles.get(circles.size()-1);
   c.radius=new PVector(c.position.x-mouseX,c.position.y-mouseY).mag()*2;
   
   if(!mousePressed || mouseButton!=mouseButtonPressed)
   {
     mouseState=0;
   }
   break;
  }
}

public class Circle{
 color colour;
 public PVector position;
 public float radius;
 
 public Circle(float x, float y, float r,color c)
 {
   position=new PVector(x,y);
   radius=r;
   colour=c;
 }
 public void draw()
 {
   noStroke();
   fill(colour);
   ellipse(position.x,position.y,radius,radius);
 }
 
 
}
