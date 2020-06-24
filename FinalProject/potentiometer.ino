//Pin that I am using on the Arduino Uno board.

int potPin = 3;


void setup() {
  Serial.begin(9600);

}


//Sensitivity of the potentiometer.
void loop() {
 int val = map (analogRead(potPin),0,1023,0,590); 
Serial.println(val);
delay(50);
}
