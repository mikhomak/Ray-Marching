

public class RayCircle extends Circle {
  
  private RayCircle next;
  public static final int maxAmount = 12;
  private static int id = 0;
  
  public RayCircle(final float x, final float y, final float radius, final RayCircle next){
    super(x,y,radius);
    this.next = next;
  }
  
  public void updateCircle(final PVector newCenter, final Circle closestCircle){
    this.center = newCenter;
    if(getNext() != null){
       getNext().updateCircle();
    }
  }
  
  public void drawRayCircle(){
    
  }
  
  
  public RayCircle getNext(){return next;}
  public void setNext(final RayCircle next){this.next = next;}
  
  
  private float signedDstToCircle(final PVector previousCircle, final PVector closestPoint, final float radius){
  return (PVector.dist(closestPoint, previousCircle) - radius/2)*2;
}
}
