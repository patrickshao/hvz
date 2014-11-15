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
    println(shotAngle);
    float c = sin(radians(shotAngle));
    translate(x,y+h/2);
    rotate(c);
    if (abs(shotAngle)>90){
      scale(-1.0,1.0);
      c=-c;
    }
      image (gunPic,0,0);
    rotate(-c);
    translate(-x,-y-h/2);
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
