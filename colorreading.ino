// TCS230 or TCS3200 pins wiring to Arduino
#define S0 4
#define S1 5
#define S2 6
#define S3 7
#define sensorOut 8

// Stores frequency read by the photodiodes
int redFrequency = 0;
int greenFrequency = 0;
int blueFrequency = 0; //only blue frequency is used since I'm only measuring blue food coloring. The code can be easily edited to read all or red or green.

void setup() {
  // Setting the outputs
  pinMode(S0, OUTPUT); 
  pinMode(S1, OUTPUT);
  pinMode(S2, OUTPUT);
  pinMode(S3, OUTPUT);
  
  // Setting the sensorOut as an input
  pinMode(sensorOut, INPUT);
  
  // Setting frequency scaling to 20%
  digitalWrite(S0,HIGH);
  digitalWrite(S1,LOW);
  
   // Begins serial communication 
  Serial.begin(9600);
}
void loop() { //only blue is being read
  // Setting BLUE (B) filtered photodiodes to be read
  digitalWrite(S2,LOW);
  digitalWrite(S3,HIGH);
  
  // Reading the output frequency
  blueFrequency = pulseIn(sensorOut, LOW);
  
  // Printing the BLUE (B) value 
  Serial.println(blueFrequency); //change to redFrequency or greenFrequency to read the values for each or just add another line to read them simultaneously. 
  delay(500); //the sensor will collect data every 0.5 seconds but it can be much quicker. Made it lower for easier data readings
}
