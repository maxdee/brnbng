//Persona class is the virtual itiration of the participant

class Persona {

  /*-----------------PROPERTIES-----------------*/
  //positionning
  float posX;
  float posY;
  float heading;

  //frivolous floats....
  float ntnst;
  float hyp;
  float xx;
  float yy;

  //color
  int col;
  //control properties and self awarness
  int joy;
  //leds
  int leye;
  int reye;

  //sight settings
  //periferal vision
  float view = 0;
  //face size
  float eyesep = 0.005f;
  //focal
  float zoom = 0.2;
  //visibility
  float visi = 0.5;
  //naturality.
  float wobble = 0.0005f;
  float wob;


  /*-----------------METHODS-----------------*/
  //construct twith starting position
  public Persona(float x, float y, int c, int j, int l, int r) {
    col = c;
    joy = j;
    posX = x;
    posY = y;
    leye = l;
    reye = r;
  }

  //-----------Update function!-----------
  public void update() {
    mover();
    sense();
  }



  //-----------SIGHT!!-----------
  private void sense() {
    //the big vision loop  still very messy -- getting better
    for (int i = 0; i < bjct.length; i++) {
      if (bjct[i].tgl) {     
        //send to pd   
        relational(bjct[i].posX, bjct[i].posY, 0);
        patch.send(joy, i, xx, yy);

        //do the eyes     
        for (int eye = 1; eye < 3; eye++) {          
          relational(bjct[i].posX, bjct[i].posY, eye);
          hyp = sqrt(sq(xx)+sq(yy));
          
          if (yy > view && hyp < visi) {
            ntnst = ocular();
            //update led data - seen object# @ coordinates
            if (eye==1) { //e is the eye!
              bduino.led[leye].saw(i, ntnst);
            }
            else if (eye==2) {
              bduino.led[reye].saw(i, ntnst);
            }
            //draw some stuff
            drw(i);
          }
        }
      }
      //see the other player
    }
  }


  //Functionsfor the sight loop
  private float ocular() {
    //with focal //y is my z and theres no y.           
   // xx = (xx*zoom)/(yy+0.1);   
    hyp = (inver(hyp, 1)-visi)/((abs(xx)/yy)+0.2);   
    println((abs(xx)/yy));    
    return hyp;
  }



  private float inver(float v, float s) {
    return (abs(v)*-s)+s;
  }

  private void drw(int i) {
    strokeWeight(1);
    fill(col);
    stroke(col);
    ellipse(((xx+1)/2)*width, yy*height, 5, 5);
    line(posX*width, posY*height, bjct[i].posX*width, bjct[i].posY*height);
  }

  private void relational(float x, float y, int e) {
    float headrad = radians(heading*360);
    float pX = 0;
    float pY = 0;

    //different cases for each 3 eyes
    switch(e) {
    case 0:
      pX = posX;
      pY = posY;
      break;
    case 1:
      pX = posX + cos(headrad-HALF_PI)*eyesep;
      pY = posY + sin(headrad-HALF_PI)*eyesep;
      break;
    case 2:
      pX = posX + cos(headrad+HALF_PI)*eyesep;
      pY = posY + sin(headrad+HALF_PI)*eyesep;
    }

    //difference
    float obX = x-pX;
    float obY = y-pY;

    //relational position of objects!!
    xx = (obX*cos(-(headrad-HALF_PI)))-(obY*sin(-(headrad-HALF_PI))); 
    yy = (obX*sin(-(headrad-HALF_PI)))+(obY*cos(-(headrad-HALF_PI)));
  }


  //-----------MOVE!!-----------
  //works well.
  private void mover() {
    heading += stickR[joy].getY();
    heading = heading%1;
    if (true) {//boundary()) {
      //forward/backwards
      posX -= cos(radians(heading*360))*stickL[joy].getX();
      posY -= sin(radians(heading*360))*stickL[joy].getX();
      //sides dissabled for now
      // posX += cos(radians((heading*360)+90))*stickL[joy].getY()/2;
      // posY += sin(radians((heading*360)+90))*stickL[joy].getY()/2;
      //induce wobble - implement increase with movement.
//      heading += sin(wob)*wobble;
//      wob+=0.1;
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
}

