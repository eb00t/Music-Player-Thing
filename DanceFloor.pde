class DanceFloor
{
  float cubeSize = height/30;
  float musicMax;
  float musicAvg;
  float colorVal = 0;

  DanceFloor(float musicMax, float musicAvg)
  {
    this.musicMax = musicMax;
    this.musicAvg = musicAvg;
  }

  /* 
    nested loop (x*y dancefloor size)
    randomises the colour of each square of the dance floor,
    moves dancefloor to centre X, moves each new box over cubeSize
    creates each box of the dance floor
  */
  void drawFloor()
  {
    for (int x = 0; x < 3; x++)
    {
      for (int y = 0; y < 3; y++)
      {
        pushMatrix();
        stroke(0);
        float randomise = random(10, 20);
        float num = musicAvg * randomise * width;
        colorVal = lerp(colorVal, num, .05f);
        
        fill(colorVal, 255, 255);
        rotateX(QUARTER_PI);
        translate (x*cubeSize + width/2 - cubeSize, y*cubeSize + height/1.3);
        
        box(cubeSize);
        popMatrix();
      }
    }
  }
}
