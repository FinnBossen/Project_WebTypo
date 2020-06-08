

public class Camera
{
  int mode;
  float eyeX;
  float eyeY;
  float eyeZ;
  float centerX;
  float centerY;
  float centerZ;

  PVector up;

  float eyeXOffset;
  float eyeYOffset;
  float eyeZOffset;


  float zoom;



  public Camera()
  {

    mode=3;

    eyeX=500;
    eyeY=500;
    eyeZ=500;
    eyeXOffset=0;
    eyeYOffset=0;
    eyeZOffset=0;
    up=new PVector(0, 0, -1);



    zoom=3;
  }


  public void set()
  {
    ortho(-width/2*zoom, width/2*zoom, -height/2*zoom, height/2*zoom, -16000, 16000); // Same as ortho()
    camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, up.x, up.y, up.z );
  }
  
    public void reset()
  {
    ortho(-width/2, width/2, -height/2, height/2, 0, 16000); // Same as ortho()
    camera(0, 0, 100, 0, 0, 0, 0, 1,0 );
  }
  
  

  public void update()
  {
    if (input_held[4])
      zoom-=0.02;

    if (input_held[5])
      zoom+=0.02;

    switch (mode)
    {
    case 0: //X alligned

      if (input_held[0])
        eyeZOffset+=3f*zoom;

      if (input_held[1])
        eyeZOffset-=3f*zoom;

      if (input_held[2])
        eyeYOffset+=3f*zoom;

      if (input_held[3])
        eyeYOffset-=3f*zoom;

      eyeX=-100;
      eyeY=0+eyeYOffset;
      eyeZ=0+eyeZOffset;

      centerX=0;
      centerY=0+eyeYOffset;
      centerZ=0+eyeZOffset;

      up.x=0;
      up.y=0;
      up.z=-1;
      break;
    case 1: //Y alligned

      if (input_held[0])
        eyeZOffset+=3f*zoom;

      if (input_held[1])
        eyeZOffset-=3f*zoom;

      if (input_held[2])
        eyeXOffset-=3f*zoom;

      if (input_held[3])
        eyeXOffset+=3f*zoom;

      eyeY=-100;
      eyeX=0+eyeXOffset;
      eyeZ=0+eyeZOffset;

      centerY=0;
      centerX=0+eyeXOffset;
      centerZ=0+eyeZOffset;

      up.x=0;
      up.y=0;
      up.z=-1;
      break;

    case 2: //Z alligned

      if (input_held[0])
        eyeXOffset+=3f*zoom;

      if (input_held[1])
        eyeXOffset-=3f*zoom;

      if (input_held[2])
        eyeYOffset-=3f*zoom;

      if (input_held[3])
        eyeYOffset+=3f*zoom;

      eyeZ=100;
      eyeX=0+eyeXOffset;
      eyeY=0+eyeYOffset;

      centerZ=0;
      centerX=0+eyeXOffset;
      centerY=0+eyeYOffset;

      up.x=0;
      up.y=1;
      up.z=0;
      break;

    case 3: //iso

      if (input_held[0])
      {
        eyeXOffset-=3f*zoom;
        eyeYOffset-=3f*zoom;
      }

      if (input_held[1])
      {
        eyeXOffset+=3f*zoom;
        eyeYOffset+=3f*zoom;
      }

      if (input_held[3])
      {
        eyeXOffset-=3f*zoom;
        eyeYOffset+=3f*zoom;
      }

      if (input_held[2])
      {
        eyeXOffset+=3f*zoom;
        eyeYOffset-=3f*zoom;
      }

      centerZ=0;
      centerX=0+eyeXOffset;
      centerY=0+eyeYOffset;

      eyeZ=100;
      /*eyeX=centerX+100*cos(PI*1/6);
       eyeY=centerY+100*cos(PI*1/6);*/
      float a1=100/tan(35.264/360f*2*PI); //offset distance on x-y plane
      float a2=sqrt((a1*a1)/2); //axis-specific offset distance
      eyeX=centerX+a2;
      eyeY=centerY+a2;



      up.x=0;
      up.y=0;
      up.z=-1;
      break;
    }
  }

  public void keyPressed(int k)
  {
    if (k>=49 && k<=52)
    {
      setMode(k-49);
    }
  }

  public void setMode(int mode)
  {
    this.mode=mode;
    eyeXOffset=0;
    eyeYOffset=0;
    eyeZOffset=0;
  }
}