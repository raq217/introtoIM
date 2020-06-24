//Rashid Al Qubaisi
//Final assignment
//This is a game that involves the player trying to keep the ball in the game for as long as possible to try and destroy bricks.
//The more levels you pass the smaller the platform gets, making it harder to progress.


import processing.serial.*;
Serial port;


//These are the floats for the specific variables: ball, platform and the bricks appearing in different locations.
//It also includes the regulation of the speed of the ball when progressing in the game.

float brightness=220;
float circleX;
float speedX = 5;
float circleY;
float speedY = 3;
float rectX= 0;
float rectY= 0;
float rect0= rectX + 70;
float rect1 = rectY + 30;
float rectp= 70;
float rectv= 30;
float rect2= rectX + 140;
float rect3 = rectY + 60;
float recto= 140;
float rectm= 0;
float rect4= rectX + 210;
float rect5 = rectY + 30;
float rectl= 210;
float rectr= 30;
float rect6= rectX + 280;
float rect7 = rectY + 60;
float rectq= 280;
float rectw= 0;
float rect8= rectX + 350;
float rect9 = rectY + 30;
float rectj= 350;
float rectk= 30;
float rect10= rectX + 420;
float rect11 = rectY + 60;
float rectt= 100;
float rrect = 20;
float mmclick;
float torta;

PImage img;



void setup () {

//This makes sure that the right port is being used "COM3".

  port= new Serial(this, "COM3", 9600);
  port.bufferUntil('\n');

  size(640, 360);



  circleX = random(540);
  circleY = 160;

//This is the background I decided to use. I wanted to go with a space theme.
  img = loadImage("space.png");
}

void mousePressed() {
  circleX=random(640);
  circleY=50;
}

