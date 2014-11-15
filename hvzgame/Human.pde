class Human extends Entity{
  
  private PImage hPic;
  float shotAngle=0;
  private int clipsize=6;
  private int numInClip=6;
  private float reloadTime=5;
  private ArrayList<Bullet> ammoAL;
  private int reloadingPause;
  
  Human(float x, float y, float w, float h){
    super(x,y,w,h);
    speed = 10;
    pic = loadImage("REPLACE");
    pic.resize(int (w),int (h));
  }
  
  public boolean overlaps(Entity e){
  }
  
  public void fire(){
    //check if reloading
    //update array list
    //create new bullet from shotAngle, x, y
    //update clip
  }
  
  public void reload(){
    //start pause timer
    //start adding bullets, with pause
  }
  
  

  
}
