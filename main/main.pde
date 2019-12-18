
private final ArrayList<Circle> circles = new ArrayList();
private final RayCircle mainCircle = new RayCircle(0,0,0,0);
private final float speed = 7f;
private final PVector mainCirclePosition = new PVector(0,0);
private final boolean keys[] = new boolean[128];
private final float MIN_RADIUS = 40;
private final float MAX_RADIUS = 200;
private final int MAX_CIRCLES = 12;
void setup() {
    size(1600, 800);
    background(#5D5858);
    initCircles();
}

void draw(){  
  background(51, 129, 68);
  stroke(255);
  fill(90,150,197,150);
  for(final Circle circle : circles){
      circle(circle.getCenter().x, circle.getCenter().y, circle.getRadius());
  }
  fill(214,199,199,150);
  move();
  mainCircle.updateCircle(mainCirclePosition, circles, mainCirclePosition); 
}

private void initCircles(){
 for(int i = 0; i <= MAX_CIRCLES; i++){
   circles.add(new Circle(random(width), random(height), random(MIN_RADIUS, MAX_RADIUS)));
 }
}


void move(){
   if(keys['w']){
     mainCirclePosition.y -= speed;
   }
   if(keys['s']){
     mainCirclePosition.y += speed;
   }
   if(keys['a']){
     mainCirclePosition.x -= speed;
   }
   if(keys['d']){
     mainCirclePosition.x += speed;
   }
}

void keyPressed(){
    keys[key] = true;
}

void keyReleased(){
   keys[key] = false; 
}
