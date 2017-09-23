import processing.serial.*;

Serial myPort;  // Create object from Serial class
int[] val = new int[2];     // Data received from the serial port

Tree[] trees = new Tree[1];
PImage img;


void setup()  {
  size(639, 358); 
  frameRate(10); 

  
  String portName = Serial.list()[1];             // The first port is /dev/cu.usbmodem1411
  myPort = new Serial(this, portName, 9600);    // is Serial.list()[1].
  
  img = loadImage("qns.jpg");
  background(img);  
  
  textSize(28);
  fill(0);
  text("How you ever visited Queens, NY?", 80, 100);
  
  for (int i = 0; i < trees.length; i++) {
    trees[i] = new Tree();
  }
}

void draw() {
  if (myPort.available() >3) {         // If data is available,
    val[0] = myPort.read();
    val[1] = myPort.read();// read it and store it in val
  } 
  
  if (val[0] == 1)  {                       // If the serial value is greater than 0

    translate(random(width/2), random(height/2));
    for (int i = 0; i < trees.length; i++) {
    trees[i].update();
    trees[i].show();
    
    }
    
    if (val[1] == 2) {

    img = loadImage("qns2.jpg");
    background(img); 
    textSize(28);
    fill(0);
    text("How you ever visited Queens, NY?", 80, 100);
    }
    
  }
  
  
  
} 