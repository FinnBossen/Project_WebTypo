public class Konus extends Element
{


  public Konus(PVector pos, PVector rot, float r,float h,int seg, boolean hasAxis)
  {
    super(pos,rot,r,h,seg,hasAxis);
  }
  



  public void renderElement()
  {
    beginShape(TRIANGLE_FAN);
    vertex(0, 0, 0);
    for (int n=0; n<=segments; n++)
    {
      float ang=(2*PI)/segments*n;
      vertex(cos(ang)*1, sin(ang)*1, 0);
    }
    
    endShape();
    beginShape(TRIANGLE_FAN);
    vertex(0, 0, 1);
    for (int n=0; n<=segments; n++)
    {
      float ang=(2*PI)/segments*n;
      vertex(cos(ang)*1, sin(ang)*1, 0);
    }
    
    endShape();
  }
  

  

  
  
}