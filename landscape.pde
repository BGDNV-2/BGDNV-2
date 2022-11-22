void setup() {

  size(1280, 720);
}

void draw() {


  frameRate(75);
  smooth();
  background(255);
  noStroke();

  drawSky();
  drawSun();
  drawCar();
  drawField();
  drawStreet();
  
  
}

int xPos = 1280;
int yPos = 720;
int sunDiameter = 100;
float angle = 0.05;
float speedSun = 0.05;
float red = 255.0;
float green = 255.0;
float blue = 255.0;
float pi = 3.1415;

void drawSky() {

  fill(53, 171, 207);
  rect(0, 0, xPos, yPos / 2.0);
}

void drawSun() {

  // animate circle

  
  float x = (xPos / 4.0 - sunDiameter / 2.0) + cos(angle) * 250;
  float y = (xPos / 20.0) + sin(angle) * 250;
  angle = angle + speedSun;
  green = green - 1;
  
  fill(red, green, blue - blue);
  circle(x + xPos / 4.0, y + xPos / 5.0, sunDiameter);
  
  // reset the color
  
  if(green == 0) {
  
    green = 255;
  
  }
  
}

void drawCar() {

  fill(255, 40, 0);
  // the big part of the car
  rect(xPos / 2.0, yPos, xPos/ 2.0, yPos / 2.0);
}

void drawField() {

  fill (30, 166, 69);
  rect(0, yPos / 2.0, xPos, yPos);
}

void drawStreet () {

  fill(128);
  quad(xPos / 3.0, yPos, xPos / 2.1, yPos / 2.0, xPos / 1.9, yPos / 2.0, xPos / 1.5, yPos );

  // white lines on the street

  fill(255);
  triangle(xPos / 2.25, yPos, xPos / 2.0, yPos / 2.0, xPos / 1.85, yPos);
}
