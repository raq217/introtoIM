//Mid-term assignment
//Rashid Al Qubaisi

void setup()
{
  restart();
  size(400,400);
  textAlign(CENTER);
}
void draw()
{
  if (stopgame)
  {
//there is nothing here because the game is over and does not need to continue.
  }
  else
  {
//this focuses on the creation of the basic non moving objetcs like the apples (food)
  time+=1;
  fill(20,40,100);
  stroke(0);
  rect(applex,appley,5,5);
  fill(0,100,20);
  stroke(0);
  rect(0,0,width,5);
  rect(0,height-5,width,5);
  rect(0,0,5,height);
  rect(width-5,0,5,height);
  
//below controls the frame rate so that the game does not go too fast or too slow
//the frames are at %5 to avoid that from happening
  if ((time % 5)==0)
  {
    travel();
    display();
    checkdead();
  }
  }
}
//controls:
void keyPressed()
{
  if (key == CODED)
  {
//I had some trouble with this as I start by nomination each key to control the x and y values
//through the fuction sn.show(x,y). However I found an easier more simplified way of doing it by
//using the angles for each key.
//I made sure that the snake could not move backwards as it would mean it would eating itself.
//This would avoid any potential "suicide" scenarios.

    if (keyCode == UP && angle!=270 && (heady[1]-8)!=heady[2])
    {
      angle=90;
    }
    if (keyCode == DOWN && angle!=90 && (heady[1]+8)!=heady[2])
    {
      angle=270;
    }if (keyCode == LEFT && angle!=0 && (headx[1]-8)!=headx[2])
    {
      angle=180;
    }if (keyCode == RIGHT && angle!=180 && (headx[1]+8)!=headx[2])
    {
      angle=0;
    }
    if (keyCode == SHIFT)
    {
  //This is the command to restart the game if the player wishes to by simple pressing Shift.
      restart();
    }
  }
}
void travel()
{
  for(int i=snakesize;i>0;i--)
  {
    if (i!=1)
    {
//this brings back the snake to the starting point which is the center of the map.
      headx[i]=headx[i-1];
      heady[i]=heady[i-1];
    }
    else
    {
//This makes sure that the movement of the snake is controlled by the direction of the snake.
//always at headx[1] and heady[1].
      switch(angle)
      {
        case 0:
        headx[1]+=8;
        break;
        case 90:
        heady[1]-=8;
        break;
        case 180:
        headx[1]-=8;
        break;
        case 270:
        heady[1]+=8;
        break;
      }
    }
  }
  
}
