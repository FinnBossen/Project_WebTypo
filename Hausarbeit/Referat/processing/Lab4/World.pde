public class World
{
  public PVector gravity;
  public PVector borderMin;
  public PVector borderMax;
  public ArrayList<SlimeBall> slimeBalls;
  public ArrayList<BorderElement> borderElements;
  public ArrayList<Particle> particles;
  public float borderPulseScale;
  public float borderPulseScaleSpeed;
  public ArrayList <Particle> particleRemove;

  public World()
  {
    this.init();
  }

  public void update()
  {
    for (SlimeBall s : slimeBalls) {
      s.update();
    }

    //slimeball collisions
    for (int n1=0; n1<slimeBalls.size(); n1++)
    {
      for (int n2=n1+1; n2<slimeBalls.size(); n2++)
      {
        SlimeBall s1=slimeBalls.get(n1);
        SlimeBall s2=slimeBalls.get(n2);
        if (dist(s1.position.x, s1.position.y, s1.position.z, s2.position.x, s2.position.y, s2.position.z)<s1.element.r+s2.element.r)
        {
          PVector s1Speed=s1.speed;
          s1.speed=s2.speed.mult(0.96);
          s2.speed=s1Speed.mult(0.96);

          PVector center=new PVector((s1.position.x+s2.position.x)*0.5, (s1.position.y+s2.position.y)*0.5, (s1.position.z+s2.position.z)*0.5);
          PVector dirVec=new PVector(s1.position.x-s2.position.x, s1.position.y-s2.position.y, s1.position.z-s2.position.z);

          dirVec.setMag(s1.element.r);

          s2.position=PVector.sub(center, dirVec);

          s1.position=PVector.add(center, dirVec);
        }
      }
    }
    for (BorderElement e : borderElements)
    {
      e.update();
    }

    borderPulseScale+=borderPulseScaleSpeed;
    borderPulseScaleSpeed-=0.002;
    if (borderPulseScale+borderPulseScaleSpeed<1)
    {
      borderPulseScale=1;
      borderPulseScaleSpeed*=-0.7;
    }

    for (Particle p : particles)
    {
      p.update();
    }
        for (Particle p : particleRemove) {
      particles.remove(p);
    }
    particleRemove.clear();
    
  }

  public void draw()
  {
    drawFloor();


    for (int n1=0; n1<slimeBalls.size(); n1++)
    {
      SlimeBall s1=slimeBalls.get(n1);
      Sphere sphere1=(Sphere)s1.element;

      s1.draw();
      for (int n2=n1+1; n2<slimeBalls.size(); n2++)
      {
        SlimeBall s2=slimeBalls.get(n2);
        Sphere sphere2=(Sphere)s2.element;
        sphere1.renderSlime(sphere2, 500, 6, 6);
      }
    }
    pushMatrix();
    scale(borderPulseScale, borderPulseScale, borderPulseScale);
    for (BorderElement e : borderElements)
    {
      e.draw();
    }
    popMatrix();

    for (Particle p : particles)
    {
      p.draw();
    }
  }

  public void drawBounds()
  {
    fill(100, 120, 255, 30);
    noFill();
    stroke(100, 120, 255, 200);

    beginShape(QUADS);
    vertex(borderMin.x, borderMin.y, borderMin.z);
    vertex(borderMax.x, borderMin.y, borderMin.z);
    vertex(borderMax.x, borderMax.y, borderMin.z);
    vertex(borderMin.x, borderMax.y, borderMin.z);

    vertex(borderMin.x, borderMin.y, borderMax.z);
    vertex(borderMax.x, borderMin.y, borderMax.z);
    vertex(borderMax.x, borderMax.y, borderMax.z);
    vertex(borderMin.x, borderMax.y, borderMax.z);

    vertex(borderMin.x, borderMin.y, borderMin.z);
    vertex(borderMax.x, borderMin.y, borderMin.z);
    vertex(borderMax.x, borderMin.y, borderMax.z);
    vertex(borderMin.x, borderMin.y, borderMax.z);

    vertex(borderMin.x, borderMax.y, borderMin.z);
    vertex(borderMax.x, borderMax.y, borderMin.z);
    vertex(borderMax.x, borderMax.y, borderMax.z);
    vertex(borderMin.x, borderMax.y, borderMax.z);

    vertex(borderMin.x, borderMin.y, borderMin.z);
    vertex(borderMin.x, borderMax.y, borderMin.z);
    vertex(borderMin.x, borderMax.y, borderMax.z);
    vertex(borderMin.x, borderMin.y, borderMax.z);

    vertex(borderMax.x, borderMin.y, borderMin.z);
    vertex(borderMax.x, borderMax.y, borderMin.z);
    vertex(borderMax.x, borderMax.y, borderMax.z);
    vertex(borderMax.x, borderMin.y, borderMax.z);
    endShape();
  }

  public void drawFloor()
  {
    fill(100, 120, 255, 30);

    beginShape(QUADS);
    vertex(borderMin.x, borderMin.y, borderMin.z);
    vertex(borderMax.x, borderMin.y, borderMin.z);
    vertex(borderMax.x, borderMax.y, borderMin.z);
    vertex(borderMin.x, borderMax.y, borderMin.z);


    endShape();
  }

  public void init()
  {
    slimeBalls=new ArrayList<SlimeBall>();
    gravity=new PVector(0, 0, -0.2);
    borderMin=new PVector(-1000, -1000, 0);
    borderMax=new PVector(1000, 1000, 1000);
    for (int n=0; n<40; n++)
    {
      SlimeBall s=new SlimeBall(this);
      slimeBalls.add(s);
      s.position.x=random(borderMax.x-borderMin.x)+borderMin.x;
      s.position.y=random(borderMax.y-borderMin.y)+borderMin.y;
      s.position.z=random(borderMax.z-borderMin.z)+borderMin.z;
    }

    borderElements=new ArrayList<BorderElement>();
    float r=100;
    for (int n=0; n<ceil((borderMax.x-borderMin.x)/(r*2)); n++)
    {
      BorderElement e=new BorderElement(this, new PVector( borderMin.x+r+n*2*r, borderMin.y-r, borderMin.z), r);
      borderElements.add(e);
      e=new BorderElement(this, new PVector(borderMin.x+r+n*r*2, borderMax.y+r, borderMin.z), r);
      borderElements.add(e);
    }

    for (int n=0; n<ceil((borderMax.y-borderMin.y)/(r*2)); n++)
    {
      BorderElement e=new BorderElement(this, new PVector( borderMin.x-r, borderMin.y+r+n*r*2, borderMin.z), r);
      borderElements.add(e);
      e=new BorderElement(this, new PVector( borderMax.x+r, borderMin.y+r+n*r*2, borderMin.z), r);
      borderElements.add(e);
    }

    borderPulseScale=1;
    borderPulseScaleSpeed=0;
    
    
    particles=new ArrayList<Particle>();
    particleRemove=new ArrayList<Particle>();
  }

  public void explode(PVector center)
  {
    for (SlimeBall s : slimeBalls) {
      PVector temp=PVector.sub(s.position, center);
      s.speed=PVector.add(s.speed, temp.setMag(temp, 80));
    }
    borderPulseScaleSpeed=0.06;
  }
}