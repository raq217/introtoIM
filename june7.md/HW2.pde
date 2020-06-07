float t;

void setup(){
  background(50,100,20);
  size(900,900);
}

void draw(){
  stroke (230);
  strokeWeight(5);
 
//the translation of how the dots would move 
  translate(width/2, height/2);
  
  point(x1 (t), y2(t));
  point(x2(t),y2(t));
  t++;
}

//using cos and sin to determine the direction and angle of the movements
float x1(float t) {
  return sin(t/10)*100+sin(t/5)*20;
}

float y(float t){
  return sin(t/10) *100;
}

float x2(float t){
  return sin(t/10)*200 +sin(t)*2;
}

float y2(float t){
  return cos(t/15)*200 + cos(t/9)*20;
}
