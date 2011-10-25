import processing.serial.*;

Serial comport;


//globals eyes - no bigger than 16512
int on0 = 500;
int off0 = 500;
int on1 = 500;
int off1 = 500;

//wlaking globals
boolean walking = false;

//relative position
float posX = 0.5;
float posY = 0.5;
float heading = 0;


//objects
int[] objX = new int[100000];
int[] objY = new int[100000];
int[] objS = new int[100000];

//circleNum keeps track of the number of circles
int objNum = 0;








void setup() {
  size(400, 400);//screenWidth, screenHeight);
  background(0);
  println(Serial.list());
  comport = new Serial(this, Serial.list()[0], 9600);
  frameRate(60);
}

void draw() { 
  serialsend();
  mouseHeading();
  posmap(posX, posY, heading);
  objects();
  sight(false);
  sight(true);
}





