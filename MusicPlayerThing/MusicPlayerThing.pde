import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioBuffer audioBuffer;
AudioPlayer audioPlayer;

BoxVisualiser boxVis;
DanceFloor danceFloor;
BarVisualiser barVis;
DiscoBall discoBall;
Lighting lighting;
compactDisc compactDisc;
HeartVisualiser heartVis;

float musicMax = 0; // maximum peak of the audio at a given time
float musicAvg = 0; // average of peaks of the audio at a given time
float calc = 0;
float abClone[] = new float[1024];
float rotation;
PFont OpenSans;
PFont OpenSansItalic;
PImage img;

void minimInitialise() // For setup, sets minim variables and plays audio
{
  minim = new Minim(this);
  audioPlayer = minim.loadFile("David_Dima_-_With_a_Little_Bit_of_True_Love.mp3", 1024);
  audioBuffer = audioPlayer.mix;
  audioPlayer.play();
}

void setup()
{
  size(1440, 860, P3D);
  colorMode(HSB);
  img = loadImage("discoball.png");

  minimInitialise();
  OpenSans = createFont("OpenSans.ttf", 32);
  OpenSansItalic = createFont("OpenSans-Italic.ttf", 12);
  textFont(OpenSans);
}

void draw()
{
  lights();
  background(0);
  rotation += abs((musicAvg*10)); // rotation for boxvisualiser and discoball
  // passes values into class, needs to be in draw because values are constantly updating
  boxVis = new BoxVisualiser(musicMax, musicAvg, rotation);
  danceFloor = new DanceFloor(musicMax, musicAvg);
  barVis = new BarVisualiser(abClone);
  discoBall = new DiscoBall(width/2, height/4, height/6, rotation);
  lighting = new Lighting(0, 0, musicAvg);
  compactDisc = new compactDisc (0, height/2, 1);
  heartVis = new HeartVisualiser();

  passMusicVals();

  // checks if the audio called inside minim is playing (it may take a few seconds to start playing)
  if (audioPlayer.isPlaying()) {
    // checks if time in the song is less than x miliseconds (1 seconds = 1000 milliseconds)
    if (audioPlayer.position() < 26500) {
      boxVis.createBox(); // draws box that changes size based on audio
    }

    if (audioPlayer.position() > 26500 && audioPlayer.position() < 40000) {
      danceFloor.drawFloor(); // draws 3d dance floor
      lighting.CreateLight();

      discoBall.render();
    }

    if (audioPlayer.position() > 40000 && audioPlayer.position() < 50000) {
      // draws an audio visualiser (as a waveform) using lines
      cloneArray();
      barVis.drawBars();
    }

    if (audioPlayer.position() > 50000 && audioPlayer.position() < 60000) {
      // draws an audio visualiser (as a waveform) using lines
      cloneArray();
      barVis.drawDiagonal();
    }

    if (audioPlayer.position() > 60000 && audioPlayer.position() < 75000) {
      // draws an audio visualiser (as a waveform) using lines
      cloneArray();
      compactDisc.drawCDs();

    }
    
        if (audioPlayer.position() > 75000 && audioPlayer.position() < 90000) {
      // draws an audio visualiser (as a waveform) using lines
      cloneArray();
      heartVis.render();

    }


    progressIndicator(); // draws time indicator and progress bar at bottom of screen
  } else {
    textFont(OpenSans);
    textAlign(CENTER);
    text("PAUSED / LOADING", width/2, height/2);
  }
}

void passMusicVals() // calculates and sets average and max music values to use with syncing visuals to audio
{
  for (int i = 0; i < audioBuffer.size(); i++)
  {
    // checks if a peak is higher than the highest recorded so far and changes value if it is higher
    if (audioBuffer.get(i) > i)
    {
      musicMax = lerp(musicMax, audioBuffer.get(i), 0.1f);
    }

    if (i > 0) {
      // adds all values inside the array together
      calc = calc + audioBuffer.get(i);
    }
  }

  // calculates average value for musicAvg - abs is to make sure it does not turn into a negative
  calc = abs(calc / audioBuffer.size());
  musicAvg = lerp (musicAvg, calc, 0.1f);
}

void cloneArray()
{
  for (int i = 0; i < audioBuffer.size(); i++)
  {
    abClone[i] = audioBuffer.get(i);
  }
}

void progressIndicator()
{
  float currentTime = audioPlayer.position();
  float runTime = audioPlayer.length();

  /*
    converts milseconds of currentTime and runTime to minutes and seconds
   for minutes: divide by 1000 and disregard remainder
   for seconds: divide by 1000 and take ONLY remainder
   */
  int ctMin = (int(currentTime/1000)/60);
  int ctSec = (int(currentTime/1000)%60);
  int rtMin = (int(runTime/1000)/60);
  int rtSec = (int(runTime/1000)%60);

  float step = (width) / (runTime/1000); // divides the width by the number of runtime seconds
  float barPos = (currentTime/1000) * step; // multiplies the number of steps by the number of seconds that have played so far

  fill(255);

  // basically turns the sketch into a janky youtube
  if (mousePressed && mouseY > height - 30) // makes sure the mouse is on the position of the bar and checks if mouse is pressed
  {
    audioPlayer.cue(int(map(mouseX, 0, width, 0, audioPlayer.length()))); // sets audioPlayer position to a time based on mouseX
    barPos = mouseX;
  }
  textFont(OpenSansItalic);
  textAlign(LEFT);

  // checks if second is below 10 and adds a 0 to the start if it is, else it doesn't (i.e time displayed as 5:9 so i changed it to 5:09)
  if (ctSec < 10) {
    text(ctMin + ":0" + ctSec + " / " + rtMin + ":" + rtSec + " | Click on progress bar to change audio position.", 50, height - 50);
  } else {
    text(ctMin + ":" + ctSec + " / " + rtMin + ":" + rtSec + " | Click on progress bar to change audio position.", 50, height - 50);
  }

  rect(0, height - 30, barPos, height - 30);
}

void keyPressed()
{
  if (key == ' ') {
    if (audioPlayer.isPlaying())
    {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  }
}
