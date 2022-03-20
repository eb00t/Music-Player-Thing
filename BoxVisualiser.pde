class BoxVisualiser
{
  float musicMax;
  float musicAvg;

  BoxVisualiser(float musicMax, float musicAvg)
  {
    this.musicMax = musicMax;
    this.musicAvg = musicAvg;
  }

  // creates box, moves box, size of the box is based off of the average peak of the music
  void createBox()
  {
    pushMatrix();
    noStroke();
    fill(musicAvg * 2 * width, 255, 255);
    translate(width/2, height/2);
    box(musicAvg * (5 * width)); // average was too small so multiplied it so box was visible, change based on your use
    popMatrix();
  }
}
