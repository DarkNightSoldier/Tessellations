class PolyhexBoard extends Board{
  public PolyhexBoard(int nCellsX, int nCellsY){
    super(nCellsX,nCellsY);
  }
  
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
}
