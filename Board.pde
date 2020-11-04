class Board{
    protected String type;
    protected int nCellsX;
    protected int nCellsY;
    protected int score;
    protected byte[][] matrixBoard;
    protected Polyform figure;
    protected int maxRange;

    public Board(int nCellsX, int nCellsY){
        this.nCellsX = nCellsX;
        this.nCellsY = nCellsY;
        matrixBoard = new byte[nCellsY][nCellsX];
    }
    
    //Verify if a movement into the board is possible
    protected boolean verifyPositions(ArrayList<Integer>[]positionArray){
      boolean correctMovement=true;
      for(int pos=0;pos<positionArray[0].size();pos++){
        if((positionArray[1].get(pos)>=nCellsY | positionArray[1].get(pos)<0)|(positionArray[0].get(pos)<0 | positionArray[0].get(pos)>=nCellsX)){
          correctMovement = false;
          break;
        }if(matrixBoard[positionArray[1].get(pos)][positionArray[0].get(pos)]!=0){
            correctMovement=false;
            break;
        }
      }  
      return correctMovement;
    }
    
    public void drawBoard(){
    }
    
    public void randomFillBoard(){
      for (int row = 0; row < matrixBoard.length;row++){
        for (int col = 0; col < matrixBoard[row].length;col++){
          if(matrixBoard[row][col]==0){
            matrixBoard[row][col] = (byte)(int) random(1,maxRange+1);
          }
        }
      }
    }
    
  public void dropbyColumn(){
    byte temp;
    for (int col = 0; col<matrixBoard[0].length;col++){
      for (int row = nCellsX-1; row>0; row--){
        if(matrixBoard[row][col]==0){
          temp = matrixBoard[row-1][col];
          matrixBoard[row][col] = temp;
          matrixBoard[row-1][col] = 0;
        }
      }
    }
  }
  
  public byte[][] getMatrixBoard(){
   return matrixBoard; 
  }
  
  public void clearCells(ArrayList<Integer>[]cellPositions){
    for(int pos = 0; pos<cellPositions[0].size(); pos++){
      matrixBoard[cellPositions[1].get(pos)][cellPositions[0].get(pos)]=0;
    }
  }
}
