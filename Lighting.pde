class Lighting
{
  float hue1, hue2, saturation, brightness; //HSB Values for the Directional Light
  float musicAvg;
  int lightX, lightY; // light x, light y

  Lighting(int lightX, int lightY, float musicAvg)
  {
    this.musicAvg = musicAvg;
    this.lightX = lightX;
    this.lightY = lightY;
    saturation = 255;
    brightness = 255;
  }

  void CreateLight()
  {
    hue1 = musicAvg * 1000 * 10;
    hue2 = musicAvg * 1000 * 5;
    directionalLight(hue1, saturation, brightness, lightX - 1, lightY - 1, 0);
    directionalLight(hue2, saturation, brightness, lightX + 1, lightY + 1, 0);
  }
}
