class HeartVisualiser
{
int[] heartarray = new int[6];
int R = int(random(1,255));
PShape heart;
PShape BGsquare;

  HeartVisualiser() //creates background, interactive directional light & loads heartshape SVG file.
  {
    colorMode(HSB);
    fill(0,200,40);
    BGsquare = createShape(RECT,0,0,width*2,height*2);
    colorMode(HSB);
    float dirY = (mouseY / float(height) - 0.1) * 2;
    float dirX = (mouseX / float(width) - 0.1) * 2;
    directionalLight(255, 255, 255, -dirX, -dirY, -1); 
    colorMode(RGB);
    fill(R,R,R);
    heart = loadShape("heartp.svg");
    colorMode(HSB);
  }
  
void render() //renders background, and produces a for loop of heartshape objects, which are then manipulated in the translate function on the X axis.
{ 
  pushMatrix();
  shape(BGsquare,0,0);
  for (int Y = 0; Y < height; Y = Y+50){ 
  for (int i = 0; i < heartarray.length; i++) {
     shape(heart,20,height/4,20,20);
     shape(heart,20,height/4*3,20,20);
     translate (5000* musicAvg + (musicMax), 0);
}}
popMatrix();

pushMatrix(); //produces a for loop of heartshape objects, which are then manipulated in the translate function on the Y axis.
  for (int Y = 0; Y < height; Y = Y+50){ 
  for (int i = 0; i < heartarray.length; i++) {
     shape(heart,width/4,20,20,20);
     shape(heart,width/4*3,20,20,20);
     translate (0, 5000* musicAvg + (musicMax));
}}
popMatrix();}}
  
