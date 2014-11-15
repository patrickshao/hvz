class Human extends Entity{
  
  private PImage hPic;
  private PImage gunPic;
  private float bulletSpeed = 10;
  private float shotAngle=0;
  final int CLIPSIZE=6;
  private int numInClip=CLIPSIZE;
  private int reloadTime=3000;
  private ArrayList<Bullet> bulletAL;
  private int reloadingPause;
  private int reloadTimer;
  private boolean reloading;
  
  Human(float x, float y, float w, float h){
    super(x,y,w,h);
    speed = 10;
    hPic = loadImage("Feldblum human.png");
    hPic.resize(int (w),int (h));
    gunPic = loadImage("nerf gun.png");
    gunPic.resize(gunPic.width/2,gunPic.height/2);
    bulletAL=new ArrayList<Bullet>();
    reloadTimer=-1*reloadTime;
  }
  
  public void updateHuman(){
    shotAngle=mouseAngle;

  }
  
  public void drawHuman(){
    updateHuman();
    image (hPic,x,y);
    float xOffset = 0;
    int inv = 1;
    if (abs(shotAngle) > 90) {
      inv = -1;
      xOffset = w/2;
    }
    pushMatrix();
    float c = inv*sin(radians(shotAngle));
    translate(x+xOffset,y+h/2);
    rotate(c);
    scale(1.0*inv,1.0);
    image (gunPic,0,0);
    rotate(-c);
    translate(-x-xOffset,-y-h/2);
    popMatrix();
  }
  
  public void fire(){
    
    if (millis()-reloadTimer > reloadTime && numInClip>0) {
      bulletAL.add(new Bullet(x,y+h/2,shotAngle, bulletSpeed));
      numInClip--;
      //System.out.println(numInClip);
    }

    //update array list
    //create new bullet from shotAngle, x, y
    //update clip
  }
  
  public void reload(){
    //start pause timer
    reloadTimer = millis();
    numInClip=CLIPSIZE;
    //let timer finish
    //set reloading to true
    //start adding bullets, with pause
      
  }
  
  public ArrayList<Bullet> getBullets(){
    return bulletAL;
  }
  public void setBullets(ArrayList<Bullet> b){bulletAL=b;}  
  
}
