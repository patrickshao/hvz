class Zed extends Entity{
  
    private PImage zPic;
    private Human theHum; 
  
    Zed(float x, float y, float w, float h, Human hum){
      super(x,y,w,h);     
      speed = 10;
      zPic = loadImage("Feldblum basic.png"); //REPLACE
      zPic.resize(int (w),int (h));
      theHum =hum;
  }
  
    public void move(){
      faceHuman();
      x+=cos(radians(dirAngle))*speed;
      y+=sin(radians(dirAngle))*speed;
      if (super.overlaps((Entity)theHum)) {
        theHum.damage();
      };
    }
  
    public void faceHuman() {
     this.setDir(degrees(atan2(theHum.getY()-this.getY(),theHum.getX()-this.getX())));
  }
  
    public void gotHit() {
      Arraylist<Bullets> bList = theHum.getBullets();
      for (int i = 0; i < bList.length(); i++) {
        if (overlaps(bList.get(i))) {
          theZed.damage();
          break;
        }
      }
    }
}
