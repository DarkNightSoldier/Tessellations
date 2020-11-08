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

void settings(){
  size(640,640); 
}

void setup(){
}

void draw(){
  frameRate(frameRate);
  if(stateGame){
    MainMenu();
  }
}
