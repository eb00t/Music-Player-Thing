import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioBuffer ab;
AudioPlayer ap;

Lighting lighting;
DiscoBall discoBall;

float halfH; //half height
float lerpedAverage = 0;
float colorInc;
//float colorInc2;

void setup()
{
  size(1024, 800, P3D);
  //fullScreen(P3D);
  colorMode(HSB);
  minimInitialise();
  halfH = height/2;
  colorInc = 255/(float)ab.size();
  //colorInc2 = (float) ab.size() / 255;
  lighting = new Lighting(0, 0); //Creates the lights
  discoBall = new DiscoBall(width/2, height/2, width/5); //Draws the disco ball
  colorMode(HSB);
}

float [] lerpedBuffer = new float [1024];

void draw()
{
  background(#24488E);
  drawLine();
  lighting.render(); //l is the Lighting
  discoBall.render(); //d is the Disco Ball
  discoBall.update();
}

void drawLine()
{
  float sum = 0;
  for (int i = 0; i < ab.size(); i++)
  {
    sum += abs(ab.get(i));
    lerpedBuffer[i] = lerp(lerpedBuffer[i], ab.get(i), 0.25f);
    stroke(#3B77EA);
    line (i, 146 - lerpedBuffer[i] * halfH, i, 146 + lerpedBuffer[i] * halfH);
    //line (i, 877 - lerpedBuffer[i] * halfH, i, 877 + lerpedBuffer[i] * halfH);
    //stroke(colorInc * i, 255, 255);
    line (i, halfH - lerpedBuffer[i] * halfH * 4f, halfH + lerpedBuffer[i] * halfH * 4f, i);
  }
  float average = sum / (float) ab.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
}

void minimInitialise()
{
  minim = new Minim(this);
  //ap = minim.loadFile ("riteofpassage.mp3", 1024); //(THIS IS THE MOST IMPORTANT LINE OF CODE IN THE ENTIRE PROJECT!)
  ap = minim.loadFile ("David_Dima_-_With_a_Little_Bit_of_True_Love.mp3", 1024);
  ap.play();
  ab = ap.mix;
}

void createLights()
{
  
}
