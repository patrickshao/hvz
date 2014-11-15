class Human extends Entity{
  
  private PImage hPic;
  private PImage gunPic;
  private float bulletSpeed = 10;
  private float shotAngle=0;
  private int clipsize=6;
  private int numInClip=6;
  private float reloadTime=5;
  private ArrayList<Bullet> bulletAL;
  private int reloadingPause;
  private boolean reloading;
  private int reloadTimer;
  
  Human(float x, float y, float w, float h){
    super(x,y,w,h);
    speed = 10;
    hPic = loadImage("Feldblum human.png");
    hPic.resize(int (w),int (h));
    gunPic = loadImage("nerf gun.png");
    gunPic.resize(gunPic.width/2,gunPic.height/2);
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
    float c = inv*sin(radians(shotAngle));
    translate(x+xOffset,y+h/2);
    rotate(c);
    scale(1.0*inv,1.0);
    image (gunPic,0,0);
    rotate(-c);
    translate(-x-xOffset,-y-h/2);
  }
  
  public void fire(){
    reloading = false;
    bulletAL.add(new Bullet(x,y,shotAngle, bulletSpeed));
    numInClip--;
    //update array list
    //create new bullet from shotAngle, x, y
    //update clip
  }
  
  public void reload(){
    //start pause timer
    //let timer finish
    //set reloading to true
    //start adding bullets, with pause
  }
  
  public ArrayList<Bullet> getBullets(){
    return bulletAL;
  }
  
}
