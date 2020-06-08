public class ParticleCollision extends Particle
{
  PVector position;
  PVector rotation;
  float scale=0;
  int life=50;
  int alpha=255;

  public ParticleCollision(World world)
  {
    super(world);
  }

  public ParticleCollision(World world, PVector position, PVector rotation)
  {
    super(world);
    this.position=position;
    this.rotation=rotation;
    scale=0;
  }

  public void draw()
  {
    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z);
    scale(scale, scale, scale);
    fill(color(255, 255, 255,alpha));

    beginShape(TRIANGLE_FAN);
    vertex(0, 0, 0);
    int segments=8;
    for (int n=0; n<=segments; n++)
    {
      float ang=(2*PI)/segments*n;
      vertex(cos(ang)*1, sin(ang)*1, 0);
    }
    endShape();
    popMatrix();
  }

  public void update()
  {
    scale+=(100-scale)*0.07;
    alpha+=(0-alpha)*0.07;
    life-=1;

    if (life<=0)
      destroy();
  }
}