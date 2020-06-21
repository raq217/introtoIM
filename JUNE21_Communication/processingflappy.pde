//Rashid Al Qubaisi
//Flappy game

//the variables that will be used in the game
import processing.serial.*;
int DistanceUltra;
int IncomingDistance;
Serial myPort;
String DataIn;
Pipe p1 = new Pipe();
Pipe p2 = new Pipe();
Pipe p3 = new Pipe();
 
//bird height and width location
float birdy = 20;
float birdx = 26;
float gravity = 5;
 
//the speed of the pipes
int speed;
 
//score and game state
boolean gameOver = false;
int score = 0;
int highscore = 0;
 
int point = 1;
 
color birdColor = color(255, 4, 150);
 
 
void setup(){
  size(400,600);
  p1.x = width + 50;
  p2.x = width + 220;
  p3.x = width + 370;
  myPort = new Serial(this, "COM3", 9600);
  myPort.bufferUntil(10);
}
void serialEvent (Serial myPort){
DataIn = myPort.readString();
println(DataIn);
IncomingDistance = int(trim(DataIn));
println("incoming distance="+IncomingDistance);
if (IncomingDistance>1 && IncomingDistance<100 ) { DistanceUltra = IncomingDistance; //save the value only if its in the range 1 to 100 } }
}
}
 
void draw(){
 
  background(0,0,400);
  p1.pipe();
  p2.pipe();
  p3.pipe();
 
 //variables of the bird, what size it is which is very important because we have to make sure that the pipes are not too wide enough or
 //narrow enough for us.
  fill(birdColor);
  ellipse(birdx, birdy, 44,44);
 // birdy += gravity;
  play();
  success(p1);
  success(p2);
  success(p3);
 
  if (IncomingDistance>10)
  //this makes sure there is a link between the bird and the gravity for it to move up and down
  {
    //birdy -= jumpForce;
    birdy -= gravity;
  }    
  else
  {
    birdy += gravity;
  }
  
}
 
 
void play(){
 
  if(gameOver == false)
  {
    speed = 2;
    p1.x -= speed;
    p2.x -= speed;
    p3.x -= speed;
   
    textSize(24);
    fill(255,255,255);
    text(score, width/2, 30);  
  }
 
  if(gameOver == true)
  {
    speed = 0;
    p1.x -= speed;
    p2.x -= speed;
    p3.x -= speed;
   
    if( highscore < score)
    {
       highscore = score;
    }
   
   //code related to the text menu seen if the game is over
    textSize(16);
    fill(0, 200, 0);
    textAlign(CENTER);
    text("Click : Play Again", width/2, height/2);
    text("Score: " + score, width/2, height/2 - 20);
    text("High-Score: " + highscore, width/2, height/2 - 40);
   
    if (mousePressed)
    {
       delay(900);
       score = 0;
       gameOver = false;
       birdy = 100;
       birdx = 56;
       p1.x = width + 50;
       p2.x = width + 220;
       p3.x = width + 370;
       p1.top = random(height/2);
       p1.bottom = random(height/2);
       p2.top = random(height/2);
       p2.bottom = random(height/2);
       p3.top = random(height/2);
       p3.bottom = random(height/2);
 
    }  
  }
 
}
 
void success(Pipe test){
 
  if(birdy < test.top || birdy > height - test.bottom)
  {
    if(birdx > test.x && birdx < test.x + test.w)
    {
      //this is to make sure the game ends when the bird comes in contact with one of the pipes
      gameOver = true;
    }
  }
}
class Pipe
{
  float top = random(height/3 + 200);
  float bottom = random(height/3 +200);
 
 //pipe variables and their setup on the map
  float x = width + 150;
  float w = 70;
  color pipeColor = color(0, 255, 0);
 
  void pipe()
  {
    fill(pipeColor);
    rect(x, 0, w, top);
    rect(x, height-bottom, w, bottom);
   
    if(x < -100)
    {
     score += point;
     x = width;
     top = random(height/2);
     bottom = random(height/2);
    }
 
   
  }
 
 
}
