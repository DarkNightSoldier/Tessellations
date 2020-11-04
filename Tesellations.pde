Board board;
PolyhexBoard board1;
int y;
int x=216;
int fs;
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


void settings(){
   size(900,650);
}

void setup(){
  img = loadImage("background.jpg");
  image(img, 0, 0);
  board1 = new PolyhexBoard(13,13);
  //setup2048SQ();
}


public void draw(){
  frameRate(2);
  board1.drawBoard();
  board1.drawPolyhex();
  board1.dropPolyhex();
  if(keyPressed){
      board1.figureModify(keyCode);
  }
}

/*void draw(){
  launch2048SQ();
}**/
