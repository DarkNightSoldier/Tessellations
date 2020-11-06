class SquareBoard extends Board{
  int w,h;
  public SquareBoard(int nCellsX, int nCellsY,int maxRange){
    super(nCellsX,nCellsY);
    w = nCellsX*40;
    h = nCellsY*40;
    this.maxRange = maxRange;
  }
  
   protected void drawGrid(){
    fill(255);
    rect(0,0,400,640);
    noFill();
    for (int i = 0; i <400 ; i = i + 40){
        line(i,0,i,640);
    }
    for (int j = 0; j <640 ; j = j + 40){
        line(0,j,400,j);
    }
   }
   
   @Override
   public void drawBoard(){
    drawGrid();
    for (int row = 0; row < matrixBoard.length;row++){
      for (int col = 0; col < matrixBoard[row].length;col++){
       if(matrixBoard[row][col]!=0){
         fill(colorList[matrixBoard[row][col]]);
         square(col*40,row*40,40);
         fill(0);
         textSize(18);
         textAlign(CENTER);
         text(""+(int)pow(2,matrixBoard[row][col]),col*40+20,row*40+25);
       }
     }
   }
  }
  
  public void drawPolyform(){
    for(int row=0;row<figure.figureArray.length;row++){
      for(int column=0;column<figure.figureArray.length;column++){
        if(figure.figureArray[row][column]!='0'){
            fill(colorList[Character.getNumericValue(figure.figureArray[row][column])]);
              square(40*figure.cellX+column*40,figure.cellY*40+row*40,40);
              fill(0);
              textSize(18);
              text((int)pow(2,Character.getNumericValue(figure.figureArray[row][column])),40*figure.cellX+column*40+20,figure.cellY*40+row*40+24);
              noFill();
            }
        }
      }
    }
}
