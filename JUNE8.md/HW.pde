 PImage img;
 //integer varaibles given to the two differe sizes of the points which was the first 
 //step in solving the problem with the size of the dots
int smallPoint, largePoint;

void setup() {
  size(700, 700);
  img = loadImage("/Users/rashid/desktop/pics/stcloud.jpg");
  //Below is the solution to the problem I was facing, which I managed to solve by
  //looking at a tutorial which indicated that I had to give the points custom sizes.
  
  
  smallPoint = 4;
  largePoint = 30;
  imageMode(CENTER);
  noStroke();
  background(255);
}
//this part of the code will generate the points randomly towards the canvas
void draw() { 
  
  
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  
//this outlines that the dots should randomly align themselves to draw the photo
//the reason why I did this was I tried doing it with chosen x/y values but the process
//of drawing the photo was unsatisfying. Making it random makes it interesting and 
//intrigues the audience into watching the wole process.

  int x = int(random(img.width));
  int y = int(random(img.height));
  
  color pix = img.get(x, y);
  fill(pix, 168);
  //this is the cration of the ellipse that would pointillize the selected image
  ellipse(x, y, pointillize, pointillize);
}
