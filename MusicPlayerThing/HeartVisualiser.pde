class HeartVisualiser
{
int[] heartarray = new int[6];
int[] bararray = new int[10];
int R = int(random(1,255));
PShape heart;
PShape BGsquare;
PShape texth;
int x;


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
    fill(255);
    texth = loadShape("htext.svg");
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
popMatrix();
shape(texth,width/2 - width/7,height/2 - height/8,300,60); //Displays an SVG containing text transformed into shapes, reducing likelihood of excess memory consumption.
rectMode(CENTER);
stroke(0,200,160); 
strokeWeight(5);
noFill();
rect(width/2 ,height/2,550,80);

pushMatrix();
noStroke();
fill(0,160,120);
for (int x = 0; x < bararray.length; x++){ //produces a for loop of rectangles, which are then manipulated in the translate function on the X axis.
rect(width/2 - width/8,height/2,50,60);
translate (1000* musicAvg + (musicMax), 0);
}
rectMode(CORNER);
popMatrix();
stroke(0,180,200); //places a red stroke around the progress bar for the duration of heartVis.render
strokeWeight(4);
shape(heart,mouseX,mouseY,20,20); //produces a heart shape that follows the mouse.
}
}
