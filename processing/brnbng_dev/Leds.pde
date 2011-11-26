//LEDZ


class Led {
  //-----------------------------PROPERTIES--------------------------
  //RGB compatible
  //on off cyccle for all!
  //frequency + duty cycle
  //player #

  //assigned channel for the led.
  int chan;

  int on = 1000;
  int off = 1000;
  
  float ntnst;
  float freq;
  int noo;
  //number of objects
  float average;
  float weight;

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
    //weighted average!
    freq = average/weight;
    ntnst = weight/noo;
    if(ntnst > 0){
    on = int(ntnst*(freq*16514f));
    off = int(((ntnst*-1)+1)*(freq*16514));
    }
    else{
      on = 0;
      off = 10;
    }
   // println(freq+"    "+ntnst);
    average = 0;
    weight = 0;
    noo = 0;
  }
  
  //add points. to sight.
  public void saw(int o, float nt) {
    ntnst = nt;
    average += ntnst*bjct[o].freq;
    weight += ntnst;    
    noo++;
    //    divide by noo after.
  }
}

