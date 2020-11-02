class Board{
    protected String type;
    protected int cellX;
    protected int cellY;
    protected byte[][] matrixBoard;
    protected Polyform figure;

    public Board(int cellX, int cellY){
        this.cellX = cellX;
        this.cellY = cellY;
        matrixBoard = new byte[cellY][cellX];
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
