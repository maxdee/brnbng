//LEDZ


class Led{
  //-----------------------------PROPERTIES--------------------------
  //RGB compatible
  //on off cyccle for all!
  //frequency + duty cycle
  //player #

 int chan;
 int on;
 int off;


  //-----------------------------METHODS--------------------------
  public Led(int c){
    chan = c;
  }
  
  //acumulate object data and merge.
}
//creat objects in environement

class Objects {

  //subclasses for walls and points...

  //-----------------------------PROPERTIES--------------------------
  //points
  //walls=
  boolean tgl;
  float posX;
  float posY;

  //-----------------------------METHODS--------------------------
  //construct
  public Objects() {
    tgl = false;
    float posX = 0;
    float posY = 0;
  }



  public void place(float x, float y, boolean t) {
    tgl = t;
    posX = x;
    posY = y;
  }
}

