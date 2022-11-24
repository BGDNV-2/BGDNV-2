float xPos = 1280;
float yPos = 720;
float sunDiameter = 100;
float xMiddle = xPos / 2.0;
float yMiddle = yPos / 2.0;

float time = 0; // 0 = day; 1 = night;
float speed = 0.003;

float red = 255;
float green = 255;
float blue = 255;

float rgb = 0;
boolean forwards = true;

float scale = 1;
float angle = 1;

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
  drawMoon();
  drawField();
  drawStreet();
  drawCar();

  if (forwards == true) {

    rgb = rgb + speed;
  } else {
    rgb = rgb - speed;
  }

  if (rgb > 1) {
    forwards = false;
  }

  if (rgb < 0) {
    forwards = true;
  }
}

void drawSky() {
  fill(53 - 53 * rgb, 171 - rgb * 171, 207 - rgb * 207);
  rect(0, 0, xPos, yMiddle);
}

void drawSun() {
  fill(red, green, 0);
  circle(xMiddle - 300 * sin(time * PI), yMiddle  - 300 * cos(time * PI), sunDiameter);

  green = green - 2;

  // ifffffff

  if (time % 1 >= 0.5) {
    green = 255;
  }
}

void drawMoon() {
  fill(255, 255, 255);
  circle(xMiddle + 300 * sin(time * PI), yMiddle + 300 * cos(time * PI), sunDiameter); // real moon

  time = time + speed;

  System.out.println("time: " + time + " rgb: " + rgb);
}

void drawField() {
  fill (30 - 30 * rgb, 166 - 166 * rgb, 69 - 69 * rgb);
  rect(0, yMiddle, xPos, yPos);
}

void drawStreet () {
  fill(128 - 128 * rgb );
  quad(xPos / 3.0, yPos, xPos / 2.1, yMiddle, xPos / 1.9, yMiddle, xPos / 1.5, yPos );

  // white line on the street

  fill(255 - 255 * rgb);
  triangle(xPos / 2.1, yPos, xMiddle, yMiddle, xPos / 1.9, yPos);
}

void drawCar() {
  fill(155 - 155 * rgb, 25 - 25 * rgb, 0);
  stroke(1);

  rect((xMiddle + 70) * scale, (yMiddle + yMiddle * 0.70) * scale, xMiddle * 0.10 * scale, yPos * scale); // little square

  fill(155 - 155 * rgb, 25 - 25 * rgb, 0);
  rect((xMiddle + 55) * scale, (yMiddle + yMiddle * 0.80) * scale, xMiddle * 0.15 * scale, yPos * scale); // big square

  if (forwards == true) {
    fill (255, 0, 0);
  } else {
    fill (255, 255, 0);
  }

  circle((xMiddle + 75) * scale, yMiddle * 1.88 * scale, 20 * scale);
  circle((xMiddle + 130) * scale, yMiddle * 1.88 * scale, 20 * scale);

  //scale = scale - speed;
}

//PROBLEME : Auto scheint im Boden zu sein
//Probleme: Skalierung geht, allerdings das Auto fliegt zur Ecke oben Links und nicht zur Mitte
