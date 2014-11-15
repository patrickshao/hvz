class Bullet {
  
  int range = 20;
  
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
    noStroke();
    fill(204, 102, 0);
    ellipse(x,y,5,5);
  }

  void moveBullet() {
    float dx = cos(radians(a))*s;
    float dy = sin(radians(a))*s;
    this.x += dx;
    this.y += dx;
  }
}
