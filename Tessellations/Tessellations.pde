Board board;
Board previewBoard;
int y;
int x=216;
int w = 640, h=640;
int type = 2;
int rotation = 2;
int frameRate = 60;
color [] colorList = {#B9FFF0, #B9FFF0, #FFCA00, #A5FF00, #FF0D00, #6384FF, #F9FF35, #B279FF};
PImage img, mutebutton, unmutebutton;
PFont acme;
boolean stateGame = true;
int mode;
int[] highscores = {0,0,0,0,0,0};


void settings() {
  size(w, h);
}

void setup() {
  acme = createFont("Acme.ttf", 50);
  textFont(acme);
  loadBG();
}

void draw() {
  frameRate(frameRate);
  mainMenu();
}
