import oscP5.*;
import netP5.*;

import procontroll.*; 
import net.java.games.input.*; 
import processing.serial.*; //----------------------JOYPADS----------------------//


//JOYPADS---------logitech dual action X 2
ControllIO[] ctlio = new ControllIO[2];
ControllDevice[] joypad = new ControllDevice[2];
ControllStick[] stickL = new ControllStick[2];
ControllStick[] stickR = new ControllStick[2];


//-------------other instances

Persona[] prsn = new Persona[2];
Objects[] bjct = new Objects[100];
int oCnt = 0;

Duino bduino;

//-----------------------------------------------------//
public void setup() {
  size(400, 400);

  //-------------------------init
  ui = new Gui();
  bduino = new Serial(this, Serial.list()[0], 9600);
  //---------------persons
  int p1 = color(0,100,0);
  int p2 = color(100,0,0);
  prsn[0] = new Persona(0.5f, 0.4f,p1, 0);
  prsn[1] =  new Persona(0.5f, 0.6f,p2, 1);

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

  //  for (int b = 0; b < 13; b++) {
  //    joypad[0].plug(this, "input[0].hb", ctlio[0].ON_PRESS, b);
  //    joypad[1].plug(this, "input[1].hb", ctlio[1].ON_PRESS, b);
  //    //rethink the button deal
  //    button[b] = joypad[0].getButton(b);
  //    button[b] = joypad[1].getButton(b);
  //  }
}

public void draw() {
   ui.refresh();
  for (int i = 0; i < prsn.length; i++) {
    prsn[i].mover();
    prsn[i].see();
  }
 
}


public void mousePressed() {  
  bjct[oCnt].place(PApplet.parseFloat(mouseX)/width, PApplet.parseFloat(mouseY)/height, true);
  oCnt++;
  oCnt = oCnt%bjct.length;
}
//in joypad pointers point to input functions....
