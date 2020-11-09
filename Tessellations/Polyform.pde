class Polyform{
  public int cellX;
  public int cellY;
  protected String configuration;
  public int[][] figureArray, previewArray;
  private String lastMovement;
  
  //Builder method of the class Polyform
  public Polyform(String configuration){
    this.configuration = configuration;
    this.figureArray = toFigArray(configuration);
    this.previewArray = figureArray;
  }
  
  /**
  * Create a 2D matrix of integers fron the string of configuration
  * @param conf: String-equivalent to 2D Square Matrix that represents the Polyform figure
  **/
  private int[][] toFigArray(String conf){
    String[] rows = conf.split("-");
    char charArray[][] = new char[rows.length][rows.length];
    int figArray[][] = new int[rows.length][rows.length];
    for(int row=0;row<rows.length;row++){
      charArray[row] = rows[row].toCharArray();
      for(int pos=0;pos<charArray[row].length;pos++){
        figArray[row][pos] = Character.getNumericValue(charArray[row][pos]);
      }
    }
    return figArray;
  }
  
  /**
  * Returns a dinamic array with positions of the Polyform Figure in axis X and Y
  * @param cellX: Position of the Polyform figure in axis-x
  * @param cellY: Position of the Polyform figure in axis-y
  * @param figArray: 2D Integer Matrix that identifies the Polyform Figure
  * @return posArray: ArrayList of integer arrays that contain the positions of the figure in axis X and Y 
  **/
  private ArrayList<Integer>[] getPositionArray(int cellX,int cellY, int[][] figArray){
    ArrayList<Integer>[] posArray = new ArrayList[2];
    
    //Initializing
    posArray[0] = new ArrayList<Integer>();
    posArray[1] = new ArrayList<Integer>();
    
    for(int i=0;i<figArray.length;i++){
      for(int j=0;j<figArray.length;j++){
        if(figArray[i][j]!=0){
          posArray[0].add(j+cellX);
          posArray[1].add(i+cellY);
        }
      }
    }
    return posArray;
  }
  
  /**
  * Creates a preview array of the movement to verify cells availability
  * @param type: String that identifies the type of movement to preview
  * @return positions: ArrayList of integer arrays that contain the positions of the figure in axis X and Y, related with the new movement
  **/
  public ArrayList<Integer>[]previewMovement(String type){
    ArrayList<Integer>[] positions = new ArrayList[2];
    lastMovement = type;
    switch(type){
      case "reflection":
        previewArray = reflect();
        positions = getPositionArray(cellX,cellY, previewArray);
        break;
      case "rotation":
        previewArray = rotateClockwise();
        positions = getPositionArray(cellX,cellY, previewArray);
        break;
      case "drop":
        positions = getPositionArray(cellX,cellY+1, previewArray);
        break;
      case "left":
        positions = getPositionArray(cellX-1,cellY, previewArray);
        break;
      case "right":
        positions = getPositionArray(cellX+1,cellY, previewArray);
        break;
    }
    return positions;
  }
  
  /**
  * Applies the movement related with the function previewMovement()
  **/
  public void applyLastMovement(){
    switch(lastMovement){
      case "reflection":
      case "rotation":
       figureArray = previewArray;
       break;
      case "drop":
        cellY = cellY+1;
        break;
      case "left":
        cellX--;
        break;
      case "right":
        cellX++;
        break;
    }
  }
  
  /**
  * Rotates the matrix associated with polyform 90° in clockwise direction
  * @author Inder_Verma at Geeks for Geeks
  * @return 2D-Array of integers that represents the rotated polyform figure
  **/
  private int[][] rotateClockwise(){
    int[][] rotated = figureArray;
    int n = rotated.length;
    // Traverse each cycle 
    for (int i = 0; i < n / 2; i++) { 
        for (int j = i; j < n - i - 1; j++){ 
            // Swap elements of each cycle 
            // in clockwise direction 
            int temp = rotated[i][j]; 
            rotated [i][j] = rotated[n - 1 - j][i]; 
            rotated[n - 1 - j][i] = rotated[n - 1 - i][n - 1 - j]; 
            rotated[n - 1 - i][n - 1 - j] = rotated[j][n - 1 - i]; 
            rotated[j][n - 1 - i] = temp; 
        } 
    } 
    return rotated;
  }
  
  /**
  * Change the order of the matrix associated with polyform
  * @return 2D-Array of integers that represents the reflected polyform figure
  **/
  private int[][] reflect(){
    int[][] reflection  = new int[figureArray.length][figureArray.length];
    for(int i=0; i>reflection.length; i++){
      for(int j=0; i<reflection[0].length; j++){
        reflection[i][j] = figureArray[reflection.length-i][reflection[0].length-1-j];
      }
    }
    return reflection;
  }
  
  /**
  * Swap the cells of the Polyform in column direction
  **/
  public void swapForColumn(){
    int[][] swapped = new int[figureArray.length][figureArray.length];
    for(int j=0; j<swapped.length; j++){
      for(int i=0; i<swapped.length; i++){
        swapped[i][j] = figureArray[(i+1)%swapped.length][j];
      }
    }
    figureArray = swapped;
  }
}
