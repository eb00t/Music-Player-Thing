class compactDisc
{
  float rotateCD; //how fast the cd spins
  float cdX, cdY, cdSize; //x coord, y coord and size of cd
  float hue1, hue2, saturation, brightness;
  
  compactDisc(float cdX, float cdY, float cdSize)
  {
    this.cdX = cdX;
    this.cdY = cdY;
    this.cdSize = cdSize;
    saturation = 255;
    brightness = 255;
  }
  void drawCDs()
  {
    drawCDpart2();
    fakeLights();
    drawCDpart1();
    drawCDpart4();
    fakeLights2();
    drawCDpart3();
  }

  void drawCDpart1()
  {
    pushMatrix();
    strokeWeight(2);
    stroke (183);
    fill (150);
    circle (cdX, cdY, 250 * cdSize);
    fill(0);
    stroke(0);
    circle (cdX, cdY, 150 * cdSize);
    popMatrix();
  }

  void drawCDpart2() //these are separated in order for the fake lights to only draw on the shiny part of the disc; it draws the grey part of the CD
  {
    pushMatrix();
    fill(200);
    noStroke();
    circle(cdX, cdY, 1000 * cdSize);
    fill(0);
    textAlign(CENTER);
    textFont(OpenSans);
    textSize(75 * cdSize);
    popMatrix();
    pushMatrix();
    translate(cdX, cdY);
    rotate(rotation);
    text("Music Guy", cdX, cdY - (cdSize * 250));
    popMatrix();
  }
  
  void drawCDpart3()
  {
    pushMatrix();
    strokeWeight(2);
    stroke (183);
    fill (150);
    circle (cdX + width, cdY, 250 * cdSize);
    fill(0);
    stroke(0);
    circle (cdX + width, cdY, 150 * cdSize);
    popMatrix();
  }
  
  void drawCDpart4() //these are separated in order for the fake lights to only draw on the shiny part of the disc
  {
    pushMatrix();
    fill(200);
    noStroke();
    circle(cdX + width, cdY, 1000 * cdSize);
    fill(0);
    textAlign(CENTER);
    textFont(OpenSans);
    textSize(75 * cdSize);
    popMatrix();

    pushMatrix();
    translate(cdX + width, cdY);
    rotate(-rotation);
    text("Music Dude", cdX, cdY - (cdSize * 250));
    popMatrix();
  }

  void fakeLights()
  {
    pushMatrix();
    hue1 = musicAvg * 1000 * 10;
    hue2 = musicAvg * 1000 * 5;
    fill(hue1, saturation, brightness, 64);
    noStroke();
    arc(0 * cdSize, height/2, 1000 * cdSize, 1000 * cdSize, radians(285), radians(345));
    fill(hue2, saturation, brightness, 64);
    arc(0 * cdSize, height/2, 1000 * cdSize, 1000 * cdSize, radians(15), radians(75));
    popMatrix();
  }

  void fakeLights2()
  {
    pushMatrix();
    fill(hue1, saturation, brightness, 64);
    noStroke();
    arc(0 + width, height/2, 1000 * cdSize, 1000 * cdSize, radians(195), radians(255));
    fill(hue2, saturation, brightness, 64);
    arc(0 + width, height/2, 1000 * cdSize, 1000 * cdSize, radians(105), radians(165));
    popMatrix();
  }
}
