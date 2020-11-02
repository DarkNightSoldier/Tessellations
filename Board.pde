class Board{
    protected String type;
    protected int nCellsX;
    protected int nCellsY;
    protected byte[][] matrixBoard;
    protected Polyform figure;

    public Board(int nCellsX, int nCellsY){
        this.nCellsX = nCellsX;
        this.nCellsY = nCellsY;
        matrixBoard = new byte[nCellsY][nCellsX];
    }
    
    //Verify if a movement into the board is possible
    protected boolean verifyPositions(ArrayList<Integer>[]positionArray){
      boolean correctMovement=true;
      for(int pos=0;pos<positionArray[0].size();pos++){
        if(matrixBoard[positionArray[1].get(pos)][positionArray[0].get(pos)]!=0){
          correctMovement=false;
          break;
        }
      } 
      return correctMovement;
    }
}
