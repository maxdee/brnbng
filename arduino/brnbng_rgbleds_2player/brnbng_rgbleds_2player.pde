//strobe everything

//states keep the state of the port, modified by AND&?
int state[] = {0,1}; 
int time = 10000;

//two-three frequencies per colour/per eye.
//perhaps monochromatic for now.



int ticks = 0;

//sets the delays
//class eyes?
unsigned int ons[5];
unsigned int offs[5];


//keeps tracks
unsigned int countson[2];
unsigned int countsoff[2];

int ndxV = 0;
int index[16];
int reader = 0;

void setup(){
  DDRB = B11111111;
  Serial.begin(9600);
}


void loop(){
  //debug();
    
  PORTB = (stateB << 2);
  //delayMicroseconds(time);
 //delay(500);
  cnt(); 
  while(Serial.available()){
    Sread();
  }
}

void cnt(){
  for(int cur = 0; cur < 2; cur++){
    if((stateB & (1 << cur)) != 0){
      ++countson[cur];
      if(countson[cur] >= ons[cur]){
        stateB ^= (1 << cur);
        countson[cur] = 0;
      }
    }
    else{
      ++countsoff[cur];
      if(countsoff[cur] >= offs[cur]){
        stateB ^= (1 << cur);
        countsoff[cur] = 0;
      }
    }
  }
}

//header for each player
void Sread(){
  index[ndxV++] = Serial.read();
  if(ndxV >= 9){
    //if ndx0 == 255 player[1] 
    if(index[0] == 255){
      ons[0] = (index[1] << 7)+index[2];
      offs[0] = (index[3] << 7)+index[4];
      ons[1] = (index[5] << 7)+index[6];
      offs[1] = (index[7] << 7)+index[8];
    }
    ndxV = 0;    
  }
}


void debug(){
  Serial.print(ons[0]);
  Serial.print("    ");
  Serial.print(offs[0]);
  Serial.print("    ");
  Serial.print(ons[1]);
  Serial.print("    ");
  Serial.println(offs[1]);
  Serial.println(stateB, BIN);
  //delay(500);
}



