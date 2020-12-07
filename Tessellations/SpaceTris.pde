PShape ship;
int xShip;

void setupSpaceTris(){
  ship = loadShape("ship.svg");
  ship.scale(0.2);
  board = new SquareBoard(0,0,40,10,14,colorList,"sTris");
  board.configurations = T;
  board.setupPreviewBoard(440,100,30,4,2);
  board.newFigure();
  frameRate = 20;
}

void launchSpaceTris(){
  board.drawBoard();
  board.previewBoard.drawBoard();
  board.drawFigure();
  xShip = getShipPos();
  translate(xShip-40,530);
  shape(ship);
  board.upFigure();
  text(lines,450,350);
  verifyAndDropSpaceTris();
  if(mousePressed){
    board.newFigure();
    board.figure.cellX = (int) (xShip-40)/40;
  }
  if(keyPressed){
    figureModifySpaceTris(keyCode);
  }
}

void figureModifySpaceTris(int keyCode){
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

void verifyAndDropSpaceTris(){
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

void verifyStateGameSpaceTris(){
  stateGame = true;
}
 
int getShipPos(){
  int xPos=0;
  if(mouseX>320){
   return 320;
  }else{
   return mouseX;
  }
}
