
private final ArrayList<Circle> circles = new ArrayList();


void setup() {
    size(800, 800);
    background(#5D5858);
     initCircles();
}

void draw(){  
    background(#5D5858);
    stroke(#E3CCCC);
    point(500, 500);
    
    line(500, 500, mouseX * 100, mouseY * 100);
    for(final Circle circle : circles){
        circle(circle.getCenter().x, circle.getCenter().y, circle.getRadius());
    }
  circle(500,500,signedDstToCircle(new PVector(500,500),circles.get(0).getCenter(),60));
  stroke(#EA1313);
  line(mouseX,mouseY,500,180);
  
}



private void initCircles(){
 final Circle circle = new Circle(500f, 180f, 60f); 
 circles.add(circle);
}


private float signedDstToCircle(final PVector origin, final PVector circle, final float radius){
  return (PVector.dist(circle, origin) - radius/2)*2;
}
