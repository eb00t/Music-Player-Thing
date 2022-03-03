import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioBuffer ab;
AudioPlayer ap;

void setup()
{
  fullScreen(P3D);
  colorMode(HSB);
  minim = new Minim(this);
  ap = minim.loadFile ("groove.mp3", 1024);
  ap.play();
  ab = ap.mix;
  d = new DiscoBall(width/2, height/2, width/5); //Draws the disco ball
  l = new Lighting(width/2, height/2); //Creates the lights
}

DiscoBall d;
Lighting l;

void draw()
{
  background(0);
  d.render();
  d.update();
  l.render();
  
}
