class Tank {
  float x,y,s;
  
  int r,g,b;
  
  String dir;
  
  int dx,dy;
  
  int redFlash = 0;
  
  private ArrayList<Bullet> ammoAL;
  
  Tank(float x, float y, float s) {
    this.x = x;
    this.y = y;
    this.s = s;
    
    this.dir = "RIGHT";
    
    this.r = (int)random(2)*255;
    this.g = (int)random(2)*255;
    this.b = (int)random(2)*255;
    ammoAL = new ArrayList();
  }
  
  void drawTank() {
    makeTank();
  }
  
  void makeTank() {
    moveCoords();
    if (redFlash > 0) {
      stroke(255,0,0);
      redFlash--;
      fill(255,0,0,100);
      rect(0,500,0,yScreen);
    }
    else {
      stroke(0);
    }
    fill(r,g,b);
    if (dir.equals("UP")) {
      rect(x-s*2,y,s,s*5);
      rect(x+s*2,y,s,s*5);
      rect(x,y-s*2,s,s/2*3);
      rollAnimation("UP");
    }
    else if (dir.equals("DOWN")) {
      rect(x-s*2,y,s,s*5);
      rect(x+s*2,y,s,s*5);
      rect(x,y+s*2,s,s/2*3);
      rollAnimation("DOWN");
    }
    else if (dir.equals("LEFT")) {
      rect(x,y-s*2,s*5,s);
      rect(x,y+s*2,s*5,s);
      rect(x-s*2,y,s/2*3,s);
      rollAnimation("LEFT");
    }
    else {
      rect(x,y-s*2,s*5,s);
      rect(x,y+s*2,s*5,s);
      rect(x+s*2,y,s/2*3,s);
      rollAnimation("RIGHT");
    }
    rect(x,y,s*3,s*3);
    stroke(0);
  }
  
  void rollAnimation(String dir) {
    if (dir.equals("UP") || dir.equals("DOWN")) {
      for (float i = y-s*2; i < y+s*5/2; i++) {
        float temp = (float)(((int)i/5)*5);
        line(x-s*5/2,temp,x-s*3/2,temp);
        line(x+s*3/2,temp,x+s*5/2,temp);
      }
    }
    else {
      for (float i = x-s*2; i <x+s*5/2; i++) {
        float temp = (float)(((int)i/5)*5);
        line(temp,y-s*5/2,temp,y-s*3/2);
        line(temp,y+s*3/2,temp,y+s*5/2);
      }
    }
  }
  
  void moveCoords() {
    x+=dx;
    y+=dy;
  }
  
  void autoPlace() {
    if (x < -tSize) {
      x = xScreen;
    }
    else if (x > xScreen) {
      x = -tSize;
    }
    else if (y < -tSize) {
      y = yScreen;
    }
    else if (y > yScreen) {
      y = -tSize;
    }
  }
  
  void collideWall() {
    if (x-tSize*3 <= 0) {
      x = tSize*3;
    }
    else if (x+tSize*3 >= xScreen) {
      x = xScreen-tSize*3;
    }
    if (y-tSize*3 <= 0) {
      y = tSize*3;
    }
    else if (y+tSize*3 >= yScreen) {
      y = yScreen-tSize*3;
    }
  }
  
  void setDirection(String dir) {
    this.dir = dir.toUpperCase();
  }
  
  void colorChange() {
    this.r = (int)random(2)*255;
    this.g = (int)random(2)*255;
    this.b = (int)random(2)*255;
    drawTank();
  }
  
  void setColor(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  int getAmmoSize() {
    return this.ammoAL.size();
  }
  
  void shootBullet() {
    Bullet shot = new Bullet(x,y,s/2,r,g,b,dir,dTankBullet);
    ammoAL.add(shot);
  }
  
  void drawBullets() {
    for (int i = ammoAL.size()-1; i >= 0; i--) {
      Bullet b = ammoAL.get(i);
      b.moveBullet();
      b.drawBullet();
      if ((int)b.x > xScreen+50 || (int)b.x < 0 ||
       (int)b.y > yScreen+50 || (int)b.y < 0) {
        ammoAL.remove(i);
      }
    }
  }
  
  void act() {
    if (ifBoss) {
      collideWall();
    }
    else {
      autoPlace();
    }
    drawBullets();
    drawTank();
  }
}
