String[] HL = {"100-100-100"};

void setupHexLine2048(){
  board = new HexagonalBoard(0,0,40,10,16,colorList,"2048");
  board.configurations = HL;
  board.newFigure();
  frameRate = 5;
}

void launchHexLine2048(){
  board.drawBoard();
  DisplayScore(500,200);
  board.drawFigure();
  board.dropFigure(); 
  if(keyPressed){
    figureModifyHL20(keyCode);
  }
  verifyStateGameTetris();
}

void figureModifyHL20(int keyCode){
   switch(keyCode){
     case LEFT:
       if(board.verifyPositions(board.figure.previewMovement("left"))){
         board.figure.applyLastMovement();
       }
       break;
    case RIGHT:
      if(board.verifyPositions(board.figure.previewMovement("right"))){
         board.figure.applyLastMovement();
       }
       break;
    case UP:
       board.figure.swapForColumn();
       break;
   }
}
