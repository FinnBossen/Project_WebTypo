public class Moveable
{
  PVector position;
  PVector speed;
  public Element element;
  World world;

  public Moveable(World world)
  {
    element=null;
    speed=new PVector(0, 0, 0);
    position=new PVector(2000,220,2000);
    this.world=world;
  }

  public void setElement(Element e)
  {
    element=e;
  }

  public void update()
  {
    speed.add(world.gravity);
    position.add(speed);
  }



  public void draw()
  {
    if (element!=null)
    {
      element.position=position;
      element.render();
    }
  }
}