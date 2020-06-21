//Rashid Al Qubaisi
//Flappy Bird


//Pins that I will be using with the ultrasonic sensor
const int trigPin=11;  
int echoPin=10;         
int safezone=10; 



void setup() 
{
pinMode(trigPin,OUTPUT);
pinMode(echoPin,INPUT);
Serial.begin(9600);
}

 //below are the measurements for the responsiveness of the movement of the bid compared
  //to the object detection of the ultrasonic sensor.
void loop()
{
}
long duration,cm;           
digitalWrite(trigPin,LOW);  
delayMicroseconds(2);       
digitalWrite(trigPin,HIGH); 
delayMicroseconds(5);       
digitalWrite(trigPin,LOW);  
duration=pulseIn(echoPin,HIGH); 
cm=microsecondsToCentimeters(duration); 
long inch= cm/2.54; //this is the bounce pulse of the bird
Serial.println(cm);
}
long microsecondsToCentimeters(long microseconds) 
{
return microseconds/29/2; 
