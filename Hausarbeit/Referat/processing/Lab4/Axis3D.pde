
public class Axis3D
{
  Element konusX;
  Element konusY;
  Element konusZ;
  Element zylinderX;
  Element zylinderY;
  Element zylinderZ;

  color colX;
  color colY;
  color colZ;

  private float scale;

  public Axis3D()
  {
    konusX=new Konus(new PVector(0.6, 0, 0), new PVector(0, PI*0.5, 0), 0.2, 0.4, 4, false);
    konusY=new Konus(new PVector(0, 0.6, 0), new PVector(-PI*0.5, 0, 0), 0.2, 0.4, 4, false);
    konusZ=new Konus(new PVector(0, 0, 0.6), new PVector(0, 0, 0), 0.2, 0.4, 4, false);

    zylinderX=new Zylinder(new PVector(0, 0, 0), new PVector(0, PI*0.5, 0), 0.04, 0.6, 4, false);
    zylinderY=new Zylinder(new PVector(0, 0, 0), new PVector( -PI*0.5, 0, 0), 0.04, 0.6, 4, false);
    zylinderZ=new Zylinder(new PVector(0, 0, 0), new PVector(0, 0, 0), 0.04, 0.6, 4, false);

    colX=color(255, 0, 0);
    colY=color(0, 255, 0);
    colZ=color(0, 0, 255);

    konusX.colour=colX;
    konusY.colour=colY;
    konusZ.colour=colZ;

    zylinderX.colour=colX;
    zylinderY.colour=colY;
    zylinderZ.colour=colZ;

    scale=1;
  }

  public void render()
  {
    if(showAxis)
    {
    pushMatrix();
    scale(scale, scale, scale);
    //noStroke();


    konusX.render();
    zylinderX.render();
    
    konusY.render();
    zylinderY.render();

    konusZ.render();
    zylinderZ.render();
    popMatrix();
    }
  }

  public void setScale(float scale)
  {
    this.scale=scale;
  }
}