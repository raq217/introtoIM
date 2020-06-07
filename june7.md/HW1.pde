String[]names={"Dubai", "Abu Dhabi", "Sharjah", "Ajman", "Ras Al Khaimah", "Umm Al Quwain", "Fujairah"};
String textholder="UAE";

//setting up the dimensions and form of the text

void setup(){
size(900,900);
println(names.length);
textSize(50);
background(50,50,90);
textAlign(CENTER);
}

void draw(){
//this is to make sure that the text follows along with the mouse
  text(textholder, mouseX, mouseY);
  
  
  //here I am making sure that the text size is randomized according to when the user clicks the mouse.
}
void mousePressed(){
  textSize(random(10,50));
  //this makes sure that the Emirates are generated randomly
  textholder=names[int(random(names.length))];
  text(textholder, mouseX, mouseY);
}
