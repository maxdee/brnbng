//creat objects in environement

class Objects {

  //subclasses for walls and points...

  //-----------------------------PROPERTIES--------------------------
  //toggle
  boolean tgl;
  //place
  float posX;
  float posY;
  
  float freq = 0.01;
  
  //color data soon
  //-----------------------------METHODS--------------------------
  //construct
  public Objects(){
    tgl = false;
    float posX = 0;
    float posY = 0;
    
  }
  //place object in space
  public void place(float x, float y, boolean t) {
    tgl = t;
    posX = x;
    posY = y;   
  }
}
