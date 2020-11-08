class SquareBoard extends Board{
  public String label;
  
  public SquareBoard(int x, int y, int size,int nCellsX, int nCellsY,color[] colorList,String label){
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
    //Vertical lines
    for (int i = 0; i <w ; i = i + size){
        line(x+i,y,x+i,y+h);
    }
    //Horizontal lines
    for (int j = 0; j <h ; j = j + size){
        line(x,y+j,x+w,y+j);
    }
   }
   
   public void drawBoard(){
    drawGrid();
    for (int row = 0; row < matrixBoard.length;row++){
      for (int col = 0; col < matrixBoard[row].length;col++){
       if(matrixBoard[row][col]!=0){
         fill(colorList[matrixBoard[row][col]%colorList.length]);
         square(x+col*size,y+row*size,size);
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
              square(x+size*figure.cellX+column*size,y+figure.cellY*size+row*size,size);
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
     if(label=="2048"){
       for(int i=0;i<3;i++){
         clearIdenticalAndApply(figure.cellX,figure.cellY+i,"2048",3);
         delay(25);
         dropByColumn();
       }
     }
  }
  
  public void setupPreviewBoard(int xPos,int yPos,int size,int nCellsX,int nCellsY){
    previewBoard = new SquareBoard(xPos,yPos,size,nCellsX,nCellsY,colorList,"none");
    previewBoard.configurations = configurations;
    previewBoard.newFigure();
  }
}
