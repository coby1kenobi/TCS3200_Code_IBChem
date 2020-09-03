
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

  String myPort = Serial.list() [3];
  mySerial = new Serial(this, myPort, 9600);
  output = createWriter("data.csv");
  
  table = new Table();
  table.addColumn("B Value");
  table.addColumn("t (s)");
 
}

void draw() {
  while (mySerial.available() > 0) {
    myString = mySerial.readStringUntil(nl);

    if (myString != null) {
      background(0);
      myVar = float(myString);
      
      TableRow newRow = table.addRow();
      newRow.setFloat("B Value", myVar);
      newRow.setInt("t (s)", second());
    }
    saveTable(table,"data/new.csv");
  }
}
