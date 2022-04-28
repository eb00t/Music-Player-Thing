class DanceFloor
{
  float cubeSize = height/30;
  float musicMax;
  float musicAvg;
  float colorVal;
  float randomise;
  float num;

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

    for (int x = 0; x < 20; x++)
    {
      for (int y = 0; y < 4; y++)
      {
        pushMatrix();
        randomise = random(0, 255);
        num = musicAvg * randomise * 63.5;
        colorVal = lerp(colorVal, num, 0.3f);

        fill(colorVal, 255, 255);
        //noStroke();
        stroke(0);

        rotateX(degrees(60));
        translate (-x*cubeSize + width/2 + (cubeSize * 9), y*cubeSize + height/1.3);

        box(cubeSize);
        popMatrix();
      }
    }
  }
}
