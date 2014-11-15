//Modifiable Numbers and Values!
int xScreen = 800;
int yScreen = 600;
int ammoLimit = 6;
float mouseAngle;
ArrayList<Block> blocks;
Human player;
final float PLAYERHEIGHT = 86.0;
final float PLAYERWIDTH = 34.0;

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
  player=new Human(xScreen/2-PLAYERWIDTH/2,yScreen/2-PLAYERHEIGHT/2,PLAYERWIDTH,PLAYERHEIGHT);
}
void draw() {
  background(0,100,0);
  mouseAngle = degrees(atan2(mouseY-height/2, mouseX-width/2));
  drawCrosshair();
  drawBullets();
  drawPlayer();
}

void drawPlayer(){
  //player.move();
  player.drawHuman();
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
  ammo = player.getBullets();
  for (int i=ammo.size()-1;i>=0;i--) {
    Bullet b=ammo.get(i);
    b.moveBullet();
    b.drawBullet();
    if (b.outOfRange()) {
      ammo.remove(i);
      player.setBullets(ammo);
    }
  }
}

void mouseReleased() {
  crossHairC = color(150);
}

void mousePressed() {
  crossHairC = color(255,0,0);
  ammo = player.getBullets();
  if (ammo.size() < player.CLIPSIZE) {
    //ammo.add(new Bullet(xScreen/2,yScreen/2,mouseAngle,5));
    player.fire();
  }
}
void keyPressed(){
  if (key=='r'){player.reload();}
  if (key=='w'){player.setDir(-90);}
  if (key=='a'){player.setDir(180);}
  if (key=='s'){player.setDir(90);}
  if (key=='d'){player.setDir(0);}
}
