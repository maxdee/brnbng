//LEDZ


class Led {
  //-----------------------------PROPERTIES--------------------------
  //RGB compatible
  //on off cyccle for all!
  //frequency + duty cycle
  //player #

  //assigned channel for the led.
  int chan;

  int on;
  int off;
  //averaging of points...
  float onAv;
  float offAv;
  //number of objects
  int noo;

  //for rgb mode
  int onR;
  int offR;
  int onG;
  int offG;
  int onB;
  int offB;


  //-----------------------------METHODS--------------------------
  public Led(int c) {
    chan = c;
  }

  public void display() {
    on = PApplet.parseInt((onAv/noo)*1000);
    off = PApplet.parseInt((offAv/noo)*1000);
  }
  
  
  public void saw(int o, float x, float y) {
    float dada = x+y;
    //    acumulate
    //    ona
    onAv += dada;
    offAv += dada;
    noo++;
    //    divide by noo after.
  }
}

