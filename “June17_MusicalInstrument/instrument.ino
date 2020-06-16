//Musical Instrument
//Rashid Al Qubaisi

int trig = 10;
int echo = 11;
long duration;
long distance;
int sensorReading;
int thisPitch;
int sound;

void setup() {
  pinMode(echo, INPUT);

  pinMode(trig, OUTPUT);

  Serial.begin(9600);
}

void loop() {
  digitalWrite(trig, LOW); //triggers on/off and then reads data
  delayMicroseconds(2);
  digitalWrite(trig, HIGH);
  delayMicroseconds(10);
  digitalWrite(trig, LOW);
  duration = pulseIn(echo, HIGH);
  distance = (duration / 2) * .0344;    //this is the speed of sound



  int notes[7] = {261, 294, 329, 349, 392, 440, 494}; //These are the notes to control the certain pitches
  //          mid C  D   E   F   G   A   B

 
    int sound = map(distance, 0, 50, 0, 6);  //map distance to the array of notes
    tone(12, notes[sound]);  
  // read the sensor:
  int sensorReading = analogRead(A0);
  // print the sensor reading so you know its range
  Serial.println(sensorReading);
  // map the analog input range (in this case, 400 - 1000 from the photoresistor)
  // to the output pitch range (120 - 1500Hz)
  // change the minimum and maximum input numbers below depending on the range
  // your sensor's giving:
  int thisPitch = map(sensorReading, 400, 1000, 120, 1500);

  // play the pitch:
  tone(9, thisPitch, 10);
  delay(1); 
  }
