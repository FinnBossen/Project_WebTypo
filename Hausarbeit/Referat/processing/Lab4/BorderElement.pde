public class BorderElement
{
  Konus konus;
  Zylinder zylinder;
  PVector position;
  PVector scale;
  float radius;
  World world;
  float zScale;
  public BorderElement(World world,PVector position, float radius)
  {
  this.position=position;
  this.world=world;
  this.radius=radius;
   zylinder=new Zylinder(position,new PVector(0,0,0),radius,(world.borderMax.z-world.borderMin.z)*0.9,8,true);
  konus=new Konus(new PVector(position.x,position.y,position.z+(world.borderMax.z-world.borderMin.z)*0.9),new PVector(0,0,0),radius,(world.borderMax.z-world.borderMin.z)*0.1,8,true);
   zScale=1;
   zylinder.colour=color(78,129,142);
   konus.colour=color(103,171,188);
    
  }
  
  public void update()
  {
    zScale=0.5+0.5*(cos((float)(frameCount*0.07+((position.x+position.y)*0.001))));
    //zScale=random(0.5)+0.5;
    
  }
  public void draw()
  {
    pushMatrix();
    scale(1,1,zScale);
    zylinder.render();
    konus.render();
    popMatrix();
    
  }
  
  
  
}