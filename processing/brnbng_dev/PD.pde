class PD {
  NetAddress pdip;
  //-----------------------------METHODS--------------------------
  public PD(NetAddress ip) {
    pdip = ip;
  }
  public void send(int p, int o, float x, float y) {
    OscMessage myMessage = new OscMessage("/object"); 
    myMessage.add(x+" "+y+" "+o+" "+p); 
    osc.send(myMessage, pdip);
  }
}
