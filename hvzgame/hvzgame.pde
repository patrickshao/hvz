//Modifiable Numbers and Values!
int xScreen = 800;
int yScreen = 600;
int ammoLimit = 6;
float mouseAngle;
ArrayList<Block> blocks;
Human player;
ArrayList<Zed> zList;
final float PLAYERHEIGHT = 86.0;
final float PLAYERWIDTH = 34.0;
int numzeds = 50;

//Don't change these.
PImage bgImage;
ArrayList<Bullet> ammo;

color crossHairC = color(150);

void setup() {
  bgImage = loadImage("theMap.png");
  rectMode(CENTER);
  size(xScreen,yScreen);
  blocks = new ArrayList<Block>();
  noCursor();
  mouseAngle = 0;
  zList = new ArrayList<Zed>();
  player=new Human(xScreen/2-PLAYERWIDTH/2,yScreen/2-PLAYERHEIGHT/2,PLAYERWIDTH,PLAYERHEIGHT);
  for (int i=0;i<numzeds;i++){
    float zx = random(0,1)*xScreen;
    float zy = random(0,1)*yScreen;
    zList.add(new Zed(zx,zy,PLAYERWIDTH,PLAYERHEIGHT,player));
  }
}
void draw() {
  image(bgImage,-bgImage.width/2,-bgImage.height/2);
  mouseAngle = degrees(atan2(mouseY-height/2, mouseX-width/2));
  drawCrosshair();
  drawBullets();
  drawPlayer();
  drawZed();
}
void drawZed(){
  for (int i=zList.size()-1; i>=0; i--){
    Zed z = zList.get(i);
    if(z.isDead()){
      zList.remove(i);
    }
    else{
      z.gotHit();
      z.drawZed();
    }
  }
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
  if (key=='w'){
    translate(100,10);
    player.setDir(-90);
  }
  if (key=='a'){
    player.setDir(180);
  }
  if (key=='s'){
    player.setDir(90);
  }
  if (key=='d'){
    player.setDir(0);
  }
}
