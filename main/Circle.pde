
public class Circle{
   protected PVector center;
   protected float radius;
   public Circle(final float x, final float y, final float radius){
      center = new PVector(x, y);
      this.radius = radius;
   }
   
  public PVector getCenter(){return center;}
  public void setCenter(final PVector center){this.center = center;}
  public float getRadius(){return radius;}
  public void setRadius(final float radius){this.radius = radius;}

  
}
