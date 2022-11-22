void setup() {

  size(1280, 720);
}

void draw() {

  frameRate(75);
  smooth();
  background(0);
  noStroke();

  drawSky();
  drawSun();
  drawMoon();
}

int xPos = 1280;
int yPos = 720;
int sunDiameter = 100;

int time = 0; // 0 = day; 1 = night;

void drawSky() {

  fill(53, 171, 207);
  rect(0, 0, xPos, yPos / 2.0);
}

float angle = 0; 

void drawSun() {

  fill(255,255,0);
  circle(xPos / 4.0 - sunDiameter / 2.0 + xPos / 4.0, xPos / 20.0 + xPos / 25.0, sunDiameter);

  // animate the sun
  
  

}

void drawMoon() {

  fill(255,255,255);
  circle(xPos / 3.75 - sunDiameter / 2.0 + xPos / 4.0, xPos / 20.0 + xPos / 2.25 , sunDiameter);
  
  fill(0,0,0);
  circle(xPos / 3.3 - sunDiameter / 2.0 + xPos / 4.0, xPos / 20.0 + xPos / 2.25 , sunDiameter);

}
