
private final ArrayList<Circle> circles = new ArrayList();
private final PVector mainPoint = new PVector(350,150);
private final PVector mouseDirection = new PVector(0,0);
private final float mouseDirectionLength = 800f;
private final RayCircle mainCircle = new RayCircle(0,0,0,0);
private Circle closestCircle = new Circle(0,0,0);

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
  
  
    for(final Circle circle : circles){
        circle(circle.getCenter().x, circle.getCenter().y, circle.getRadius());
    }
  
  mainCircle.updateCircle(new PVector(0,0), circles);
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


private void initCircles(){
 final Circle circle1 = new Circle(200, 180, 60f);
 final Circle circle2 = new Circle(100, 500, 80f);
 final Circle circle3 = new Circle(-100, 340, 200f);
 final Circle circle4 = new Circle(370, 230, 120f);
 final Circle circle5 = new Circle(300, 420, 80f);  
 circles.add(circle1);
 circles.add(circle2);
 circles.add(circle3);
 circles.add(circle5);
 circles.add(circle4);
}
