class Duino {
  //-----------------------------PROPERTIES--------------------------
  int leddata;
  Led[] led = new Led[4];



  //-----------------------------METHODS--------------------------
  //construct
  public Duino() {
    for (int i = 0; i < led.length; i++) {
      led[i] = new Led(i);
    }
  }


  //handle channels
  //254-255 dadada
  //rgb mode colour * eye * on/offs

  public void send(int i) {  
    //update data
    led[prsn[i].leye].display();
    led[prsn[i].reye].display();
    //println(led[0].on+"    "+led[0].off);
    int[] serda = new int [9];
    //254 and 255 to choose player
    serda[0] = 254+i;    
    serda[1] = led[0+(2*i)].on/128;
    serda[2] = led[0+(2*i)].on%128;
    serda[3] = led[0+(2*i)].off/128;
    serda[4] = led[0+(2*i)].off%128;
    serda[5] = led[1+(2*i)].on/128;
    serda[6] = led[1+(2*i)].on%128;
    serda[7] = led[1+(2*i)].off/128;
    serda[8] = led[1+(2*i)].off%128;
    //int by = 0;
    for (int by = 0; by < 9; by++) {
      comport.write(serda[by]);
    }
  }
  //acumulate object data and merge.
}





//class Duino {
//  //-----------------------------PROPERTIES--------------------------
//  int leddata;
//  Led[] led = new Led[4];
//
//
//
//  //-----------------------------METHODS--------------------------
//  //construct
//  public Duino() {
//    for (int i = 0; i < led.length; i++) {
//      led[i] = new Led(i);
//    }
//  }
//
//
//  //handle channels
//  //254-255 dadada
//  //rgb mode colour * eye * on/offs
//
//  public void send(int p) {  
//    //update data
//    for (int i = 0; i < led.length; i++) {
//      led[i].display();
//    }
//    for (int i = 0; i < 2; i++) {
//      //println(led[0].on+"    "+led[0].off);
//      int[] serda = new int [9];
//      //254 and 255 to choose player
//      serda[0] = 254+i;    
//      serda[1] = led[0+(2*i)].on/128;
//      serda[2] = led[0+(2*i)].on%128;
//      serda[3] = led[0+(2*i)].off/128;
//      serda[4] = led[0+(2*i)].off%128;
//      serda[5] = led[1+(2*i)].on/128;
//      serda[6] = led[1+(2*i)].on%128;
//      serda[7] = led[1+(2*i)].off/128;
//      serda[8] = led[1+(2*i)].off%128;
//      //int by = 0;
//      for (int by = 0; by < 9; by++) {
//        comport.write(serda[by]);
//      }
//    }
//  }
//  //acumulate object data and merge.
//}

