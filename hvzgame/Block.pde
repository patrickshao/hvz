class Block{
  
  float x,y,w,h;
  
  Block(float x,float y,float w,float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void drawBlock() {
    //Picture thrown in later
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
}
