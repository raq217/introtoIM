//this is part of the code that all has to do with the spawning of the food called apple.

void restart()
{
//When the player wants to reset, the placement of the snake's food should also change so that
//the game won't be so predicatble for the player. As in the location will always change when
//the snake dies or the game is reset.
  background(255,0,200);
  headx[1]=200;
  heady[1]=200;
  for(int i=2;i<1000;i++)
  {
    headx[i]=0;
    heady[i]=0;
  }
  stopgame=false;
  applex=(round(random(47))+1)*8;
  appley=(round(random(47))+1)*8;
  snakesize=5;
  time=0;
  angle=0;
  redo=true;
}
float sinecolor(float percent)
{
  float food=(sin(radians((((time +(255*percent)) % 255)/255)*360)))*255;
  return food;
}
