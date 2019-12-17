public class RayCircle extends Circle {

    private RayCircle next;
    public static final int MAX_AMOUNT = 6;
    private final PVector mouseDirection = new PVector(0,0);
    public RayCircle(final float x, final float y, final float radius,final int id) {
        super(x, y, radius);  
        if(id <= MAX_AMOUNT){
           next = new RayCircle(0,0,0,id+1); 
        }else{
          next = null;
        }
    }

    public void updateCircle(final PVector newCenter,final ArrayList<Circle> circles, final PVector origin){
        this.center = newCenter;
        final Circle closestCircle = findClosestCircle(center, circles);
        drawRayCircle(closestCircle);
        mouseDirection.x = mouseX - width / 2;
        mouseDirection.y = mouseY - height / 2;
        mouseDirection.normalize();
        mouseDirection.mult(signedDstToCircle(center, closestCircle.getCenter(), closestCircle.getRadius())/2);
        if (getNext() != null) {
            getNext().updateCircle(mouseDirection.add(center),circles, origin);
        }else{
          stroke(255,0,0);
           line(origin.x, origin.y, mouseDirection.x + center.x, mouseDirection.y + center.y); 
        }
    }

    private Circle findClosestCircle(final PVector center, final ArrayList<Circle> circles){
      float min = 999999;
      Circle closestCircle = new Circle(0,0,0);
      for(final Circle circle : circles){
         float oldMin = min;
         min = min(min, signedDstToCircle(center, circle.getCenter(), circle.getRadius()));
         if(min != oldMin){
           closestCircle = circle;
         }
      }
      return closestCircle;
    }

    public void drawRayCircle(final Circle closestCircle) {
      circle(center.x,center.y, signedDstToCircle(center, closestCircle.getCenter(), closestCircle.getRadius()));
    }


    public RayCircle getNext() {
        return next;
    }
    public void setNext(final RayCircle next) {
        this.next = next;
    }


    public float signedDstToCircle(final PVector previousCircle, final PVector closestPoint, final float radius) {
        return (PVector.dist(closestPoint, previousCircle) - radius/2)*2;
    }
}
