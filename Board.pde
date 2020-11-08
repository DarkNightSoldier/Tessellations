abstract class Board {
  protected int nCellsX,nCellsY,size,score,maxRange;
  protected int w,h,x,y;
  protected int[][] matrixBoard;
  protected Polyform figure;
  protected boolean isDropping;
  public color[] colorList;
  public String[] configurations;
  public Board previewBoard;

  /**
  * Verify if a movement into the board is possible
  * @param positionArray: ArrayList with figure positions
  * @return correctMovement: Boolean value that indicates if movement is possible 
  **/
  protected boolean verifyPositions(ArrayList<Integer>[]positionArray) {
    boolean correctMovement=true;
    for (int pos=0; pos<positionArray[0].size(); pos++) {
      if ((positionArray[1].get(pos)>=nCellsY | positionArray[1].get(pos)<0)|(positionArray[0].get(pos)<0 | positionArray[0].get(pos)>=nCellsX)) {
        correctMovement = false;
        break;
      }
      if (matrixBoard[positionArray[1].get(pos)][positionArray[0].get(pos)]!=0) {
        correctMovement=false;
        break;
      }
    }  
    return correctMovement;
  }

  /**
  * Draws the board with the corresponding tesellation
  **/
  public abstract void drawBoard();
  
  /**
  * Draws the polyform figure associated with the board
  **/
  public abstract void drawFigure();
  
  public void randomFillBoard() {
    for (int row = 0; row < matrixBoard.length; row++) {
      for (int col = 0; col < matrixBoard[row].length; col++) {
        if (matrixBoard[row][col]==0) {
          matrixBoard[row][col] = (int) random(1, maxRange+1);
        }
      }
    }
  }
  
  /**
  * Method to fill empty spaces by leaving dropping the cells of the column
  **/
  public void dropByColumn() {
    int temp;
    for (int col = 0; col<matrixBoard[0].length; col++) {
      for (int row = nCellsY-1; row>1; row--) {
        if((matrixBoard[row][col]==0)) {
          temp = matrixBoard[row-1][col];
          matrixBoard[row][col] = temp;
          matrixBoard[row-1][col] = 0;
        }
      }
    }
  }
  
  /**
  * Method to get the matrix associated with the board
  * @return matrixBoard: Two-dimensional integer array associated with the cells of the board
  **/
  public int[][] getMatrixBoard() {
    return matrixBoard;
  }
  
  /**
  * Method to clear cells of the board
  * @param cellPositions: ArrayList of Integer Arrays that that contains the positions of the cells to clear
  **/
  public void clearCells(ArrayList<Integer>[]cellPositions) {
    for (int pos = 0; pos<cellPositions[0].size(); pos++) {
      matrixBoard[cellPositions[1].get(pos)][cellPositions[0].get(pos)]=0;
    }
  }
  
  /**
  * Method to add the active Polyform figure of the board as cells of the board
  **/
  protected void addFigure() {
    for (int i=0; i<figure.figureArray.length; i++) {
      for (int j=0; j<figure.figureArray[0].length; j++) {
        if (figure.figureArray[i][j]!=0) {
          matrixBoard[i+figure.cellY][j+figure.cellX] = figure.figureArray[i][j];
        }
      }
    }
  }
  
  /**
  * Method to control the dropping of the active Polyform figure
  **/
  public void dropFigure() {
    if (verifyPositions(figure.previewMovement("drop"))) {
      figure.cellY++;
    }else {
       addFigure();
       executeIfNotDropping(); 
       newFigure();
    }
  }
  
  /**
  * Abstract method to execute actions when the active Tetromino figure isn't falling
  **/
  public abstract void executeIfNotDropping();
  
  /**
  * Abstract method to create a new Active Polyform Figure associated with the board
  **/
  public abstract void newFigure();
  
  /**
  * Method to clear cells that form a line of more than "minIndentical" cells with the same value of selected cell
  * @param cellX: Number of column of the selected cell into the matrixBoard
  * @param cellY: Number of row of the selected cell into the matrixBoard
  * @param type: String that identifies how to proceed with the selected cell
  * @param minIdentical: Mininum of values that must be identical
  **/
  public void clearIdenticalAndApply(int cellX,int cellY, String type, int minIdentical){
    int counter = 1;
    ArrayList<Integer>[] cellPositions = new ArrayList[2];
    //Initializing
    cellPositions[0] = new ArrayList<Integer>();
    cellPositions[1] = new ArrayList<Integer>();
    int value = matrixBoard[cellY][cellX];
    
    //Check upperleft
    int actualValue = value;
    int posX = cellX;
    int posY = cellY;
    while(actualValue==value & posX>0 & posY>0){
      posX--;
      posY--;
      actualValue = matrixBoard[posY][posX];
      if(actualValue==value & value!=0){
        counter++;
        cellPositions[0].add(posX);
        cellPositions[1].add(posY);
      }
    }
    
    //Check upper
    actualValue = value;
    posX = cellX;
    posY = cellY;
    while(actualValue==value & posY>0){
      posY--;
      actualValue = matrixBoard[posY][posX];
      if(actualValue==value & value!=0){
        counter++;
        cellPositions[0].add(posX);
        cellPositions[1].add(posY);
      }
    }
    
    //Check upperright
    actualValue = value;
    posX = cellX;
    posY = cellY;
    while(actualValue==value & posX<nCellsX-1 & posY>0){
      posX++;
      posY--;
      actualValue = matrixBoard[posY][posX];
      if(actualValue==value & value!=0){
        counter++;
        cellPositions[0].add(posX);
        cellPositions[1].add(posY);
      }
    }
    
    //Check right
    actualValue = value;
    posX = cellX;
    posY = cellY;
    while(actualValue==value & posX<nCellsX-1){
      posX++;
      actualValue = matrixBoard[posY][posX];
      if(actualValue==value & value!=0){
        counter++;
        cellPositions[0].add(posX);
        cellPositions[1].add(posY);
      }
    }
    
    //Check lower right
    actualValue = value;
    posX = cellX;
    posY = cellY;
    while(actualValue==value & posY<nCellsY-1 & posX<nCellsX-1){
      posY++;
      posX++;
      actualValue = matrixBoard[posY][posX];
      if(actualValue==value & value!=0){
        counter++;
        cellPositions[0].add(posX);
        cellPositions[1].add(posY);
      }
    }
    
    //Check lower
    actualValue = value;
    posX = cellX;
    posY = cellY;
    while(actualValue==value & posY<nCellsY-1){
      posY++;
      actualValue = matrixBoard[posY][posX];
      if(actualValue==value & value!=0){
        counter++;
        cellPositions[0].add(posX);
        cellPositions[1].add(posY);
      }
    }
    
    //Check lower left
    actualValue = value;
    posX = cellX;
    posY = cellY;
    while(actualValue==value & posY<nCellsY-1 & posX>0){
      posY++;
      posX--;
      actualValue = matrixBoard[posY][posX];
      if(actualValue==value & value!=0){
        counter++;
        cellPositions[0].add(posX);
        cellPositions[1].add(posY);
      }
    }
    
    //Check left
    actualValue = value;
    posX = cellX;
    posY = cellY;
    while(actualValue==value & posX>0){
      posX--;
      actualValue = matrixBoard[posY][posX];
      if(actualValue==value & value!=0){
        counter++;
        cellPositions[0].add(posX);
        cellPositions[1].add(posY);
      }
    }
    if(counter>=minIdentical){
      clearCells(cellPositions);
      applyIdentical(cellX,cellY,counter,value,type);
    }
  }
  
  /**
  * Method to modify a Cell if has "minIdentical" cells near with the same value
  * @param cellX: Number of column of the selected cell into the matrixBoard
  * @param cellY: Number of row of the selected cell into the matrixBoard
  * @param type: String that identifies how to proceed with the selected cell
  **/
  public void applyIdentical(int cellX, int cellY, int counter, int value, String type){
     switch(type){
       case "clear":
         matrixBoard[cellY][cellX] = 0;
         break;
       case "random":
         matrixBoard[cellY][cellX] = (int) random(1, maxRange);
         break;
       case "2048":
         matrixBoard[cellY][cellX] = value+(counter/2);
         break;
     }
  }
  
  /**
  * Method to label the Polyform figure with a String
  * @param type: String that identifies the label to apply
  * @param value: Integer value associated with the cell of the Polyform Figure
  * @return label: String that will be text which cell will display
  **/
  protected String labelFigure(String type,int value){
    String label="";
    if(type=="2048" | type=="T2048"){
      label = ""+ (int) (pow(2,value));
    }
    return label;
  }
  
  /**
  * Method to clear a specific row of the Board
  **/
  public void removeRow(int row){
    for(int pos=0;pos<matrixBoard[row].length;pos++){
      matrixBoard[row][pos] = 0;
    }
  }
  
  /**
  * Method randomize the cells of the active Polyform Figure associated with the board
  **/
  protected void randomizeFigure(){
    for(int i=0;i<figure.figureArray.length;i++){
      for(int j=0;j<figure.figureArray[0].length;j++){
        if(figure.figureArray[i][j]!=0){
          figure.figureArray[i][j] = (int) random(1,maxRange);
        }
      }
    }
 }
 
 /**
 * Method to setup a preview of the next active Polyform Figure
 * @param xPos: x-coordinate of the board
 * @param yPos: y-coordinate of the board 
 * @param size: Size in pixels of each cell of the board
 * @param nCellsX: Number of cells in axis x
 * @param nCellsY: Number of cells in axis y
 **/
 public abstract void setupPreviewBoard(int xPos,int yPos,int size,int nCellsX,int nCellsY);

}
