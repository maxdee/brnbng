//Persona class is the virtual itiration of the participant

class Persona {

  /*PROPERTIES*/
  //width and height are already available
  //Two vectors?
  PVector location;
  PVector direction;

  float posX;
  float posY;
  float heading;
 
  int col;
  //control properties
  int joy;

  //sight settings
  float view;
  float eyesep = 0.05f;
  //naturality.
  float wobble = 0.005f;
  //player
  int plr;




  /*METHODS*/

  //construct twith starting position
  public Persona(float x, float y, int c, int j) {
    col = c;
    joy = j;
    posX = x;
    posY = y;
}

  //  public pos(float x, float y, float h){
  //    //return position and heading
  //  }

  public void mover() {
    heading += stickR[joy].getY();
    heading = heading%1;
    if (true) {//boundary()) {
      //forward/backwards
      posX -= cos(radians(heading*360))*stickL[joy].getX();
      posY -= sin(radians(heading*360))*stickL[joy].getX();
      //sides
      posX += cos(radians((heading*360)+90))*stickL[joy].getY()/2;
      posY += sin(radians((heading*360)+90))*stickL[joy].getY()/2;
      //induce wobble
    }
    //wrap around, single player exploration mode?
    posX = posX%1;
    posY = posY%1; 
    if (posX < 0) {
      posX = 1;
    }
    if (posY < 0) {
      posY = 1;
    }
  }

  //----------------------------SIGHT!!---------------------------------------
  public void see() {
    float eyeposLX = posX + cos(radians((heading*360)-90))*eyesep;
    float eyeposLY = posY + sin(radians((heading*360)-90))*eyesep;
    //point(eyeposLX*width, eyeposLY*height);

    float eyeposRX = posX + cos(radians((heading*360)+90))*eyesep;
    float eyeposRY = posY + sin(radians((heading*360)+90))*eyesep;
    //point(eyeposRX*width, eyeposRY*height);

    //the big vision loop 
    for (int i = 0; i < bjct.length; i++) {
      //translation
      if (bjct[i].tgl) {
        float obX = bjct[i].posX-posX;//eyeposLX;
        float obY = bjct[i].posY-posY;//eyeposLY;
        //relational position of objects!!
        float x = (obX*cos(-radians((heading*360)-90)))-(obY*sin(-radians((heading*360)-90))); 
        float y = (obX*sin(-radians((heading*360)-90)))+(obY*cos(-radians((heading*360)-90)));
        //in field of vision  
        if (y > 0) {
          //seeen
          strokeWeight(1);
          fill(col);
          ellipse(((x+1)/2)*width, y*height, 10, 10);
          line(posX*width, posY*height, bjct[i].posX*width, bjct[i].posX*height);
        }
      }
    }
    //see the other player
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "brnbng_dev" });
  }
}
