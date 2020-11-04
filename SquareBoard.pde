class SquareBoard extends Board{
  int w,h;
  public SquareBoard(int nCellsX, int nCellsY,int maxRange){
    super(nCellsX,nCellsY);
    w = nCellsX*40;
    h = nCellsY*40;
    this.maxRange = maxRange;
  }
  
   protected void drawGrid(){
      fill(0);
      for (int i = 0; i <=w ; i = i + 40){
          line(i,0,i,h);
      }
      for (int j = 0; j <h ; j = j + 40){
          line(0,j,w,j);
      }
      fill(255);
      rect(0,0,w,h);
      noFill();
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
}
