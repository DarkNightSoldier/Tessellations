Board board;
Board previewBoard;
int y;
int x=216;
int type = 2;
int rotation = 2;
int frameRate = 16;
color [] colorList = {#B9FFF0,#B9FFF0,#FFCA00,#A5FF00,#FF0D00,#6384FF,#F9FF35,#B279FF};
String[] infoScores = {"","","",""};
int[] scores = new int[3];
PImage img;
boolean stateGame = true;
int mode;
boolean alreadySetup = false;

void settings(){
  size(640,640); 
}

void setup(){
  img = loadImage("background.jpg");
  image(img, 0, 0);
}

void draw(){
  frameRate(frameRate);
  if(stateGame){
    launchTetrisClassic();
  }
}

/** void draw(){
  frameRate(frameRate);
  if(!buttonClicked){
   //MostrarMenú
  }
  else{
    if(!alreadySetup){
      switch(mode){
        case 1:
          setupTetrisClassic();
          break;
        case 2:
          setup2048SQ();
          break;
        case 3:
          setupHexLine2048();
          break;
      }else{
       switch(mode){
        case 1:
          launchTetrisClassic();
          break;
        case 2:
          launch2048SQ();
          break;
        case 3:
          launch2048HexLine();
          break;
      }
    }
  }
}
**/
