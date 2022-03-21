class Lighting
{
  float hD1, sD1, bD1, hD2; //HSB Values for the Directional Light
  int lx, ly;

  Lighting(int lx, int ly)
  {
    this.lx = lx;
    this.ly = ly;
    hD1 = random(0, 255);
    hD2= random(0, 255);
    sD1 = 255;
    bD1 = 255;
  }

  void render()
  {
    lights();
    CreateLight();
  }

  void CreateLight()
  {
    directionalLight(hD1, sD1, bD1, lx - 1, ly - 1, 0);
    directionalLight(hD2, sD1, bD1, lx + 1, ly + 1, 0);
  }
}
