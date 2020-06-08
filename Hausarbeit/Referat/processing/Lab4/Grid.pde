public class Grid
{
  float cellSize;
  int w;
  int h;

  public Grid(int w, int h, float cellSize)
  {
    this.w=w;
    this.h=h;
    this.cellSize=cellSize;
  }

  public void draw()
  {
    strokeWeight(1);
    beginShape(LINES);
    for (int vw=0; vw<=w; vw++)
    {
      vertex(vw*cellSize, 0, 0); 
      vertex(vw*cellSize, h*cellSize, 0);
    }

    for (int vh=0; vh<=h; vh++)
    {
      vertex(0, vh*cellSize, 0); 
      vertex(w*cellSize, vh*cellSize, 0);
    }

    endShape();
  }
}