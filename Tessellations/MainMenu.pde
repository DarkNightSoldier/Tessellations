void mainMenu() {
  if (mode == 0) {
    loadBG();
    fill(255);
    textSize(72);
    textAlign(CENTER);
    text("Tessellations", w/2,100);
    textSize(42);
    text("Select Mode", 330, 160);
    fill(204);
    textAlign(LEFT);
    rect(50, 220, 250, 100);
    rect(350, 220, 250, 100);
    rect(50, 330, 250, 100);
    rect(50, 440, 250, 100);
    rect(350, 330, 250, 100);
    rect(350, 440, 250, 100);
    fill(0);
    textSize(30);
    text("Space Tris", 80, 270);
    text("SameGame", 390, 270);
    text("Classic tetris", 80, 390);
    text("Square 2048", 80, 500);
    text("HexLine 2048", 380, 390);
    text("Tetris 2048", 390, 500);
    if (mouseButton == LEFT) {
      if ((mouseX - 50 <= 250) && (50 - mouseX <= 0)) {
        if ((330 - mouseY <= 0)&&(mouseY - 330 <= 100)) {
          delay(500);
          setupTetrisClassic();
          mode = 1;
        } else if ((440 - mouseY <= 0)&&(mouseY - 440 <= 100)) {
          delay(500);
          setupSame();
          mode = 2;
        }
      } else if ((mouseX - 350 <= 325) && (350 - mouseX <= 0)) {
        if ((330 - mouseY <= 0)&&(mouseY - 330 <= 100)) {
          delay(500);
          setupSpaceTris();
          mode = 3;
        } else if ((480 - mouseY <= 0)&&(mouseY - 480 <= 100)) {
          delay(500);
          setupTetris2048();
          mode = 4;
        }
      }
    }
  }else{
    setUI(640,640);
    if(stateGame){
      loadBG();
      if (mode == 1) {
        launchTetrisClassic();
        setUI(640,640);
      }else if (mode == 2) {
        launchSame();
        setUI(640,640);
      }else if (mode == 3) {
        launchSpaceTris();
        setUI(640,640);
      }else if (mode == 4) {
        launchTetris2048();
        setUI(640,640);
      }else if (mode==5){
        launchSpaceTris();
      }
    }
  }
}

void loadBG() {
  img = loadImage("background.jpg");
  image(img, 0, 0);
}

void setUI(int xres, int yres) {
  surface.setSize(xres, yres);
  fill(204);
  rect(xres-120, yres-75, 100, 50);
  fill(0);
  textSize(30);
  text("Back", xres-70, yres-40);
  if (mouseButton == LEFT) {
    if ((mouseX >= xres-120) && (xres - mouseX >= 20) && (mouseY >= yres-75) && (yres - mouseY >= 25)) {
      delay(100);
      mode = 0;
    }
  }
}
