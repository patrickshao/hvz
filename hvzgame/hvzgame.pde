//Modifiable Numbers and Values!
int xScreen = 800;
int yScreen = 600;
int ammoLimit = 6;
float mouseAngle;

//Don't change these.
PImage bgImage;
ArrayList<Bullet> ammo;

color crossHairC = color(150);

void setup() {
  rectMode(CENTER);
  size(xScreen,yScreen);
  ammo = new ArrayList<Bullet>();
  noCursor();
  mouseAngle = 0;
}
void draw() {
  background(0,100,0);
  mouseAngle = atan((mouseY-yScreen) / (mouseX-xScreen));
  drawCrosshair();
  drawBullets();
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

void drawBullets() {
  for (int i = ammo.size()-1; i >= 0; i--) {
    Bullet b = ammo.get(i);
    b.moveBullet();
    b.drawBullet();
  }
}

void mouseReleased() {
  crossHairC = color(150);
}

void mousePressed() {
  crossHairC = color(255,0,0);
  if (ammo.size() < ammoLimit) {
    ammo.add(new Bullet(xScreen/2,yScreen/2,mouseAngle,1));
  }
}
