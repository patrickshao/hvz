class Entity{

  protected float dirAngle;
  protected int speed;
  protected int health = 1;
  protected float x;
  protected float y;
  protected float w;
  protected float h;
  protected boolean isDead=false;
  
  Entity(float x, float y, float w, float h){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    dirAngle=0;
  }
  
  public void move(){
    x+=cos(radians(dirAngle))*speed;
    y+=sin(radians(dirAngle))*speed;
  }
  
  public void setDir(float angleInDegrees){
    dirAngle = angleInDegrees;
  }
  
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  public float getW(){
    return w;
  }
  public float getH(){
    return h;
  }
  public boolean isDead(){
    return (health==0);
  }
  public void damage(){
    if (health >0){
      health--;
    }
  }
  public void die(){
    isDead=true;
  }
}
