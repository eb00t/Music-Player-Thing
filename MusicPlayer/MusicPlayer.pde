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
  fullScreen();
  minim = new Minim(this);
  ap = minim.loadFile ("groove.mp3", 1024);
  ap.play();
  ab = ap.mix;
}

void draw()
{
}
