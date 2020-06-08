
PGraphics drawTarget;
PGraphics stack;

Particle[] particles;

void setup()
{
  size(700, 500,P2D);
  colorMode(HSB, 1, 1, 1,1);
  drawTarget=createGraphics(width, height,JAVA2D);
  stack=createGraphics(width, height,JAVA2D);
  
  
  int particlesAmount=(width*height)/(600*300)*27;
  
  particles=new Particle[particlesAmount-1];
  
  for(int n=particles.length-1;n>=0;n--)
  {
    particles[n]=new Particle();
  }
  
  background(#FFFFFF);
}

void draw()
{    

  drawTarget.beginDraw();
  //tint(1,1,1,1);
  drawTarget.background(1,0,1,0);
  for(int n=particles.length-1;n>=0;n--)
  {
    particles[n].update();
  }
  drawTarget.endDraw();
  
  stack.beginDraw();
  /*
  stack.background(1,0,1,0);
  stack.beginShape(TRIANGLE_STRIP);
  stack.texture(stack);
  stack.vertex(1,1);
  stack.vertex(width-1,1);
  stack.vertex(1,height-1);
  stack.vertex(width-1,height-1);
  stack.endShape();
  */
  stack.image(stack,1,1,width-2,height-2);
  stack.image(drawTarget,0,0);
  
  stack.endDraw();
 
  tint(1,0,1,1);
  image(stack,0,0);


}


public class Particle
{
  PVector position;
  float angle;
  float speed;
  float time;
  float sine_time;
  float radius;
color colour;

  public Particle()
  {
init();
  }
  
  void init()
  {
    colour=color(random(1),1,1,1);
    radius=random(40);
        time=random(19);
    angle=random(TWO_PI);
    speed=3.0+random(6.0);
    sine_time=0.2+random(0.6);
    if (chance(0.5))
    {
      position=new PVector(random(width), chance(0.5)?0:height);
    } else
    {
      position=new PVector(chance(0.5)?0:width, random(height));
    }
    
  }
  
  void update()
  {
    time+=1;
    float sinemult=(0.5+0.5*sin(sine_time*time));
    float s=sinemult*speed;
    position.x+=cos(angle)*s;
    position.y+=sin(angle)*s;
    
    if(position.x<0 || position.y<0 || position.x>width || position.y>height)
    {
      init();
    }
    
    fill(colour);
    noStroke();
    drawTarget.ellipse(position.x,position.y,radius*sinemult,radius*sinemult);  
  }
}

boolean chance(float chance)
{
  return  random(1)<chance;
}
