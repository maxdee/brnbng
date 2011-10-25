//led vision system.


//use position to see how far is sight

//distance

//float posX = 0.5;
//float posY = 0.5;
//float heading = 0;

//  obj(30, 30, 20);
//  
//  //eye 1
//  //eye 2
//  int on0 = 500;
//int off0 = 500;
//int on1 = 500;
//int off1 = 500;

//
//if (dir == 100) {
//  posX += cos(radians((heading*360)+90))*speed;
//  posY += sin(radians((heading*360)+90))*speed;
//}



void sight(boolean eye) {
  //object check in direction of heading.
  float eyesep = 0.05;
  float eyeposX;
  float eyeposY;

  if (eye) {
    eyeposX = posX + cos(radians((heading*360)+90))*eyesep;
    eyeposY = posY + sin(radians((heading*360)+90))*eyesep;
    point(eyeposX*width, eyeposY*height);
  } 
  else {
    eyeposX = posX + cos(radians((heading*360)-90))*eyesep;
    eyeposY = posY + sin(radians((heading*360)-90))*eyesep;
    point(eyeposX*width, eyeposY*height);
  }
 //the big vision loop
  for (int cn = 0; cn <= objNum; cn++) {
   
    println((posX - eyeposX)*(objY[cn]-eyeposY) -(posY-eyeposY)*(objX[cn]-eyeposX));

    
    
    
    line(eyeposX*width,eyeposY*height,objX[cn],objY[cn]);
    //println(tet);
    //}
  }
}
//if eye flase/true to assign blinking to eyes.

