

int objSize = 50;
float ha = degrees(sin(mouseX-100)/objSize);



void mousePressed() {
  putObject(mouseX, mouseY, objSize);
}

//the drawing function
void putObject(int x, int y, int d) {

  objX[objNum] = x;
  objY[objNum] = y;
  objS[objNum] = d;
  //println(sqr);
  stroke(50);
  ellipse(x, y, d, d);
  objNum++;
}

void objects() {
  for (int cn = 0; cn <= objNum; cn++) {
    ellipse(objX[cn], objY[cn], objS[cn], objS[cn]);
  }
}

