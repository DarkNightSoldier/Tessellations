class HexagonalBoard extends Board{
  public String label;
  
  public HexagonalBoard(int x, int y, int size,int nCellsX, int nCellsY,color[] colorList,String label){
    this.nCellsX = nCellsX;
    this.nCellsY = nCellsY;
    this.x = x;
    this.y = y;
    matrixBoard = new int[nCellsY][nCellsX];
    this.size = size;
    this.colorList = colorList;
    w = nCellsX*size;
    h = nCellsY*size;
    this.maxRange = 4;
    this.label = label;
  }
  
   public void drawGrid(){
        noStroke();
        stroke(255);
        fill(105,105,105);
        for(int i=0;i<=2*nCellsY;i++){
            if(i%2==0){
                for(int x=0;x<=400;x+=72){
                    hexagon(36+x,620-i*20,24);
                }
            }
            else{
                for(int x=0;x<=400;x+=72){
                    hexagon(0+x,620-i*20,24);
                }
            }
        }
  }
   
   public void drawBoard(){
    drawGrid();
    for (int row = 0; row < matrixBoard.length;row++){
      for (int col = 0; col < matrixBoard[row].length;col++){
       if(matrixBoard[row][col]!=0){
         fill(colorList[matrixBoard[row][col]%colorList.length]);
         if(col%2==0){
           hexagon(x+(9*size/10)*col,y+size*row,(size*3)/5);
           fill(0);
           textSize(16);
           textAlign(CENTER);
           text(labelFigure(label,matrixBoard[row][col]),x+((9*size)/10)*col+24,(size/2)+y+size*row);
         }else{
           hexagon(x+(9*size/10)*col,(size/2)+y+size*row,(size*3)/5);
           fill(0);
           textSize(16);
           textAlign(CENTER);
           text(labelFigure(label,matrixBoard[row][col]),x+((9*size)/10)*col+24,size+y+size*row);
         }
       }
     }
   }
  }
  
  public void drawFigure(){
    for(int row=0;row<figure.figureArray.length;row++){
      for(int column=0;column<figure.figureArray[0].length;column++){
        if(figure.figureArray[row][column]!=0){
            fill(colorList[figure.figureArray[row][column]]);
            if((column+figure.cellX)%2==0){
              hexagon(x+((9*size)/10)*figure.cellX+column*(9*size)/10,y+figure.cellY*size+row*size,(size*3)/5);
              fill(0);
              textSize(16);
              textAlign(CENTER);
              text(labelFigure(label,figure.figureArray[row][column]),x+((9*size)/10)*figure.cellX+column*(9*size)/10+((size*6)/10),y+figure.cellY*size+row*size+(size/2));
              noFill();
            }else{
              hexagon(x+((9*size)/10)*figure.cellX+column*(9*size)/10,(size/2)+y+figure.cellY*size+row*size,(size*3)/5);
              fill(0);
              textSize(16);
              textAlign(CENTER);
              text(labelFigure(label,figure.figureArray[row][column]),x+((9*size)/10)*figure.cellX+column*(9*size)/10+((size*6)/10),y+figure.cellY*size+row*size+size);
              noFill();
            }
          }
        }
      }
  }
  
  public void newFigure(){
     figure = new Polyform(configurations[(int) random(0,configurations.length)]);
     this.figure.cellX = board.nCellsX/2;
     if(label=="2048"){
       randomizeFigure();
     }
  }
  
  public void executeIfNotDropping(){
     if(label=="2048"){
       for(int i=0;i<3;i++){
         clearIdenticalAndApply(figure.cellX,figure.cellY+i,"2048",3);
         delay(25);
         dropByColumn();
       }
     }
  }
  
  public void setupPreviewBoard(int xPos,int yPos,int size,int nCellsX,int nCellsY){
    previewBoard = new HexagonalBoard(xPos,yPos,size,nCellsX,nCellsY,colorList,"none");
    previewBoard.configurations = configurations;
    previewBoard.newFigure();
  }
}
