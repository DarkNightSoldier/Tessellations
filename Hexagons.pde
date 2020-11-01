Board board;
int y;
color [] colorList = {#B9FFF0,#B9FFF0,#FFCA00,#A5FF00,#FF0D00,#6384FF,#F9FF35,#B279FF};

public void settings(){
   size(900,650);
}

public void setup(){
   board = new Board("hex",14,26);
   frameRate(2);
}

public void draw(){
  board.drawBoard();
  drawTetromino();
  y=y+40;
}

void drawTetromino(){
  fill(colorList[3]);
  hexagon(72,y,24);
  hexagon(72,y+40,24);
  hexagon(72,y+80,24);
}
