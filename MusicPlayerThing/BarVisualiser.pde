class BarVisualiser
{
  float audioBuffer[];
  float lerpNum;
  float colorVal, num;

  BarVisualiser(float audioBuffer[])
  {
    this.audioBuffer = audioBuffer;
  }

  /*
    step is calculated by seeing the remainder of the screen and moving the graphX by remainder/2
   draws line graph for audio waves
   line positions x2, y2 are based off of the peak of the array[i]
   */
  void drawBars()
  {

    float step = (width - audioBuffer.length) / 2;
    for (int i = 0; i < audioBuffer.length; i++)
    {
      num =  musicMax * i;
      colorVal = lerp(colorVal, num, 0.3f);
      float num = abs(audioBuffer[i] * height/2); // change height/2 to i for a smallest -> biggest graph
      lerpNum = lerp(lerpNum, num, 5f);
      stroke(colorVal, 255, 255);
      line(i+step, height/2, i+step, height/2 - num); // x1, y1, x2, y2
    }
  }

  void drawDiagonal()
  {

    for (int i = 0; i < audioBuffer.length; i++)
    {
      num =  musicMax * i;
      colorVal = lerp(colorVal, num, 0.3f);
      float num = abs(audioBuffer[i]); // change height/2 to i for a smallest -> biggest graph
      lerpNum = lerp(lerpNum, num, 1f);
      strokeWeight(1);
      stroke(colorVal, 255, 255, 100);
      line (i, height/2 - lerpNum * height/2 * 4f, height/2 + lerpNum * height/2 * 4f, i);
      line ( height/2 - lerpNum * height/2 * 4f, i, i, height/2 + lerpNum * height/2 * 4f);
    }
  }
}
