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



void sight() {
  //object check in direction of heading.
  float eyesep = 0.05;
  strokeWeight(3);


  float eyeposLX = posX + cos(radians((heading*360)-90))*eyesep;
  float eyeposLY = posY + sin(radians((heading*360)-90))*eyesep;
  point(eyeposLX*width, eyeposLY*height);

  float eyeposRX = posX + cos(radians((heading*360)+90))*eyesep;
  float eyeposRY = posY + sin(radians((heading*360)+90))*eyesep;
  point(eyeposRX*width, eyeposRY*height);


  //the big vision loop
  for (int cn = 0; cn <= objNum; cn++) {
    float obX = objX[cn]-posX;//eyeposLX;
    float obY = objY[cn]-posY;//eyeposLY;
    float x = (obX*cos(-radians((heading*360)-90)))-(obY*sin(-radians((heading*360)-90))); 
    float y = (obX*sin(-radians((heading*360)-90)))+(obY*cos(-radians((heading*360)-90)));



    if (y > 0) {
      on0 = 0;
      strokeWeight(1);
      ellipse(((x+1)/2)*width, y*height, 10, 10);
      line(eyeposLX*width, eyeposLY*height, objX[cn]*width, objY[cn]*height);
      line(eyeposRX*width, eyeposRY*height, objX[cn]*width, objY[cn]*height);
    }
  }
}





