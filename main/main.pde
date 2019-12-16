
private final ArrayList<Circle> circles = new ArrayList();
private final PVector mainPoint = new PVector(350,150);
private final PVector mouseDirection = new PVector(0,0);
private final float mouseDirectionLength = 800f;
private final int maxCircles = 12;

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
    
  translate(mainPoint.x, mainPoint.y);
  drawMainCircle(new PVector(0,0), circles.get(0));
  
    for(final Circle circle : circles){
        circle(circle.getCenter().x, circle.getCenter().y, circle.getRadius());
    }
  
  

  stroke(255,0,0);
  strokeWeight(5);
  mouseDirection.x = mouseX - width/2;
  mouseDirection.y = mouseY - height/2;
  mouseDirection.normalize();
  
  //line(0,0,lol.x, lol.y);
  stroke(0,0,0);
  
  strokeWeight(1);
  
  
  
    mouseDirection.x = mouseX - width/2;
  mouseDirection.y = mouseY - height/2;
  mouseDirection.normalize();
  mouseDirection.mult(signedDstToCircle(new PVector(0,0), circles.get(0).getCenter(), circles.get(0).getRadius())/2);
  drawMainCircle(new PVector(mouseDirection.x, mouseDirection.y), circles.get(0));
    

  

  drawMainLine();  
}

private void drawMainLine(){
  findMouseDirectionLine();
  line(0,0, mouseDirection.x,mouseDirection.y);
}

private void findMouseDirectionLine(){
  mouseDirection.x = mouseX - width/2;
  mouseDirection.y = mouseY - height/2;
  mouseDirection.normalize();
  mouseDirection.mult(mouseDirectionLength);
}

private void drawMainCircle(final PVector center, final Circle nearestCircle){
  println(signedDstToCircle(center, nearestCircle.getCenter(), nearestCircle.getRadius()));
   circle(center.x,center.y,signedDstToCircle(center, nearestCircle.getCenter(), nearestCircle.getRadius()));
}

private void initCircles(){
 final Circle circle = new Circle(100, 180f, 60f); 
 circles.add(circle);
}


private float signedDstToCircle(final PVector origin, final PVector circle, final float radius){
  return (PVector.dist(circle, origin) - radius/2)*2;
}
