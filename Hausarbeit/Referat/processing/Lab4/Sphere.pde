public class Sphere extends Element
{
  public Sphere(PVector pos, PVector rot, float r, float h, int seg, boolean hasAxis)
  {
    super(pos, rot, r, h, seg, hasAxis);
  }

  public void renderElement()
  {
    beginShape(QUAD_STRIP);
    /*for (int n1=0; n1<=segments; n1++)
     {
     float ang1THIS=(2*PI)/segments*n1;
     float ang1NEXT=(2*PI)/segments*n1+1;
     float sinang1THIS=sin(ang1THIS);
     float cosang1NEXT=cos(ang1NEXT);
     for (int n2=0; n2<=segments; n2++)
     {
     float ang2=(2*PI)/segments*n2;
     float rFlat=r/(sqrt(pow(tan(ang2)*r,2)+pow(r,2)));
     vertex(cos(ang1)*rFlat, sin(ang1)*rFlat, sin(ang2)*1);
     }
     }*/

    for (int n2=0; n2<=segments-1; n2++)
    {
      float ang2THIS=(2*PI)/segments*n2;
      float ang2NEXT=(2*PI)/segments*(n2+1);
      float rFlatTHIS=r/(sqrt(pow(tan(ang2THIS)*r, 2)+pow(r, 2)));
      float rFlatNEXT=r/(sqrt(pow(tan(ang2NEXT)*r, 2)+pow(r, 2)));
      float sinang2THIS=sin(ang2THIS);
      float sinang2NEXT=sin(ang2NEXT);

      for (int n1=0; n1<=segments; n1++)
      {
        float ang1THIS=(2*PI)/segments*n1;
        //float ang1NEXT=(2*PI)/segments*(n1+1);
        float sinang1THIS=sin(ang1THIS);
        //float cosang1NEXT=cos(ang1NEXT);
        float cosang1THIS=cos(ang1THIS);
        //float sinang1NEXT=sin(ang1NEXT);

        vertex(cosang1THIS*rFlatTHIS, sinang1THIS*rFlatTHIS, sinang2THIS);
        vertex(cosang1THIS*rFlatNEXT, sinang1THIS*rFlatNEXT, sinang2NEXT);
        /*vertex(cosang1NEXT*rFlatNEXT, sinang1NEXT*rFlatNEXT, sinang2NEXT);
         vertex(cosang1NEXT*rFlatTHIS, sinang1NEXT*rFlatTHIS, sinang2THIS);*/
      }
    }

    endShape();
  }
  public void renderSlime(Sphere other, float r, int segments, int rings)
  {
    fill(colour);
    pushMatrix();


    translate(this.position.x, this.position.y, this.position.z);
    rotateZ(atan2(this.position.y-other.position.y, this.position.x-other.position.x)+PI);
    rotateY(atan2(this.position.z-other.position.z, sqrt(pow(this.position.x-other.position.x, 2)+pow(this.position.y-other.position.y, 2))));
    scale(1, 1, 1);

    renderSlimeShape(other, r, segments, rings);
    popMatrix();

//shadow
if(showShadows)
{
    fill(0, 0, 0, 120);
    pushMatrix();

    translate(position.x, position.y, 0.1);
rotateZ(atan2(this.position.y-other.position.y, this.position.x-other.position.x)+PI);
    rotateY(atan2(this.position.z-other.position.z, sqrt(pow(this.position.x-other.position.x, 2)+pow(this.position.y-other.position.y, 2))));
    scale(1, 1, 0);
renderSlimeShape(other, r, segments/2, rings/2);



    popMatrix();
}
  }

  public void renderSlimeShape(Sphere other, float r, int segments, int rings) //note: rings/half, total number of rings=rings*2; only works with two spheres of equal radius
  {
    float dist=this.position.dist(other.position);
    //float ang=this.position;
    float circleMaskDist=sqrt(pow(this.r+r, 2)-pow(dist*0.5, 2));
    float distOffsetStart=(dist*0.5/circleMaskDist)*this.r; //= tan(atan2(dist*0.5,circleMaskDist))*this.r;
    float distStep=(dist-distOffsetStart)/rings;
    float angleStart=atan2(dist*0.5, circleMaskDist);
    float angleStep=-angleStart/rings;


    /* println("1:"+distOffsetStart);
     println("2:"+((dist*0.5)/circleMaskDist)*this.r);*/


    //fill(255, 255, 255);
    //stroke(255, 255, 255);
    strokeWeight(1);
    beginShape(QUADS);
    for (int ring=0; ring<((rings-1)*0.5); ring++)
    {
      float rTHIS=max(circleMaskDist-(cos(angleStart+angleStep*ring*2)*r), 0);
      float rNEXT=max(circleMaskDist-(cos(angleStart+angleStep*(ring+1)*2)*r), 0);


      for (int n=0; n<=(segments-1)/2; n++)
      {
        float angTHIS=(2*PI)/segments*n; 
        float angNEXT=(2*PI)/segments*(n+1); 
        float cosAngTHIS=cos(angTHIS);
        float sinAngTHIS=sin(angTHIS);
        float cosAngNEXT=cos(angNEXT);
        float sinAngNEXT=sin(angNEXT);
        vertex(distOffsetStart+distStep*ring, cosAngTHIS*rTHIS, sinAngTHIS*rTHIS);
        vertex(distOffsetStart+distStep*(ring+1), cosAngTHIS*rNEXT, sinAngTHIS*rNEXT);
        vertex(distOffsetStart+distStep*(ring+1), cosAngNEXT*rNEXT, sinAngNEXT*rNEXT);
        vertex(distOffsetStart+distStep*ring, cosAngNEXT*rTHIS, sinAngNEXT*rTHIS);

        vertex(dist-distOffsetStart-distStep*ring, cosAngTHIS*rTHIS, sinAngTHIS*rTHIS);
        vertex(dist-distOffsetStart-distStep*(ring+1), cosAngTHIS*rNEXT, sinAngTHIS*rNEXT);
        vertex(dist-distOffsetStart-distStep*(ring+1), cosAngNEXT*rNEXT, sinAngNEXT*rNEXT);
        vertex(dist-distOffsetStart-distStep*ring, cosAngNEXT*rTHIS, sinAngNEXT*rTHIS);

        //nverted angle
        vertex(distOffsetStart+distStep*ring, -cosAngTHIS*rTHIS, -sinAngTHIS*rTHIS);
        vertex(distOffsetStart+distStep*(ring+1), -cosAngTHIS*rNEXT, -sinAngTHIS*rNEXT);
        vertex(distOffsetStart+distStep*(ring+1), -cosAngNEXT*rNEXT, -sinAngNEXT*rNEXT);
        vertex(distOffsetStart+distStep*ring, -cosAngNEXT*rTHIS, -sinAngNEXT*rTHIS);

        vertex(dist-distOffsetStart-distStep*ring, -cosAngTHIS*rTHIS, -sinAngTHIS*rTHIS);
        vertex(dist-distOffsetStart-distStep*(ring+1), -cosAngTHIS*rNEXT, -sinAngTHIS*rNEXT);
        vertex(dist-distOffsetStart-distStep*(ring+1), -cosAngNEXT*rNEXT, -sinAngNEXT*rNEXT);
        vertex(dist-distOffsetStart-distStep*ring, -cosAngNEXT*rTHIS, -sinAngNEXT*rTHIS);
      }
      //vertex(distOffsetStart+distStep*ring, 0, rTHIS); 
      //vertex(dist-distOffsetStart-distStep*ring, 0, rTHIS);
    }
    //vertex(1, 0, 0); 
    endShape();
  }
}