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

  //frivolous floats....
  float obX;
  float obY;
  float eyeposX;
  float eyeposY;
  float xx;
  float yy;

  int col;
  //control properties and self awarness
  int joy;

  int leye;
  int reye;

  //sight settings
  float view;
  float eyesep = 0.05f;
  //naturality.
  float wobble = 0.005f;
  //focal
  float zoom = 0.1;
  /*METHODS*/

  //construct twith starting position
  public Persona(float x, float y, int c, int j, int l, int r) {
    col = c;
    joy = j;
    posX = x;
    posY = y;
    leye = l;
    reye = r;
  }
  
  //Update function!
  public void update() {
    mover();
    see();
  }

  //----------------------------MOVE!!---------------------------------------

  public void mover() {
    heading += stickR[joy].getY();
    heading = heading%1;
    if (true) {//boundary()) {
      //forward/backwards
      posX -= cos(radians(heading*360))*stickL[joy].getX();
      posY -= sin(radians(heading*360))*stickL[joy].getX();
      //sides dissabled for now
      // posX += cos(radians((heading*360)+90))*stickL[joy].getY()/2;
      // posY += sin(radians((heading*360)+90))*stickL[joy].getY()/2;
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
    //the big vision loop  still very messy
    for (int i = 0; i < bjct.length; i++) {
      //if object is enabled
      if (bjct[i].tgl) {
        //translation
        obX = bjct[i].posX-posX;
        obY = bjct[i].posY-posY;
        //relational position of objects!!
        xx = (obX*cos(-radians((heading*360)-90)))-(obY*sin(-radians((heading*360)-90))); 
        yy = (obX*sin(-radians((heading*360)-90)))+(obY*cos(-radians((heading*360)-90)));
        //send to sound
        patch.send(joy, i, xx, yy);

        for (int e = 0; e < 2; e++) {
          if (e==0) {
            eyeposX = posX + cos(radians((heading*360)-90))*eyesep;
            eyeposY = posY + sin(radians((heading*360)-90))*eyesep;
          }
          else {
            eyeposX = posX + cos(radians((heading*360)+90))*eyesep;
            eyeposY = posY + sin(radians((heading*360)+90))*eyesep;
          }
          //translation
          obX = bjct[i].posX-eyeposX;
          obY = bjct[i].posY-eyeposY;
          //relational position of objects!!
          yy = (obX*sin(-radians((heading*360)-90)))+(obY*cos(-radians((heading*360)-90)));
          xx = (obX*cos(-radians((heading*360)-90)))-(obY*sin(-radians((heading*360)-90))); 

          //with focal ONLY FOR EYESIGHT
          xx = (xx*zoom)/yy;

          //in field of vision  
          if (yy > 0) {
            //seeen
            //update led data - seen object# @ coordinates
            //send to the right led...
            if (e==0) {
              bduino.led[leye].saw(i, xx, yy);
            }
            else {
              bduino.led[reye].saw(i, xx, yy);
            }
            strokeWeight(1);
            fill(col);
            stroke(col);
            ellipse(((xx+1)/2)*width, yy*height, 5, 5);
            line(posX*width, posY*height, bjct[i].posX*width, bjct[i].posY*height);
          }
        }
      }
      //see the other player
    }
  }
}

