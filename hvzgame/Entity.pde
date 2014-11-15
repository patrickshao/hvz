class Entity{
  float x,y,w,h;
  float dirAngle;
  int speed;
  int health = 1;
  Rectangle hitbox;
  
  Entity(float x, float y, float w, float h){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    dirAngle=0;
    hitbox = new Rectangle(x,y,w,h);
  }
  
  public void move(){
    x+=cos(radians(dirAngle))*speed;
    y+=sin(radians(dirAngle))*speed;
  }
  
  public void setDir(float angleInDegrees){
    dirAngle = angleInDegrees;
  }
  
  public boolean contains(Point point){
    return hitbox.contains(point);
  }
  
}
