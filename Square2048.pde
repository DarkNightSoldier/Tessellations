int size = 80;
void setup2048SQ(){
  board = new SquareBoard(40,40,20,5,8,colorList,"2048");
  board.randomFillBoard();
}

void launch2048SQ(){
  board.drawBoard();
  if(mousePressed){
    board.clearIdenticalAndApply(mouseX/size,mouseY/size,"2048",3);
    delay(25);
    board.dropByColumn();
  }
  board.dropByColumn();
  board.randomFillBoard();
}
