class DiscoBall
{
  float rotation; //Rotation of Disco Ball
  float size; //Size of Disco Ball
  float x, y; //XY Position for the Disco Ball

  DiscoBall(float x, float y, float size, float rotation)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    this.rotation = rotation;
  }

  void render()
  {
    pushMatrix();
    noStroke();
    fill(255, 0, 183);
    translate (x, y, 0);
    rotateY(rotation);
    sphere(size);
    popMatrix();
  }
}