void draw() {

  background(0, 30, 30); 

  image(img, 0, 0); //Placement of the photo which is the direct center of the game.


//The bottom commands are the aesthetics of the bricks, what color they will be and how much stroke they will have.

  stroke(50);
  fill(255);
  ellipse(circleX, circleY, 24, 24);

  fill(0, 0, 255);
  rect(rectj, rectk, 70, 30, 3, 3, 3, 3);

  fill(255, 0, 0);
  rect(recto, rectm, 70, 30, 3, 3, 3, 3);

  fill(255, 0, 0);
  rect(rectq, rectw, 70, 30, 3, 3, 3, 3);

  fill(0, 0, 255);
  rect(rectl, rectr, 70, 30, 3, 3, 3, 3);

  fill(255, 0, 0);
  rect(rectX, rectY, 70, 30, 3, 3, 3, 3);

  fill(0, 0, 255);
  rect(rectp, rectv, 70, 30, 3, 3, 3, 3);

  fill(200);
  rect(brightness, 340, rectt, rrect, 18, 18, 18, 18);

  circleX = circleX + speedX;
  circleY = circleY + speedY;
  if (circleX > width) {
    speedX = -5;
  }

//Changing the speed depending on progress within the game.
  if (circleX < 0) {
    speedX = 5;
  }

  if (circleY < 0) {   
    speedY = 3;
  }

  if ((circleX > brightness)&&(circleY > 340 )&&(circleX<mmclick)) {
    speedY = -3;
  }

  if (circleY > 350 ) {
    speedY = 3;
  }

  if ((circleX >= rectX)&&(circleX <= rect0)&&(circleY>=rectY)&&(circleY<=rect1)) {
    rectX = -500;
    rectY = -500;
    rect0 = -500;
    rect1 = -500;
    speedX = 5;
    speedY = 3;
  } 

  if ((circleX >= rectp)&&(circleX <= rect2)&&(circleY>=rectv)&&(circleY<=rect3)) {
    rectp = -500;
    rectv = -500;
    rect2 = -500;
    rect3 = -500;
    speedX = 5;
    speedY = 3;
  } 

  if ((circleX >= recto)&&(circleX <= rect4)&&(circleY>=rectm)&&(circleY<=rect5)) {
    recto = -500;
    rectm = -500;
    rect4 = -500;
    rect5 = -500;
    speedX = -5;
    speedY = 3;
  } 
  if ((circleX >= rectl)&&(circleX <= rect6)&&(circleY>=rectr)&&(circleY<=rect7)) {
    rectl = -500;
    rectr = -500;
    rect6 = -500;
    rect7 = -500;
    speedX = -5;
    speedY = 3;
  } 

  if ((circleX >= rectq)&&(circleX <= rect8)&&(circleY>=rectw)&&(circleY<=rect9)) {
    rectq = -500;
    rectw = -500;
    rect8 = -500;
    rect9 = -500;
    speedX = 5;
    speedY = 3;
  }  
  if ((circleX >= rectj)&&(circleX <= rect10)&&(circleY>=rectk)&&(circleY<=rect11)) {
    rectj = -500;
    rectk = -500;
    rect10 = -500;
    rect11 = -500;
    speedX = 5;
    speedY = 3;
  } 

//This was one of the tricky parts as it outlined that the bricks had to disappear when in contact with the ball, hence why "-500" which is the brick size.

  if ((rectX == -500)&&(rectY == -500)&&(rect1 == -500)&&(rect0 == -500)&&(rectp == -500)&&(rectv == -500)&&(rect2 == -500)&&(rect3 == -500)
    &&(recto == -500)&&(rectm == -500)&&(rect4 == -500)&&(rect5 == -500)&&(rectl == -500)&&(rectr == -500)&&(rect6 == -500)&&(rect7 == -500)
    &&(rectq == -500)&&(rectw == -500)&&(rect8 == -500)&&(rect9 == -500)&&(rectj == -500)&&(rectk == -500)&&(rect10 == -500)&&(rect11 == -500)) {
    circleX = 300;
    circleY = 200;
    rectX = random(640);
    rectY = 0;
    rect0 = rectX + 70;
    rect1 = rectY + 30;
    rectp = random(640);
    rectv = 30;
    rect2 = rectp + 70;
    rect3 = rectv + 30;
    recto = random(640);
    rectm = 60;
    rect4 = recto + 70;
    rect5 = rectm + 30;
    rectl = random(640);
    rectr = 90;
    rect6 = rectl + 70;
    rect7 = rectr + 30;
    rectq = random(640);
    rectw = 120;
    rect8 = rectq + 70;
    rect9 = rectw + 30;
    rectj = random(640);
    rectk = 150;
    rect10 = rectj + 70;
    rect11 = rectk + 30;
    rectt = rectt - 20;
    mmclick = mmclick - 20;
  }


//Additional text to make sure the user knows how to play the game.
  textSize(14);
  text("Destroy the blocks to progress to the next level", 15, 310);

  textSize(14);
  text("CLICK TO RESTART", 15, 330); //Press left click on your mouse to restart.


//Some of the code was repeated here to make sure no glitches or bugs would arise. 
//There would be times where the ball would not come in contact the bricks. This took a long while as well.
//I was planning to use some more text here, but I wanted to keep it simple.

  if ((rectX == -500)&&(rectY == -500)&&(rect1 == -500)&&(rect0 == -500)) {
  }
  if ((rectp == -500)&&(rectv == -500)&&(rect2 == -500)&&(rect3 == -500)) {
  }
  if ((recto == -500)&&(rectm == -500)&&(rect4 == -500)&&(rect5 == -500)) {
  }
  if ((rectl == -500)&&(rectr == -500)&&(rect6 == -500)&&(rect7 == -500)) {
  }
  if ((rectq == -500)&&(rectw == -500)&&(rect8 == -500)&&(rect9 == -500)) {
  }
  if ((rectj == -500)&&(rectk == -500)&&(rect10 == -500)&&(rect11 == -500)) {
  }

  if ((rectp == -500)&&(rectv == -500)&&(rect2 == -500)&&(rect3 == -500)&&(rectX == -500)&&(rectY == -500)&&(rect1 == -500)&&(rect0 == -500)) {
  }
  if ((rectX == -500)&&(rectY == -500)&&(rect1 == -500)&&(rect0 == -500) && (recto == -500)&&(rectm == -500)&&(rect4 == -500)&&(rect5 == -500)) {
  }
  if ((rectX == -500)&&(rectY == -500)&&(rect1 == -500)&&(rect0 == -500) &&(rectl == -500)&&(rectr == -500)&&(rect6 == -500)&&(rect7 == -500)) {
  }
  if ((rectX == -500)&&(rectY == -500)&&(rect1 == -500)&&(rect0 == -500) &&(rectq == -500)&&(rectw == -500)&&(rect8 == -500)&&(rect9 == -500)) {
  }
  if ((rectX == -500)&&(rectY == -500)&&(rect1 == -500)&&(rect0 == -500) &&(rectj == -500)&&(rectk == -500)&&(rect10 == -500)&&(rect11 == -500)) {
  }
  if ((rectp == -500)&&(rectv == -500)&&(rect2 == -500)&&(rect3 == -500) &&(rectj == -500)&&(rectk == -500)&&(rect10 == -500)&&(rect11 == -500)) {
  }
  if ((rectp == -500)&&(rectv == -500)&&(rect2 == -500)&&(rect3 == -500) &&(rectq == -500)&&(rectw == -500)&&(rect8 == -500)&&(rect9 == -500)) {
  }
  if ((rectp == -500)&&(rectv == -500)&&(rect2 == -500)&&(rect3 == -500) &&(rectl == -500)&&(rectr == -500)&&(rect6 == -500)&&(rect7 == -500)) {
  }
  if ((rectp == -500)&&(rectv == -500)&&(rect2 == -500)&&(rect3 == -500) &&(recto == -500)&&(rectm == -500)&&(rect4 == -500)&&(rect5 == -500)) {
  }

  mmclick = brightness+100;} 

void serialEvent (Serial port){
  
  brightness= float(port.readStringUntil('\n'));
}
