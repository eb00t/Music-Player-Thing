class DiscoBall
{
  float rotation; //Rotation of Disco Ball
  float size; //Size of Disco Ball
  float xD1, yD1; //XY Position for the Disco Ball

  DiscoBall(float xD1, float yD1, float size, float rotation)
  {
    this.xD1 = xD1;
    this.yD1 = yD1;
    this.size = size;
    this.rotation = rotation;
  }

  void render()
  {
    pushMatrix();
    noStroke();
    fill(255, 0, 183);
    translate (xD1, yD1, 0);
    rotateY(rotation);
    sphere(size);
    popMatrix();
  }
}
