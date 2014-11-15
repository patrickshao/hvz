class Human extends Entity{
  
  private PImage hPic;
  float bulletSpeed = 10;
  float shotAngle=0;
  private int clipsize=6;
  private int numInClip=6;
  private float reloadTime=5;
  private ArrayList<Bullet> bulletAL;
  private int reloadingPause;
  private boolean reloading;
  private boolean isDead;
  
  Human(float x, float y, float w, float h){
    super(x,y,w,h);
    speed = 10;
    hPic = loadImage("REPLACE");
    hPic.resize(int (w),int (h));
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
  
  public void die(){
    isDead=true;
  }
  
}
