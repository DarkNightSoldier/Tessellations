String [] T = {"1111-0000-0000-0000","2220-2000-0000-0000","033-330-000","440-044-000","555-005-000","66-66","777-070-000"};
int lines;

void setupTetrisClassic(){
  board = new SquareBoard(0,0,40,10,16,colorList,"TWithPreview");
  board.configurations = T;
  board.setupPreviewBoard(440,100,30,4,2);
  board.newFigure();
  frameRate = 8;
}

void launchTetrisClassic(){
  board.drawBoard();
  board.drawFigure();
  board.dropFigure();
  fill(255);
  textSize(40);
  text("Next",450,60);
  text("Score",450,200);
  text(board.score,450,250);
  text("Lines",450,300);
  text(lines,450,350);
  board.previewBoard.drawBoard();
  verifyAndDropTetris();
  verifyStateGameTetris();
  if(keyPressed){
    figureModifyTetris(keyCode);
  }
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
    case DOWN:
      if(board.verifyPositions(board.figure.previewMovement("drop"))){
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
  lines += linesAtTime;
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
