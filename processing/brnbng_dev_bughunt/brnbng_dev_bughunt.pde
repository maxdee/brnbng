//----------------------JOYPADS----------------------//


import oscP5.*;

import netP5.*;

import procontroll.*;

import net.java.games.input.*;

import processing.serial.*;


//JOYPADS---------logitech dual action X 2
ControllIO[] ctlio = new ControllIO[2];
ControllDevice[] joypad = new ControllDevice[2];
ControllStick[] stickL = new ControllStick[2];
ControllStick[] stickR = new ControllStick[2];


//-------------other instances
Gui ui;
Persona[] prsn = new Persona[2];
Objects[] bjct = new Objects[100];
int oCnt = 0;

Serial comport = new Serial();

OscP5 osc;
PD patch;

//-----------------------------------------------------//
void setup() {
  size(400, 400);

  //-------------------------init
  String port = "/dev/ttyUDSB0";
  comport = new Serial(this, Serial.list()[0], 9600);

  //GUI
  ui = new Gui();

  //osc
  osc = new OscP5(this, 9997);
  NetAddress ip = new NetAddress("127.0.0.1", 9998);
  patch =  new PD(ip);

  //---------------persons
  color p1 = color(0, 100, 0);
  color p2 = color(100, 0, 0);
  prsn[0] = new Persona(0.5, 0.4, p1, 0);
  prsn[1] =  new Persona(0.5, 0.6, p2, 1);

  //---------------objects
  for (int i = 0; i < bjct.length; i++) {
    bjct[i] = new Objects();
  }

  //---------------joypads
  for (int i = 0; i < prsn.length; i++) {
    ctlio[i] = ControllIO.getInstance(this);
    joypad[i] = ctlio[i].getDevice(i);
    stickL[i] = joypad[i].getStick(0);
    stickR[i] = joypad[i].getStick(1);
    stickL[i].setTolerance(0.09f);
    stickR[i].setTolerance(0.09f);
    //set the moving speed
    stickL[i].setMultiplier(0.004f);
    //sets the heading incrementer
    stickR[i].setMultiplier(0.02f);
  }
}

void draw() {
  ui.refresh();
  for (int i = 0; i < prsn.length; i++) {
    prsn[i].mover();
    prsn[i].see();
  }
}


void mousePressed() {  
  bjct[oCnt].place(float(mouseX)/width, float(mouseY)/height, true);
  oCnt++;
  oCnt = oCnt%bjct.length;
}

void keyPressed() {
  patch.send(1, 1, 0.5, 0.5);
}
//in joypad pointers point to input functions....

