void setupSame(){
  board = new CircleBoard(0,120,40,10,10,colorList,"same");
  board.randomFillBoard();
  frameRate = 70;
}

void launchSame(){
  if(mousePressed){
    println("La posición es"+(mouseY-120)/40+"y"+mouseX/40);
    board.clearIdenticalAndApply(mouseX/40,(mouseY-120)/40,"same",2);
  }
  board.dropByColumn();
  board.drawBoard();
  if(mousePressed){
    println("La posición es"+(mouseY-120)/40+"y"+mouseX/40);
    board.clearIdenticalAndApply(mouseX/40,(mouseY-120)/40,"same",2);
  }
}
