Board board;
int y;
int x=216;
int type = 2;
int rotation = 2;
color [] colorList = {#B9FFF0,#B9FFF0,#FFCA00,#A5FF00,#FF0D00,#6384FF,#F9FF35,#B279FF};
int [][] T = {{},{15,4369,15,4369},
              {116,785,23,2188},
              {54,1122,54,1122},
              {99,612,99,612},
              {113,275,71,1604},
              {51,51,51,51},
              {114,610,39,562}};
PImage img;
boolean stateGame = false;


public void settings(){
   size(900,650);
}

public void setup(){
  img = loadImage("background.jpg");
  //board = new PolyhexBoard(14,13);
  setup2048SQ();
}

/**
public void draw(){
  board.drawBoard();
  fill(255,0,0);
  board.drawPolyhex();
  noFill();
  board.dropPolyhex();
  if(keyPressed){
      board.figureModify(keyCode);
  }
}*/

public void draw(){
  launch2048SQ();
}

void drawPolyhex(){
  fill(colorList[2]);
  hexagon(72,y,24);
  hexagon(72,y+40,24);
  hexagon(72,y+80,24);
  fill(255);
  textSize(20);
  text("1",72+18,y+24);
}

//Function to draw active tetromino figure
void drawTetromino(){
  fill(colorList[type]);
  for(int i=0; i<=15;i++){ 
    if((T[type][rotation] & (1<<15 - i)) != 0){
      hexagon(x-(((15-i)%4)*48),y-((15-i)/4)*40,24);
    }
  }
}
