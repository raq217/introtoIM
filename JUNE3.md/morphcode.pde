
ArrayList<PVector> shape1 = new ArrayList<PVector>();
ArrayList<PVector> shape2 = new ArrayList<PVector>();

//I tried to add a third shape but it didn't work for some reason

ArrayList<PVector> morph = new ArrayList<PVector>();


boolean state = false;

void setup() {
  size(540, 360);

  // Here I am creating the vectors for the shape
  for (int angle = 180; angle < 300; angle += 9) {
    // Note we are not starting from 0 in order to match the
    // path of a circle.  
    PVector v = PVector.fromAngle(radians(angle-180));
    v.mult(100);
    shape1.add(v);
    // adding the pvectors
    morph.add(new PVector());
  }
  
   
  for (int angle = 180; angle < 200; angle += 9) {
    // Note we are not starting from 0 in order to match the
    // path of a circle.  
    PVector v = PVector.fromAngle(radians(angle-105));
    v.mult(150);
    shape1.add(v);

    morph.add(new PVector());
    
  }

  //these are the points of each shape
  for (int x = -50; x < 50; x += 10) {
    shape2.add(new PVector(x, -50));
  }

  for (int y = -50; y < 50; y += 10) {
    shape2.add(new PVector(50, y));
  }

  for (int x = 50; x > -50; x -= 10) {
    shape2.add(new PVector(x, 50));
  }
  
  for (int y = 40; y > -50; y -= 10) {
    shape2.add(new PVector(-50, y));
  }
}


void draw() {
  background(21,190,60);

  
  float totalDistance = 0;
  
  // Look at each vertex
  for (int i = 0; i < shape1.size(); i++) {
    PVector v1;
    
    if (state) {
      v1 = shape1.get(i);
    }
    else {
      v1 = shape2.get(i);
    }
    // the vertex that will be drawn
    PVector v2 = morph.get(i);
    // Lerp to the target
    v2.lerp(v1, 0.05);
   
    totalDistance += PVector.dist(v1, v2);
  }
  

  if (totalDistance < 0.1) {
    state = !state;
  }
  

  translate(width/2, height/2);
  strokeWeight(4);
 
  beginShape();
  stroke(255);
  for (PVector v : morph) {
    vertex(v.x, v.y);
  }
  endShape(CLOSE);
}
