

float time;

void setup()
{
  size(600,400,P3D); //viewport resolution
  frameRate(30);
  
  time=0;
}

void draw()
{
  background(#999999);
  time+=1.0f/frameRate;
  
  rect(width*0.5,height*0.5,cos(time)*(width*0.25),sin(time)*(height*0.25));
  
  
}
