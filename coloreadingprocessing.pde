
// TCS230 or TCS3200 pins wiring to Arduino
import processing.serial.*; 
PrintWriter output;
Serial mySerial;
Table table;

String myString = null;
int nl = 10;
float myVar;

void setup() {
  size(200, 400);

  String myPort = Serial.list() [3]; //this could differ between device and what's plugged. Check arduino -> tools then count from 0 the port number of the port that is used.
  mySerial = new Serial(this, myPort, 9600);
  output = createWriter("data.csv");
  
  table = new Table();
  table.addColumn("B Value");
  table.addColumn("t (ms)");
 
}

void draw() {
  while (mySerial.available() > 0) {
    myString = mySerial.readStringUntil(nl);

    if (myString != null) {
      background(0);
      myVar = float(myString);
      
      TableRow newRow = table.addRow(); //creates table that outputs it like:
      newRow.setFloat("B Value", myVar); //B Value, T (ms)
      newRow.setInt("t (ms)", millis());
    }
    saveTable(table,"data/test.csv"); //data/test -- creates a directory with the .csv file named 'test'. change it if you'd like. 
  }
}
