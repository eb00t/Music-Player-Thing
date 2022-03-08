import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioBuffer ab;
AudioPlayer ap;

DiscoBall d;
Lighting l;

float halfH; //half height
float lerpedAverage = 0;
float colorInc;

void setup()
{
  size(1024, 800, P3D);
  //fullScreen(P3D);
  colorMode(HSB);
  minimInitialise();
  halfH = height/2;
  colorInc = 255/(float)ab.size();
  d = new DiscoBall(width/2, height/2, width/5); //Draws the disco ball
  l = new Lighting(width/2, height/2); //Creates the lights
  colorMode(HSB);
}

float [] lerpedBuffer = new float [1024];

void draw()
{
  background(0);
  drawLine();
  d.render(); //d is the Disco Ball
  d.update();
  l.render(); //l is the Lighting
}

void drawLine()
{
  float sum = 0;
  for (int i = 0; i < ab.size(); i++)
  {
    sum += abs(ab.get(i));
    lerpedBuffer[i] = lerp(lerpedBuffer[i], ab.get(i), 0.25f);
    stroke(colorInc * i, 255, 255);
    line (i, 146 - lerpedBuffer[i] * halfH, i, 146 + lerpedBuffer[i] * halfH);
    //line (i, 877 - lerpedBuffer[i] * halfH, i, 877 + lerpedBuffer[i] * halfH);
    line (i, halfH - lerpedBuffer[i] * halfH * 4f, halfH + lerpedBuffer[i] * halfH * 4f, i);
  }
  float average = sum / (float) ab.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
}

void minimInitialise()
{
   minim = new Minim(this);
  ap = minim.loadFile ("groove.mp3", 1024);
  ap.play();
  ab = ap.mix;
}
