class DiscoBall
{
  float rotation; //Rotation of Disco Ball
  float size; //Size of Disco Ball
  float hD1, sD1, bD1; //HSB Values for the Directional Light
  float xD1, yD1; //XY Position for the Disco Ball
  DiscoBall(float xD1, float yD1, float size)
  {
    this.xD1 = xD1;
    this.yD1 = yD1;
    this.size = size;
    rotation = 0;
  }

  void render()
  {
   
    pushMatrix();
    fill(182);
    //noFill();
    strokeWeight(2);
    shininess(1);
    stroke(255);
    translate (xD1, yD1, 0);
    rotateY(rotation);
    sphere(size);
    popMatrix();
  }

  void update()
  {

    rotation += 0.01f;
  }
}