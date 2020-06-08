public abstract class Element 
{
  protected float h;
  protected float r;
  protected int segments;
  protected PVector position;
  protected PVector rotation;
  private Axis3D axis;
  protected color colour;

  public Element(PVector pos, PVector rot, float r, float h, int seg, boolean hasAxis)
  {
    colour=color(255,255,255);
    position=pos;
    rotation=rot;
    this.r=r;
    this.h=h;
    segments=seg;
    
    if(hasAxis)
    {
    axis=new Axis3D();
    axis.setScale(2);
    }
    else
    axis=null;
  }

  public void setH(float h)
  {
    this.h=h;
  }

  public void setR(float r)
  {
    this.r=r;
  }
  
  public void setColour(color c)
  {
    this.colour=c;
  }

  public void setPosition(PVector position)
  {
    this.position=position;
  }

  public void setRotation(PVector rotation)
  {
    this.rotation=rotation;
  }

  public void setSegments(int segments)
  {
    this.segments=segments;
  }

  protected void render()
  {
    pushMatrix();

    translate(position.x, position.y, position.z);
    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z);
    scale(r, r, h);
    fill(colour);

    renderElement();
    if(axis!=null) //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    axis.render();
    


    popMatrix();
    if(showShadows)
        shadow();
  }
  
  public void shadow()
  {
   fill(0,0,0,120);
   pushMatrix();

    translate(position.x*(1+(position.z-r)*0.000), position.y*(1+(position.z-r)*0.000), 0.1);
    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z);
    scale(r, r, 0);
    int sTmp=segments;  //render shadow at ~half mesh resolution
    segments=ceil(segments/6)*4;
    renderElement();
    segments=sTmp;


    popMatrix();
  }

  public abstract void renderElement();
}