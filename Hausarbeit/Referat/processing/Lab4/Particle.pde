public abstract class Particle
{
  World world;
  public Particle(World world)
  {
    this.world=world;
    world.particles.add(this);
  }
  public abstract void update();
  public abstract void draw();
  public void destroy()
  {
    world.particleRemove.add(this);
  }
}