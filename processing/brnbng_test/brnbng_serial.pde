
void serialsend() {  
  int[] serda = new int [9];
  serda[0] = 255;
  serda[1] = on0/128;
  serda[2] = on0%128;
  serda[3] = off0/128;
  serda[4] = off0%128;
  serda[5] = on1/128;
  serda[6] = on1%128;
  serda[7] = off1/128;
  serda[8] = off1%128;
  //int by = 0;
  for (int by = 0; by < 9; by++) {
    comport.write(serda[by]);
  }
}
