//Function to draw hexagons
void hexagon(int x, int y, int radius){
        float sx=x+cos(5*PI/3)*radius;
        float sy=y;
        beginShape();
        vertex(sx,sy);
        for(float a=0; a<5*PI/3; a+=(TWO_PI/6)){
            sx = sx+ cos(a)*radius;
            sy = sy+ sin(a)*radius;
            vertex(sx,sy);
        }
        endShape(CLOSE);
}

void launchScoreBoard() {
  loadMM();
  fill(204);
  text("Game", 50,50);
  text("Highscore", 250,50);
  text("Square2048", 50,100);
  text("HexLine2048", 50,150);
  text("Tetris Classic", 50,200);
  text("SpaceTris", 50,250);
  text("Tetris2048", 50,300);
  text("SameGame", 50,350);
  rect(510, 565, 120, 50);
  text(highscores[0], 250,100);
  text(highscores[1], 250,150);
  text(highscores[2], 250,200);
  text(highscores[3], 250,250);
  text(highscores[4], 250,300);
  text(highscores[5], 250,350);
  rect(510, 565, 120, 50);
  fill(0);
  textSize(30);
  text("Back", 540, 600);
  if (mouseButton == LEFT) {
    if (CheckInside(mouseX, mouseY, 510, 565, 120, 50)) {
      if (mode != 7) {
      highscores[mode-1] = board.score;
      }
      delay(100);
      mode = 0;
    }
  }
}
