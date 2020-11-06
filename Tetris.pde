void setupTetris(){
  board2 = new SquareBoard(10,16,5);
  board2.figure = new Polyform("453-020-030");
}

void launchTetris(){
  board2.drawBoard();
  board2.drawPolyform();
  board2.dropFigure(); 
  if(keyPressed){
    figureModify(keyCode);
  }
}

public void figureModify(int keyCode){
   switch(keyCode){
     case LEFT:
       if(board2.verifyPositions(board2.figure.previewMovement("left"))){
         board2.figure.applyLastMovement();
       }
       break;
    case RIGHT:
      if(board2.verifyPositions(board2.figure.previewMovement("right"))){
         board2.figure.applyLastMovement();
       }
       break;
    case UP:
       if(board2.verifyPositions(board2.figure.previewMovement("rotation"))){
         board2.figure.applyLastMovement();
       }
       break;
   }
  }
