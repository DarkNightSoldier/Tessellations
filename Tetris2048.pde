void setupTetris2048(){
  board = new SquareBoard(0,0,40,10,16,colorList,"2048");
  board.configurations = T;
  board.newFigure();
  frameRate = 6;
}

void launchTetris2048(){
  board.drawBoard();
  board.drawFigure();
  board.dropFigure(); 
  if(keyPressed){
    figureModifyTetris(keyCode);
  }
  verifyStateGameTetris();
}
