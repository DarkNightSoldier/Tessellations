String [] T = {"1111-0000-0000-0000","2220-2000-0000-0000","033-330-000","440-044-000","555-005-000","66-66","777-070-000"};


void setupTetrisClassic(){
  board = new SquareBoard(0,0,40,10,16,colorList,"TWithPreview");
  board.configurations = T;
  board.setupPreviewBoard(440,40,30,4,2);
  board.newFigure();
  frameRate = 6;
}

void launchTetrisClassic(){
  board.drawBoard();
  board.drawFigure();
  board.dropFigure();
  board.previewBoard.drawBoard();
  verifyAndDropTetris();
  verifyStateGameTetris();
  if(keyPressed){
    figureModifyTetris(keyCode);
  }
  //setBarParams(board.score,linesAtTime,"");
}

void figureModifyTetris(int keyCode){
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
       if(board.verifyPositions(board.figure.previewMovement("rotation"))){
         board.figure.applyLastMovement();
       }
       break;
   }
}

void verifyAndDropTetris(){
  int[][] copyMB = board.getMatrixBoard();
  int linesAtTime=0;
  for(int row=0;row<copyMB.length;row++){
    boolean full = true;
    for(int pos=0;pos<copyMB.length;pos++){
      if(copyMB[row][pos]==0){
        full = false;
        break;
      }
    }
   if(full){
     board.removeRow(row);
     board.score+=100;
     linesAtTime++;
   }
  }
}

void verifyStateGameTetris(){
  int[][] copyMB = board.getMatrixBoard();
  for(int pos=0;pos<copyMB[0].length;pos++){
    if(copyMB[0][pos]!=0){
      stateGame = false;
      break;
    }
  }
}
