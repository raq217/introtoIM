//Setup of the actual sssssnake.

int angle=0;
int snakesize=20;
int time=0;
int[] headx= new int[3500];
int[] heady= new int[3500];
int applex=(round(random(47))+1)*8;
//This is mainly related to the development of the snake and its canvas that it moves on.

int appley=(round(random(47))+1)*8;
boolean redo=true;
boolean stopgame=false;

void checkdead()
{
  for(int i=2;i<=snakesize;i++)
  {
//Below is the code that makes sure the head actually takes up the same space as the food.
    if (headx[1]==headx[i] && heady[1]==heady[i])
    {
//This is the message that pops up when the game is either reset or the player has lost. It will
//show the total points that the player has earned.
      fill(0,50,0);
      rect(125,125,160,100);
      fill(255);
//this is for when you eat yourself aka when the snake collides with itself
      text("You ate yourself!",200,150);
      text("Score:  "+str(snakesize-1)+" units long",200,175);
      text("To restart, press Shift.",200,200);
      stopgame=true;
    }
//This controls the reactions of the snake when it hits the wall, making sure it dies.
    if (headx[1]>=(width-8) || heady[1]>=(height-8) || headx[1]<=0 || heady[1]<=0)
    {
      fill(0,50,0);
      rect(125,125,160,100);
      fill(255);
      text("You lost :(",200,150);
      text("Score:  "+str(snakesize-1)+" Points ",200,175);
      text("To restart, press Shift.",200,200);
      stopgame=true;
    }
  }
}

void display()
{

  if (headx[1]==applex && heady[1]==appley)
  {
//This asures that the next food spawns in a different unpredicatble location away from the snake.

    snakesize+=round(random(3)+1);
    redo=true;
    while(redo)
    {
      applex=(round(random(47))+1)*8;
      appley=(round(random(47))+1)*8;
      for(int i=1;i<snakesize;i++)
      {
        
        if (applex==headx[i] && appley==heady[i])
        {
          redo=true;
        }
        else
        {
          redo=false;
          i=1000;
        }
      }
    }
  }

  rect(headx[1],heady[1],5,5);
//This controls the trail of the snake. The main reason I wanted to include a trial was to give
//it artistic purposes which would allow the player to draw shapes and show them where they have
//been on the map.
  fill(255);
  rect(headx[snakesize],heady[snakesize],5,5);
  
}
