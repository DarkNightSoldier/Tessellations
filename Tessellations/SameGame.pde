void setupSame(){
  board = new CircleBoard(0,0,40,10,16,colorList,"same");
  board.randomFillBoard();
  frameRate = 90;
}

void launchSame(){
  if(mousePressed){
    board.clearIdenticalAndApply(mouseX/40,mouseY/40,"same",2);
  }
  board.drawBoard();
  DisplayScore(450,200);
}

void checkGameOver(){
  for(int cellY=0;cellY<16;cellY++){
      for(int cellX=0;cellX<10;cellX++){
        if(stateGame & board.matrixBoard[cellY][cellX]==0){
          if(!board.checkNeighbors(cellX,cellY)){
            stateGame = false;
          }
        }
      }
  }
}
