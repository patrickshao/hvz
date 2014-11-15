//Modifiable Numbers and Values!
int xScreen = 800;
int yScreen = 600;
int ammoLimit = 6;

//Don't change these.
PImage bgImage;
Bullet[] ammo;

color crossHairC = color(150);

void setup() {
  size(xScreen,yScreen);
  ammo = new Bullet[6];
  noCursor();
}
void draw() {
  background(0,100,0);
  
  drawCrosshair();
}

void drawCrosshair() {
  noFill();
  strokeWeight(2);
  stroke(crossHairC);
  
  ellipse(mouseX,mouseY,20,20);
  line(mouseX-7,mouseY,mouseX-13,mouseY);
  line(mouseX+7,mouseY,mouseX+13,mouseY);
  line(mouseX,mouseY-7,mouseX,mouseY-13);
  line(mouseX,mouseY+7,mouseX,mouseY+13);
}

void mouseReleased() {
  crossHairC = color(150);
}

void mousePressed() {
  crossHairC = color(255,0,0);
}
