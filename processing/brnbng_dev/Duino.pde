class Duino {
  //-----------------------------PROPERTIES--------------------------
  int leddata;
  Led[] led = new Led[4];



  //-----------------------------METHODS--------------------------

  public Duino() {
    for (int i = 0; i < led.length; i++) {
      led[i] = new Led(i);
    }
  }


  //handle channels
  //254-255 dadada
  //rgb mode colour * eye * on/offs

  public void send() {  
        for (int i = 0; i < led.length; i++) {
      led[i].display();
    }
    
    
    int[] serda = new int [9];
    //254 and 255
    serda[0] = 255;    
    serda[1] = led[0].on/128;
    serda[2] = led[0].on%128;
    serda[3] = led[0].off/128;
    serda[4] = led[0].off%128;
    serda[5] = led[1].on/128;
    serda[6] = led[1].on%128;
    serda[7] = led[1].off/128;
    serda[8] = led[1].off%128;
    //int by = 0;
    for (int by = 0; by < 9; by++) {
      comport.write(serda[by]);
    }
  }
  //acumulate object data and merge.
}

