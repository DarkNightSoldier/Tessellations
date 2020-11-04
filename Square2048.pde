void setup2048SQ(){
  board = new SquareBoard(10,16,5);
  board.randomFillBoard();
}

void launch2048SQ(){
  board.drawBoard();
  if(mousePressed){
    check2048SQ(mouseX,mouseY);
  }
  board.dropByColumn();
  board.randomFillBoard();
}

void check2048SQ(int mouseX,int mouseY){
  int counter = 0;
  byte[][] mB = board.getMatrixBoard();
  ArrayList<Integer>[] cellPositions = new ArrayList[2];
  //Initializing
  cellPositions[0] = new ArrayList<Integer>();
  cellPositions[1] = new ArrayList<Integer>();
  int value = mB[mouseY/40][mouseX/40];
  
  //Check upperleft
  int actualValue = value;
  int cellX = mouseX/40;
  int cellY = mouseY/40;
  while(actualValue==value & cellX>0 & cellY>0){
    cellX--;
    cellY--;
    actualValue = mB[cellY][cellX];
    if(actualValue==value){
      counter++;
      cellPositions[0].add(cellX);
      cellPositions[1].add(cellY);
    }
  }
  
  //Check upper
  actualValue = value;
  cellX = mouseX/40;
  cellY = mouseY/40;
  while(actualValue==value & cellY>0){
    cellY--;
    actualValue = mB[cellY][cellX];
    if(actualValue==value){
      counter++;
      cellPositions[0].add(cellX);
      cellPositions[1].add(cellY);
    }
  }
  
  //Check upperright
  actualValue = value;
  cellX = mouseX/40;
  cellY = mouseY/40;
  while(actualValue==value & cellX<9 & cellY>0){
    cellX++;
    cellY--;
    actualValue = mB[cellY][cellX];
    if(actualValue==value){
      counter++;
      cellPositions[0].add(cellX);
      cellPositions[1].add(cellY);
    }
  }
  
  //Check right
  actualValue = value;
  cellX = mouseX/40;
  cellY = mouseY/40;
  while(actualValue==value & cellX<9){
    cellX++;
    actualValue = mB[cellY][cellX];
    if(actualValue==value){
      counter++;
      cellPositions[0].add(cellX);
      cellPositions[1].add(cellY);
    }
  }
  
  //Check lower right
  actualValue = value;
  cellX = mouseX/40;
  cellY = mouseY/40;
  while(actualValue==value & cellY<15 & cellX<9){
    cellY++;
    cellX++;
    actualValue = mB[cellY][cellX];
    if(actualValue==value){
      counter++;
      cellPositions[0].add(cellX);
      cellPositions[1].add(cellY);
    }
  }
  
  //Check lower
  actualValue = value;
  cellX = mouseX/40;
  cellY = mouseY/40;
  while(actualValue==value & cellY<15){
    cellY++;
    actualValue = mB[cellY][cellX];
    if(actualValue==value){
      counter++;
      cellPositions[0].add(cellX);
      cellPositions[1].add(cellY);
    }
  }
  
  //Check lower left
  actualValue = value;
  cellX = mouseX/40;
  cellY = mouseY/40;
  while(actualValue==value & cellY<15 & cellX>0){
    cellY++;
    cellX--;
    actualValue = mB[cellY][cellX];
    if(actualValue==value){
      counter++;
      cellPositions[0].add(cellX);
      cellPositions[1].add(cellY);
    }
  }
  
  //Check left
  actualValue = value;
  cellX = mouseX/40;
  cellY = mouseY/40;
  while(actualValue==value & cellX>0){
    cellX--;
    actualValue = mB[cellY][cellX];
    if(actualValue==value){
      counter++;
      cellPositions[0].add(cellX);
      cellPositions[1].add(cellY);
    }
  }
  if(counter>=2){
    board.clearCells(cellPositions);
  }
}
