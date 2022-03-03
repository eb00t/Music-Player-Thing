class Lighting
{
  float hD1, sD1, bD1; //HSB Values for the Directional Light
  int lx, ly;

  Lighting(float CenterX, float CenterY)
  {
    hD1 = random(0, 255);
    sD1 = 255;
    bD1 = 255;
  }

  void render()
  {
    CreateLight();
  }

  void CreateLight()
  {
    directionalLight(hD1, sD1, bD1, lx, ly, 0);
  }
}
