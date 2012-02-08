class PD {
  NetAddress pdip;
  //-----------------------------METHODS--------------------------
  public PD(NetAddress ip) {
    pdip = ip;
  }
  public void send(float x, float y, int o, int p) {
    OscMessage myMessage = new OscMessage("/object"); 
    myMessage.add(x+" "+y+" "+o+" "+p); 
    osc.send(myMessage, pdip);
  }
}
