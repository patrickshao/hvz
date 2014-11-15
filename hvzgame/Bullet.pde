class Bullet {
  
  int range = 150;
  
  //(x,y) coordinates, may change to a point
  float startX, startY;
  float x,y;

  //The angle the bullet will move
  float a;
  
  //Speed of the bullet
  float s;
  
  Bullet(float x, float y, float a, float s) {
    this.startX = x;
    this.startY = y;
    this.x = x;
    this.y = y;
    this.a = a;
    this.s = s;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  void drawBullet() {
    strokeWeight(1);
    stroke(0,0,255,200);
    fill(204, 102, 0);
    ellipse(this.x,this.y,8,8);
  }
  
  boolean outOfRange() {
    float dist = sqrt(pow(this.x - this.startX,2)+pow(this.y - this.startY,2));
    if (dist > range) {
      return true;
    }
    return false;
  }

  void moveBullet() {
    //Get dx & dy values
    float dx = cos(radians(a))*s;
    float dy = sin(radians(a))*s;
    this.x += dx;
    this.y += dy;
  }
}
