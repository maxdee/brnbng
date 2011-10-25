
//mapping ============================================================
void posmap(float px, float py, float heading) {
  background(0);
  int lnlenght = 20;
  stroke(205);
  line(50, 20, 10, 20);
  line(int(px*width), int(py*height), int(px*width)+ int((cos(radians(heading*360)))*lnlenght), int(py*height+(sin(radians(heading*360)))*lnlenght));
}




//heading =============================================================

//void mouseMoved() {
//  heading += float(mouseX-pmouseX)/width;
//  println(float(mouseX-pmouseX)/width);
//}

void mouseHeading() {  
  //using pmouseXY
  heading += 1.5*(float(mouseX-pmouseX)/width);


  //  heading = ((float(mouseN-mouseO)/float(width))/3+heading);  

  //println(10*(float(mouseX-pmouseX)/width));
}




//walking ===============================================================
void keyPressed() {
  walk(key);
}

void keyReleased() {
  walking = true;
}

void walk(int dir) {
  float speed = 0.005;
  //mouseHeading();

  //forward
  if (boundary()) {
    if (dir == 119) {
      posX += cos(radians(heading*360))*speed;
      posY += sin(radians(heading*360))*speed;
    }
    //right  
    if (dir == 100) {
      posX += cos(radians((heading*360)+90))*speed;
      posY += sin(radians((heading*360)+90))*speed;
    }
    //left
    if (dir == 97) {
      posX += cos(radians((heading*360)-90))*speed;
      posY += sin(radians((heading*360)-90))*speed;
    }
    //backwards
    if (dir == 115) {
      posX -= cos(radians(heading*360))*speed;
      posY -= sin(radians(heading*360))*speed;
    }
  }

  //detect keyup
  if (walking) {
    walking = false;
    return;
  }
}

boolean boundary() {
  if (posX*width > 0 && posX*width < width && posX*width > 0 && posY*height < height) {
    return true;
  }
  else {
    //get back on track
    println("bump");
    return false;
  }
} 


