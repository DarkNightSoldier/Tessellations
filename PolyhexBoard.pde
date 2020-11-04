class PolyhexBoard extends Board{
  String[] H = {"100-100-100","10-11","11-10"};
  color [] colorLst = {#B9FFF0,#B9FFF0,#FFCA00,#A5FF00,#FF0D00,#6384FF,#F9FF35,#B279FF};
  
  public PolyhexBoard(int nCellsX, int nCellsY){
    super(nCellsX,nCellsY);
    maxRange = 5;
    this.figure = new Polyform(""+(int) random(1,maxRange+1)+"00-"+(int) random(1,maxRange+1)+"00-"+(int) random(1,maxRange+1)+"00");
  }
  
  @Override
  public void drawBoard(){
    drawGrid();
    for (int row = 0; row < matrixBoard.length;row++){
      for (int col = 0; col < matrixBoard[row].length;col++){
       if(matrixBoard[row][col]!=0){
         fill(colorList[matrixBoard[row][col]]);
         if(col%2==0){
           hexagon(36*col,40*row,24);
           fill(0);
           textSize(18);
           textAlign(CENTER);
           text(""+(int)pow(2,matrixBoard[row][col]),col*36+20,row*40+24);
         }else{
           hexagon(36*col,20+40*row,24);
           fill(0);
           textSize(18);
           textAlign(CENTER);
           text(""+(int)pow(2,matrixBoard[row][col]),col*36+20,row*40+40);
         }
       }
     }
    }
  }
  
  public void drawGrid(){
        noStroke();
        stroke(255);
        fill(0);
        for(int i=0;i<=2*nCellsY;i++){
            if(i%2==0){
                for(int x=0;x<=450;x+=72){
                    hexagon(36+x,500-i*20,24);
                }
            }
            else{
                for(int x=0;x<=450;x+=72){
                    hexagon(0+x,500-i*20,24);
                }
            }
        }
  }
  
  public void drawPolyhex(){
    for(int row=0;row<figure.figureArray.length;row++){
      for(int column=0;column<figure.figureArray.length;column++){
        if(figure.figureArray[row][column]!='0'){
            fill(colorLst[Character.getNumericValue(figure.figureArray[row][column])]);
            if((column+figure.cellX)%2==0){
              hexagon(36*figure.cellX+36*column,figure.cellY*40+row*40,24);
              fill(0);
              textSize(18);
              text((int)pow(2,Character.getNumericValue(figure.figureArray[row][column])),36*figure.cellX+36*column+20,figure.cellY*40+row*40+24,24);
              noFill();
            }else{
              hexagon(36*figure.cellX+36*column,20+(figure.cellY*40+row*40),24);
              fill(0);
              textSize(18);
              text((int)pow(2,Character.getNumericValue(figure.figureArray[row][column])),36*figure.cellX+36*column+20,figure.cellY*40+row*40+40,24);
              noFill();
            }
        }
      }
    }
  }
  
 public void dropPolyhex(){
   if(verifyPositions(figure.previewMovement("drop"))){
     figure.cellY++;
   }else{
     isDropping = false;
     addFigure();
     figure = new Polyform(""+(int) random(1,maxRange+1)+"00-"+(int) random(1,maxRange+1)+"00-"+(int) random(1,maxRange+1)+"00");
   }
 }
 
 public void figureModify(int keyCode){
   switch(keyCode){
     case LEFT:
       if(verifyPositions(figure.previewMovement("left"))){
         figure.applyLastMovement();
       }
       break;
    case RIGHT:
      if(verifyPositions(figure.previewMovement("right"))){
         figure.applyLastMovement();
       }
       break;
    case UP:
       figure.swapForColumn();
   }
  }
}
