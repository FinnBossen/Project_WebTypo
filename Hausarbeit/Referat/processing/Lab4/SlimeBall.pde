public class SlimeBall extends Moveable
{


  public SlimeBall(World world)
  {
    super(world);
    element=new Sphere (new PVector(0, 0, 0), new PVector(0, 0, 0), 100, 100, 12, true);
    element.colour=color(random(255),random(255),random(255));
  }

  public void update()
  {

    //attract other
    for (SlimeBall s : this.world.slimeBalls) {
      if (s!=this )
      {
        PVector dirVec=new PVector(position.x-s.position.x, position.y-s.position.y, position.z-s.position.z);
        dirVec.setMag(-0.12);
        speed=speed.add(dirVec);
      }
    }

    //collide with world borders.
float friction=0.8;
    if (position.x<world.borderMin.x+element.r)
    {
      position.x=world.borderMin.x+element.r;
      speed.x=abs(speed.x)*friction;
      new ParticleCollision(world,new PVector( position.x-element.r,position.y,position.z),new PVector(0,PI*0.5,0));
    } else
      if (position.x>world.borderMax.x-element.r)
      {
        position.x=world.borderMax.x-element.r;
        speed.x=-abs(speed.x)*friction;
        new ParticleCollision(world,new PVector( position.x+element.r,position.y,position.z),new PVector(0,PI*0.5,0));
      }

    if (position.y<world.borderMin.y+element.r)
    {
      position.y=world.borderMin.y+element.r;
      speed.y=abs(speed.y)*friction;
      new ParticleCollision(world,new PVector( position.x,position.y-element.r,position.z),new PVector(PI*0.5,0,0));
    } else
      if (position.y>world.borderMax.y-element.r)
      {
        position.y=world.borderMax.y-element.r;
        speed.y=-abs(speed.y)*friction;
              new ParticleCollision(world,new PVector( position.x,position.y+element.r,position.z),new PVector(PI*0.5,0,0));
      }

    if (position.z<world.borderMin.z+element.r)
    {
      position.z=world.borderMin.z+element.r;
      speed.z=abs(speed.z)*friction;
    } else
      if (position.z>world.borderMax.z-element.r)
      {
        position.z=world.borderMax.z-element.r;
        speed.z=-abs(speed.z)*friction;
              new ParticleCollision(world,new PVector( position.x,position.y,position.z+element.r),new PVector(0,0,0));
      }

    super.update();
  }
}