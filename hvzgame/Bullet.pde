class Bullet {
  
  //(x,y) coordinates, may change to a point
  float x,y;

  //The angle the bullet wil move
  float a;
  
  //Speed of the bullet
  float s;
  
  Bullet(float x, float y, float a, float s) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.s = s;
  }
  
  void drawBullet() {
    //We will throw in a picture later
  }
  
  void moveBullet() {
    if (dir.equals("UP")) {
      y-=delta;
    }
    else if (dir.equals("DOWN")) {
      y+=delta;
    }
    else if (dir.equals("LEFT")) {
      x-=delta;
    }
    else {
      x+=delta;
    }
  }
  
  boolean detectHit(Tank t, float x, float y) {
    boolean ifXHit = x >= t.x-t.s*2 && x <= t.x+t.s*2;
    boolean ifYHit = y >= t.y-t.s*2 && y <= t.y+t.s*2;
    if (ifXHit && ifYHit) {
      return true;
    }
    return false;
  }
