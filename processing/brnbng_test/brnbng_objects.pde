

int objSize = 50;
float ha = degrees(sin(mouseX-100)/objSize);



void mousePressed() {
  putObject(float(mouseX)/width, float(mouseY)/height, objSize);
}

//the drawing function
void putObject(float x, float y, float d) {
  objX[objNum] = x;
  objY[objNum] = y;
  objS[objNum] = d;
  stroke(50);
  objNum++;
}

void objects() {
  for (int cn = 0; cn <= objNum; cn++) {
    ellipse(objX[cn]*width, objY[cn]*height, objS[cn], objS[cn]);
  }
}

