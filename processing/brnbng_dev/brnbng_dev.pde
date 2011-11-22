//------------LIBRARY------------\\
//OSC, HID, SERIAL
import oscP5.*; 
import netP5.*; 
import procontroll.*; 
import net.java.games.input.*; 
import processing.serial.*; 

//--------JOYPADS--------\\
//logitech dual action X 2
ControllIO[] ctlio = new ControllIO[2];
ControllDevice[] joypad = new ControllDevice[2];
ControllStick[] stickL = new ControllStick[2];
ControllStick[] stickR = new ControllStick[2];

//--------SERIAL--------\\
Serial comport;
Duino bduino;

//--------OSC--------\\
OscP5 osc;
PD patch;

//--------CLASSES--------\\
Gui ui;
Persona[] prsn = new Persona[2];
Objects[] bjct = new Objects[100];

//--------VARIABLES--------\\
//Object count
int oCnt = 0;


public void setup() {
  size(300, 300);
  ui = new Gui();
  setupSerial();
  setupOSC();
  setupJoypads();
  setupPersonas();
  setupObjects();
}

public void draw() {
  ui.refresh();
  for (int i = 0; i < prsn.length; i++) {
    prsn[i].update();
  }
  bduino.send();
}

//Place objects!
public void mousePressed() {  
  bjct[oCnt].place(PApplet.parseFloat(mouseX)/width, PApplet.parseFloat(mouseY)/height, true);
  oCnt++;
  oCnt = oCnt%bjct.length;
}



//-----------------------------------------------------\\
//###################SETUP######FUNCTIONS################>
//-----------------------------------------------------//

public void setupJoypads() {  
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

public void setupObjects() {
  for (int i = 0; i < bjct.length; i++) {
    bjct[i] = new Objects();
  }
}

public void setupPersonas() {
  int p1 = color(0, 100, 0);
  int p2 = color(100, 0, 0);
  prsn[0] = new Persona(0.5f, 0.4f, p1, 0, 0, 1);
  prsn[1] =  new Persona(0.5f, 0.6f, p2, 1, 2, 3);
}

public void setupOSC() {
  osc = new OscP5(this, 9997);
  NetAddress ip = new NetAddress("127.0.0.1", 9998);
  patch =  new PD(ip);
}

public void setupSerial() {
  String port = "/dev/ttyUDSB0";
  comport = new Serial(this, Serial.list()[0], 9600);
  bduino = new Duino();
}

