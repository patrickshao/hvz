class Zed extends Entity{
  
    private PImage zPic;
    private Human theHum; 
  
    Zed(float x, float y, float w, float h, Human hum){
      super(x,y,w,h);     
      speed = 2.1;
      zPic = loadImage("zombie3.png"); //REPLACE
      zPic.resize(int (w),int (h));
      theHum =hum;
  }
    
    public void drawZed(){
      move();
      image (zPic,x,y);
    }
  
    public void move(){
      faceHuman();
      super.move();
      if (super.overlaps((Entity)theHum)) {
        theHum.damage();
      };
    }
    
    public void displaceZed(float dx, float dy) {
      x += dx;
      y += dy;
    }
  
    public void faceHuman() {
     setDir(degrees(atan2(theHum.getY()-this.getY(),theHum.getX()-this.getX())));
  }
  
    public void gotHit() {
      ArrayList<Bullet> bList = theHum.getBullets();
      for (int i = bList.size()-1; i >= 0; i--) {
        if (overlaps(bList.get(i))) {
          damage();
          bList.remove(i);
          break;
        }
      }
    }
    
}
