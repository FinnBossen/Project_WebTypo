public class Zylinder extends Element
{

  protected int rings;

  public Zylinder(PVector pos, PVector rot, float r, float h, int seg, boolean hasAxis)
  {
    super(pos, rot, r, h, seg, hasAxis);
    rings=1;
  }

  public Zylinder(PVector pos, PVector rot, float r, float h, int seg, boolean hasAxis, int rings)
  {
    super(pos, rot, r, h, seg, hasAxis);
    setRings(rings);
  }

  public void renderElement()
  {
    float varH=0;
    for (int s=0; s<2; s++)
    {
      beginShape(TRIANGLE_FAN);
      vertex(0, 0, varH);
      for (int n=0; n<=segments; n++)
      {
        float ang=(2*PI)/segments*n;
        vertex(cos(ang)*1, sin(ang)*1, varH);
      }
      endShape();
      varH=1;
    }

    for (int ring=0; ring<rings; ring++)
    {
      float hMin=(float)ring/rings;
      float hMax=(float)(ring+1)/rings;
      beginShape(QUAD_STRIP);
      for (int n=0; n<=segments; n++)
      {
        float ang1=(2*PI)/segments*n;
        vertex(cos(ang1)*1, sin(ang1)*1, hMax);
        vertex(cos(ang1)*1, sin(ang1)*1, hMin);
      }
      endShape();
    }
  }

  public void setRings(int rings)
  {
    this.rings=rings;
  }
}