class Human extends Entity{
  
  private ArrayList<Bullet> ammoAL;
  private PImage pic;
  float shotAngle;
  
  Human(float x, float y, float w, float h){
    super(x,y,w,h);
    speed = 10;
    pic = loadImage("REPLACE");
    pic.resize(int (w),int (h));
  }
}
