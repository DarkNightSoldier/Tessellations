class Board{
    protected String type;
    protected int cellX;
    protected int cellY;
    protected byte[][] matrixBoard;

    public Board(String type, int cellX, int cellY){
        this.type = type;
        this.cellX = cellX;
        this.cellY = cellY;
        initializeBoard();
    }

    private void initializeBoard(){
        byte[][] matrixBoard = new byte[cellY][cellX];
    }

    public void drawBoard(){
      fill(255);
      rect(0,0,900,650);
      noFill();
        for(int i=0;i<=cellY;i++){
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
