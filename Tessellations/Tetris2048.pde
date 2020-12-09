void setupTetris2048(){
  board = new SquareBoard(0,0,40,10,16,colorList,"2048");
  board.configurations = T;
  board.newFigure();
  frameRate = 8;
}

void launchTetris2048(){
  board.drawBoard();
  DisplayScore(450,200);
  board.drawFigure();
  board.dropFigure(); 
  if(keyPressed){
    figureModifyTetris(keyCode);
  }
  verifyStateGameTetris();
}
