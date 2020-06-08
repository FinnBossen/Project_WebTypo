public class HelpControl
{
  String[]text;
  boolean extended;
  
  public HelpControl()
  {
    extended=false;
   text=new String[2];
   text[0]="[C] Show Controls";
   text[1]="[C] Hide Controls\n[LMB] Explode\n[RMB] Reset\n[Arrowkeys] Move Camera\n[+ -]Zoom Camera\n[1 2 3 4] Select Camera\n[A] Toggle Axis\n[S] Toggle Shadows";
  }
  
  public void draw()
  {
    fill(255,255,255,255);
    textAlign(LEFT, TOP);
    
    int n=0;
    if(extended)
    n=1;
    
  text(text[n],-width*0.5,-height*0.5,0);  
  }
  
  public void keyPressed(int k)
  {
    if(k==67)
    extended=!extended;
  }
}