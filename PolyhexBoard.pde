class PolyhexBoard extends Board{
  String[] H = {"100-100-100","10-11","11-10"};
  
  public PolyhexBoard(int nCellsX, int nCellsY){
    super(nCellsX,nCellsY);
    this.figure = new Polyform(H[1]);
  }
  
  @Override
  public void drawBoard(){
      fill(255);
      rect(0,0,900,650);
      noFill();
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
          if(column%2==0 & figure.cellX%2==0){
            hexagon(36*figure.cellX+36*column,figure.cellY*40+row*40,24);
          }else if(column%2==1 & figure.cellX%2==0){
            hexagon(36*figure.cellX+36*column,20+figure.cellY*40+row*40,24);
          }else if(column%2==0 & figure.cellX%2==1){
            hexagon(36*figure.cellX+36*column,-20+(figure.cellY+1)*40+row*40,24);
          }else if(column%2==1 & figure.cellX%2==1){
            hexagon(36*figure.cellX+36*column,(figure.cellY+1)*40+row*40,24);
          }
        }
      }
    }
  }
  
 public void dropPolyhex(){
   if(verifyPositions(figure.previewMovement("drop"))){
     figure.cellY++;
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
   }
  }
}
