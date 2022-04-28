class BoxVisualiser
{
  float musicMax;
  float musicAvg;
  float rotation;

  BoxVisualiser(float musicMax, float musicAvg, float rotation)
  {
    this.musicMax = musicMax;
    this.musicAvg = musicAvg;
    this.rotation = rotation;
  }

  // creates box, moves box, size of the box is based off of the average peak of the music
  void createBox()
  {
    pushMatrix();
    //noStroke();
    stroke(musicAvg * 2 * width, 255, 255 - 40);
    fill(musicAvg * 2 * width, 255, 255);
    translate(width/2, height/2);
    rotateX(QUARTER_PI);
    rotateY(rotation); // rotates Y based on music average
    box(musicAvg * (5 * width)); // average was too small so multiplied it so box was visible, change based on your use
    popMatrix();
  }
}
