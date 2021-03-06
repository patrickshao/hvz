class Entity{

  protected float dirAngle;
  protected float speed;
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
    boolean canMove = true;
    for(Block block:blocks){
      if(overlaps(block)){
        canMove = false;
      }
      
    }
    if (canMove){
        x+=cos(radians(dirAngle))*speed;
        y+=sin(radians(dirAngle))*speed;
      }
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
    if (health <=0){
      die();
    }
    
  }
  public void die(){
    isDead=true;
  }
  public boolean overlaps(Entity e) {
     return (e.getX()-e.getW()/2 < x+w/2 && e.getX()+e.getW()/2 > x-w/2 && e.getY()-e.getH()/2 < y+h/2 && e.getY()+e.getH()/2 > y-h/2);
  }
  public boolean overlaps(Bullet b) {
     return (b.getX() < x+w/2 && b.getX() > x-w/2 && b.getY() < y+h/2 && b.getY() > y-h/2);
  }
  public boolean overlaps(Block b){
    return (b.getX()-b.getW()/2 < x+w/2 && b.getX()+b.getW()/2 > x-w/2 && b.getY()-b.getH()/2 < y+h/2 && b.getY()+b.getH()/2 > y-h/2);
  }
}
