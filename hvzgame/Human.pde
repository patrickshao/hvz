class Human extends Entity{
  
  private PImage hPic;
  float shotAngle;
  private int clipsize=6;
  private int numInClip=6;
  private float reloadTime=5;
  private ArrayList<Bullet> ammoAL;
  
  Human(float x, float y, float w, float h){
    super(x,y,w,h);
    speed = 10;
    pic = loadImage("REPLACE");
    pic.resize(int (w),int (h));
  }
  
  public boolean overlaps(Entity e){
  }
  
}
