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
    public boolean overlaps(Entity e) {
     return (e.getX()-e.getW()/2 < x+w/2 && e.getX()+e.getW()/2 > x-w/2 && e.getY()-e.getH()/2 < y+h/2 && e.getY()+e.getH()/2 > y-h/2);
    }
    
    public void move(){
      x+=cos(radians(dirAngle))*speed;
      y+=sin(radians(dirAngle))*speed;
      overlaps(theHum);
  }
  
  public void faceHuman() {
     this.setDir(degrees(atan2(theHum.getY()-this.getY(),theHum.getX()-this.getX())));
  }
}
