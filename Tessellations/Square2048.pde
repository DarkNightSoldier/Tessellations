int size = 80;
void setup2048SQ(){
  board = new SquareBoard(0,0,size,5,8,colorList,"2048");
  board.randomFillBoard();
}

void launch2048SQ(){
  frameRate = 60;
  board.drawBoard();
  if(mousePressed & mouseX<size*5){
    board.clearIdenticalAndApply(mouseX/size,mouseY/size,"2048",3);
    board.dropByColumn();
  }
  board.dropByColumn();
  board.randomFillBoard();
}
