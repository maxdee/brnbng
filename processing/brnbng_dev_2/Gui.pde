//Gui class, anything that is drawn
class Gui {
  /*PROPERTIES*/
  //width and height are already available

  /*METHODS*/

  //CONSTRUCT
  public Gui() {
  }

  public void refresh() {
    //draw all the things!
    background(100);
    person(0);
    person(1);
    obj();
  } 
  //can I use strings in object names?
  private void person(int p) {
    fill(prsn[p].col);
    ellipse(prsn[p].posX*width, prsn[p].posY*height, 10, 10);
    int lnlength = 10;
    line(prsn[p].posX*width, prsn[p].posY*height, 
    prsn[p].posX*width+ (cos(radians(prsn[p].heading*360)))*lnlength, 
    prsn[p].posY*width+ (sin(radians(prsn[p].heading*360)))*lnlength);
  }

  private void obj() {
    for (int i = 0; i < bjct.length; i++) {
      if (bjct[i].tgl) {
        fill(255);
        ellipse(bjct[i].posX*width, bjct[i].posY*height, 20, 20);
      }
    }
  }
}

