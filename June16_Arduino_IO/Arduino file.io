// the setup function runs once when you press reset or power the board. This shows the connections between the Arduino and the breadboard.
void setup() {
  pinMode(9, OUTPUT);
  pinMode(13, OUTPUT);
  pinMode(A2, INPUT);
}

// the loop function runs over and over again forever
void loop() {
//this indicates the position of the switch on the breadboard in correspondence witht he Arduino
  int switchPosition = digitalRead(A2);

  if (switchPosition == HIGH) {
    digitalWrite(9, HIGH);   // turn the LED on (HIGH is the voltage level)
    digitalWrite(13, LOW);
  } else  {
    digitalWrite(9, LOW);    // turn the LED off by making the voltage LOW
    digitalWrite(13, HIGH);

//this part brings the potentiometer in which  controls the amount of voltage being recieved
//in the second LED.
    int pot = analogRead (A0);
    pot= map(pot, 0, 1023, 0, 255); //random numbers allocated to play with the amount of voltage
    //being passed onto the second LED.
    analogWrite(9,pot);
    //in turn this will only control the voltage of the second LED without affecting the voltage
    //of the first LED (green).
  }
}
