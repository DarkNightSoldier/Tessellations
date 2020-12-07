class CircleBoard extends Board{
  public String label;
  
  public CircleBoard(int x, int y, int size,int nCellsX, int nCellsY,color[] colorList,String label){
    this.nCellsX = nCellsX;
    this.nCellsY = nCellsY;
    this.x = x;
    this.y = y;
    matrixBoard = new int[nCellsY][nCellsX];
    this.size = size;
    this.colorList = colorList;
    w = nCellsX*size;
    h = nCellsY*size;
    this.maxRange = 4;
    this.label = label;
  }
  
   private void drawGrid(){
    fill(155,155,155);
    rect(x,y,w,h);
    noFill();
    stroke(255);
    for (int i = y; i <y+h ; i = i + size){
      for(int j = x; j <x+w ; j = j + size){
        ellipseMode(CENTER);
        ellipse(j+size/2,i+size/2,size,size);
      }
    }
   }
   
   public void drawBoard(){
    drawGrid();
    for (int row = 0; row < matrixBoard.length;row++){
      for (int col = 0; col < matrixBoard[row].length;col++){
       if(matrixBoard[row][col]!=0){
         fill(colorList[matrixBoard[row][col]%colorList.length]);
         ellipseMode(CENTER);
         ellipse(x+col*size+size/2,y+row*size+size/2,size,size);
         fill(0);
         textSize(16);
         textAlign(CENTER);
         text(""+labelFigure(label,matrixBoard[row][col]),x+col*size+(size/2),y+row*size+(size/2));
       }
     }
   }
  }
  
  public void drawFigure(){
    for(int row=0;row<figure.figureArray.length;row++){
      for(int column=0;column<figure.figureArray[0].length;column++){
        if(figure.figureArray[row][column]!=0){
            fill(colorList[figure.figureArray[row][column]]);
              ellipseMode(CENTER);
              ellipse(x+size*figure.cellX+column*size+size/2,y+figure.cellY*size+row*size+size/2,size,size);
              fill(0);
              textSize(16);
              textAlign(CENTER);
              text(labelFigure(label,figure.figureArray[row][column]),size*figure.cellX+column*size+(size/2),figure.cellY*size+row*size+(size/2));
              noFill();
            }
        }
      }
  }
  
  public void newFigure(){
     figure = new Polyform(configurations[(int) random(0,configurations.length)]);
     this.figure.cellX = board.nCellsX/2;
     if(label=="2048"){
       randomizeFigure();
     }else if(label=="sTris"){
       figure = previewBoard.figure;
       this.figure.cellY = nCellsY-1;
       previewBoard.matrixBoard = new int[previewBoard.matrixBoard.length][previewBoard.matrixBoard[0].length];
       previewBoard.newFigure();
       previewBoard.figure.cellX = 0;
       previewBoard.addFigure();
     }else if(label=="TWithPreview"){
       figure = previewBoard.figure;
       figure.cellX = board.nCellsX/2;
       previewBoard.matrixBoard = new int[previewBoard.matrixBoard.length][previewBoard.matrixBoard[0].length];
       previewBoard.newFigure();
       previewBoard.figure.cellX = 0;
       previewBoard.addFigure();
     }
  }
  
  public void executeIfNotDropping(){
    ArrayList<Integer>[] posArray = figure.getPositionArray(figure.cellX,figure.cellY,figure.figureArray);
     if(label=="2048"){
       for(int pos=0;pos<posArray[0].size();pos++){
         clearIdenticalAndApply(posArray[0].get(pos),posArray[1].get(pos),"2048",3);
         delay(15);
         dropByColumn();
       }
     }
  }
  
  public void setupPreviewBoard(int xPos,int yPos,int size,int nCellsX,int nCellsY){
    previewBoard = new CircleBoard(xPos,yPos,size,nCellsX,nCellsY,colorList,"none");
    previewBoard.configurations = configurations;
    previewBoard.newFigure();
  }
  
  @Override
  public void clearIdenticalAndApply(int cellX,int cellY, String type, int minIdentical){
    if(type!="same"){
      super.clearIdenticalAndApply(cellX,cellY,type,minIdentical);
    }if(type=="same"){
      if(checkNeighbors(cellX, cellY)){
        int nCells = recursivelyDeleting(cellX,cellY,0);
        for(int i=0;i<nCells;i++){
          dropAndMoveBoard();
        }
        score+=pow(nCells-1,2);
      }
    }
  }
  
  int recursivelyDeleting(int cellX,int cellY, int countingDeleted){
    int actualValue = matrixBoard[cellY][cellX];
    
     //Clear the cell
     matrixBoard[cellY][cellX] = 0;
     countingDeleted++;
     
     //Check left
     if(cellX!=0){
       if(matrixBoard[cellY][cellX-1]==actualValue){
        countingDeleted += recursivelyDeleting(cellX-1,cellY,countingDeleted);
       }
     }
     
     //Check right
     if(cellX+1!=nCellsX){
       if(matrixBoard[cellY][cellX+1]==actualValue){
         countingDeleted += recursivelyDeleting(cellX+1,cellY,countingDeleted);
       }
     }
     
     //Check up
     if(cellY>=1){
       if(matrixBoard[cellY-1][cellX]==actualValue){
         countingDeleted += recursivelyDeleting(cellX,cellY-1,countingDeleted);
       }
     }
     
     //Check down
     if(cellY<nCellsY-1){
       if(matrixBoard[cellY+1][cellX]==actualValue){
         countingDeleted += recursivelyDeleting(cellX,cellY+1,countingDeleted);
       }
     }

   return countingDeleted;
  }
  
  void dropAndMoveBoard(){
    //Drop Columns
    for(int cellY=0;cellY<nCellsY;cellY++){
      for(int cellX=0;cellX<nCellsX;cellX++){
        if(matrixBoard[cellY][cellX]==0 & cellY>=1){
          matrixBoard[cellY][cellX] = matrixBoard[cellY-1][cellX];
          matrixBoard[cellY-1][cellX] = 0;
        }
      }
    }
   
   //Move columns from right to left
   for(int col=0;col<nCellsX;col++){
     boolean isEmpty = true;
     int pos = 0;
     while(isEmpty && pos<nCellsY){
       if(matrixBoard[pos][col]!=0){
         isEmpty = false;
       }
       pos++;
     }
     //If column is empty we'll move to left
     if(isEmpty){
       for(int cellY=0;cellY<nCellsY;cellY++){
        for(int cellX=col;cellX<nCellsX;cellX++){
          if(cellX!=nCellsX-1){
             matrixBoard[cellY][cellX] = matrixBoard[cellY][cellX+1];
          }else{
            matrixBoard[cellY][cellX] = 0;
          }
        }
      }
     }
   }
  }
}
