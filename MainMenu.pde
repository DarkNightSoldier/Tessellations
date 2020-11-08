void MainMenu() {
  loadBG();
  if (mode == 0) {
    surface.setSize(900, 650);
    fill(255);
    textSize(72);
    text("Tessellations", 250, 130);
    textSize(42);
    text("Select Mode", 330, 230);
    fill(204);
    rect(90, 330, 325, 100);
    rect(90, 480, 325, 100);
    rect(490, 330, 325, 100);
    rect(490, 480, 325, 100);
    fill(0);
    textSize(38);
    text("Classic tetris", 135, 390);
    text("Classic 2048", 135, 540);
    text("Hexagonal 2048", 505, 390);
    text("Tetris 2048", 535, 540);
    if (mouseButton == LEFT) {
      if ((mouseX - 90 <= 325) && (90 - mouseX <= 0)) {
        if ((330 - mouseY <= 0)&&(mouseY - 330 <= 100)) {
          delay(500);
          setupTetrisClassic();
          mode = 1;
        } else if ((480 - mouseY <= 0)&&(mouseY - 480 <= 100)) {
          delay(500);
          setup2048SQ();
          mode = 2;
        }
      } else if ((mouseX - 490 <= 325) && (490 - mouseX <= 0)) {
        if ((330 - mouseY <= 0)&&(mouseY - 330 <= 100)) {
          delay(500);
          setupHexLine2048();
          mode = 3;
        } else if ((480 - mouseY <= 0)&&(mouseY - 480 <= 100)) {
          delay(500);
          setupTetris2048();
          mode = 4;
        }
      }
    }
  } else if (mode == 1) {
    surface.setSize(700, 650);
    launchTetrisClassic();
  } else if (mode == 2) {
    surface.setSize(600, 350);
    launch2048SQ();
  }else if(mode == 3) {
    surface.setSize(450, 650);
    launchHexLine2048();
  } else if (mode == 4) {
    surface.setSize(520, 650);
    launchTetris2048();
  }
}

void loadBG() {
  img = loadImage("background.jpg");
  image(img, 0, 0);
}
