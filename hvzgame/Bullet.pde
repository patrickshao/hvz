class Bullet {
  
  //(x,y) coordinates, may change to a point
  float x,y;

  //The angle the bullet will move
  float a;
  
  //Speed of the bullet
  float s;
  
  //Image of the bullet
  PImage img;
  
  Bullet(float x, float y, float a, float s) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.s = s;
  }
  
  void drawBullet() {
    //color = color.Orange()
  }
  
  void moveBullet() {
    int dx = cos(radians(a))*s;
    int dy = sin(radians(a))*s;
    this.x += dx;
    this.y += dx;
  }
}
