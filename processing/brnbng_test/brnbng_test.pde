import processing.serial.*;

Serial comport;


//globals
int on0 = 500;
int off0 = 500;
int on1 = 500;
int off1 = 500;

int[] serda = new int [9];

void setup() {
  size(500,500);
  println(Serial.list());
  comport = new Serial(this, Serial.list()[0], 9600);
}



void draw() { 

  serialsend();
  delay(10);
  on0 = mouseX*10;
  off0 = mouseY*10;
  on1 = mouseX*10;
  off1 = mouseY*10;
}

void serialsend() {
  
  serda[0] = 255;
  serda[1] = on0/128;
  serda[2] = on0%128;
  serda[3] = off0/128;
  serda[4] = off0%128;
  serda[5] = on1/128;
  serda[6] = on1%128;
  serda[7] = off1/128;
  serda[8] = off1%128;
  int by = 0;
  for(by = 0; by < 9; by++) {
    comport.write(serda[by]);
  }
}

