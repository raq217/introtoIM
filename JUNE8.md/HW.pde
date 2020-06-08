void setup() {
  size(700, 700);
  img = loadImage("/Users/rashid/desktop/pics/stcloud.jpg");
  smallPoint = 4;
  largePoint = 30;
  imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() { 
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 168);
  ellipse(x, y, pointillize, pointillize);
}
