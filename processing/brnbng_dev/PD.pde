class PD {
  NetAddress pdip;
  //-----------------------------METHODS--------------------------
  public PD(NetAddress ip) {
    pdip = ip;
  }
  
  public void persona(int j, float h, float x, float y) {
    OscMessage myMessage = new OscMessage("/persona"); 
    myMessage.add(j+" "+h+" "+x+" "+y); 
    osc.send(myMessage, pdip);
  }
  
  public void objects(float h, float x, float y) {
    OscMessage myMessage = new OscMessage("/objects"); 
    myMessage.add(h+" "+x+" "+y); 
    osc.send(myMessage, pdip);
  }
}

