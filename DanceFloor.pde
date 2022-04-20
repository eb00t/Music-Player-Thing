class DanceFloor
{
  float cubeSize = height/30;
  float musicMax;
  float musicAvg;
  float colorVal;
  float randomise = random(0, 255);
  float currentTime;
  float previousTime = 0;
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
    if (frameCount % 10 == 0) {
      for (int x = 0; x < 20; x++)
      {
        for (int y = 0; y < 4; y++)
        {
          pushMatrix();
          //noStroke();
          stroke(0);


          randomise = random(0, 255);

          num = musicAvg * randomise * 100;
          colorVal = lerp(colorVal, num, 1f);
          fill(colorVal, 255, 255);

          rotateX(degrees(60));
          translate (-x*cubeSize + width/2 + (cubeSize * 9), y*cubeSize + height/1.3);

          box(cubeSize);
          popMatrix();
        }
      }
    }
  }
}
