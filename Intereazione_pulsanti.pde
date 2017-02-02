import cc.arduino.*;
import processing.serial.*;

Arduino arduino; 

Pulsante[] pulsanti = new Pulsante[5];

//arduino.pinMode(Indietro, Arduino.OUTPUT); 
//arduino.digitalWrite(Avanti, Arduino.HIGH);

final int NPul = 5;

void setup() {
  
  size(800,600);
  //background(0);
  println(Serial.list());
  arduino = new Arduino(this, "COM19", 57600);
  
  for(int i=0; i<NPul; i++) {                //riempi array
     pulsanti[i] = new Pulsante(8+i); 
  }
  
  for(int i=0; i<NPul; i++) {             //setta pin
     arduino.pinMode(pulsanti[i].pin, Arduino.INPUT);
  }
  
}

void draw() {
  
  frameRate(60);
  background(0);
   
  for(int i=0; i<NPul; i++) { 
    
    pulsanti[i].valore = arduino.digitalRead(pulsanti[i].pin);
    
  }
  
  
}