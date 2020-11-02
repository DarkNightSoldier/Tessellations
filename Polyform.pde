class Polyform{
  protected int cellX;
  protected int cellY;
  protected String configuration;
  private char[][] figureArray;
  protected char[][] previewArray;
  protected boolean isDropping;
  
  //Builder method of the class Polyform
  public Polyform(String configuration){
    this.configuration = configuration;
    this.figureArray = toFigArray(configuration);
    this.previewArray = figureArray;
  }
  
  //Create a 2D matrix of characters fron the string of configuration
  private char[][] toFigArray(String conf){
    String[] rows = conf.split("-");
    char figArray[][] = new char[rows.length][rows.length];
    for(int row=0;row<rows.length;row++){
      figArray[row] = rows[row].toCharArray();
    }
    return figArray;
  }
  
  //Returns an array with positions of the figures in axis X and Y
  private ArrayList<Integer>[] getPositionArray(int cellX,int cellY, char[][] figArray){
    ArrayList<Integer>[] posArray = new ArrayList[2];
    
    //Initializing
    posArray[1] = new ArrayList<Integer>();
    posArray[2] = new ArrayList<Integer>();
    
    for(int i=0;i<figArray.length;i++){
      for(int j=0;j<figArray.length;j++){
        if(figArray[i][j]!='0'){
          posArray[0].add(i+cellX);
          posArray[1].add(j+cellY);
        }
      }
    }
    return posArray;
  }
  
  //Creates an preview array of the movement to verify availability
  public ArrayList<Integer>[]previewMovement(String Type){
    ArrayList<Integer>[] positions = new ArrayList[2];
    switch(Type){
      case "reflection":
        previewArray = reflect();
        positions = getPositionArray(cellX,cellY, previewArray);
        break;
      case "rotation":
        previewArray = rotateClockwise();
        positions = getPositionArray(cellX,cellY, previewArray);
        break;
      case "drop":
        previewArray = figureArray;
        positions = getPositionArray(cellX,cellY+1, previewArray);
        break;
      case "left":
        previewArray = figureArray;
        positions = getPositionArray(cellX-1,cellY, previewArray);
        break;
      case "right":
        previewArray = figureArray;
        positions = getPositionArray(cellX+1,cellY, previewArray);
        break;
    }
    return positions;
  }
  
  //Apply the preview Array
  public void applyLastMovement(){
     figureArray = previewArray;
  }
  
  //Thanks to Inder_Verma @ Geeks for Geeks
  private char[][] rotateClockwise(){
    char[][] rotated = figureArray;
    int n = rotated.length;
    // Traverse each cycle 
    for (int i = 0; i < n / 2; i++) { 
        for (int j = i; j < n - i - 1; j++){ 
            // Swap elements of each cycle 
            // in clockwise direction 
            char temp = rotated[i][j]; 
            rotated [i][j] = rotated[n - 1 - j][i]; 
            rotated[n - 1 - j][i] = rotated[n - 1 - i][n - 1 - j]; 
            rotated[n - 1 - i][n - 1 - j] = rotated[j][n - 1 - i]; 
            rotated[j][n - 1 - i] = temp; 
        } 
    } 
    return rotated;
  }
  
  private char[][] reflect(){
    char[][] reflection  = new char[figureArray.length][figureArray.length];
    for(int i=0; i<reflection.length; i++){
      for(int j=0; i<reflection.length; j++){
        reflection[i][j] = figureArray[reflection.length-i][reflection.length-j];
      }
    }
    return reflection;
  }
  
  public void swapForColumn(){
    char[][] swapped = new char[figureArray.length][figureArray.length];
    for(int j=0; j<swapped.length; j++){
      for(int i=0; i<swapped.length; i++){
        swapped[i][j] = figureArray[(i+1)%swapped.length][j];
      }
    }
    figureArray = swapped;
  }
}
