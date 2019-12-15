
private final ArrayList<Circle> circles = new ArrayList();
private final PVector mainPoint = new PVector(350,150);
private final PVector mouseDirection = new PVector(0,0);
private final float mouseDirectionLength = 800f;

void setup() {
    size(800, 800);
    background(#5D5858);
     initCircles();
}

void draw(){  
    background(#5D5858);
    stroke(255);
    point(500, 500);
    fill(214,199,199,150);
    
    for(final Circle circle : circles){
        circle(circle.getCenter().x, circle.getCenter().y, circle.getRadius());
    }
  circle(mainPoint.x,mainPoint.y,signedDstToCircle(mainPoint,circles.get(0).getCenter(),60));


  findMouseDirectionLine();
  translate(mainPoint.x, mainPoint.y);
  line(0,0, mouseDirection.x,mouseDirection.y);
}


private void findMouseDirectionLine(){
  mouseDirection.x = mouseX - width/2;
  mouseDirection.y = mouseY - height/2;
  mouseDirection.normalize();
  mouseDirection.mult(mouseDirectionLength);
}


private void initCircles(){
 final Circle circle = new Circle(500f, 180f, 60f); 
 circles.add(circle);
}


private float signedDstToCircle(final PVector origin, final PVector circle, final float radius){
  return (PVector.dist(circle, origin) - radius/2)*2;
}
