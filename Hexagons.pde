Board board;

public void settings(){
   size(900,650);
}

public void setup(){
   board = new Board("hex",14,26);
}

public void draw(){
  board.drawBoard();
}

void drawTetromino()
