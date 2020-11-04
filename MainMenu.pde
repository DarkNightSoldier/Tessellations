void MainMenu() {
  if (mode == 0) {
    fill(0);
    rect(0, 0, 900, 650);
    fill(255);
    textSize(72);
    text("Tetris 2048", 250, 130);
    textSize(42);
    text("Select Mode", 330, 230);
    fill(204);
    rect(290, 330, 325, 100);
    fill(204);
    rect(290, 480, 325, 100);
    fill(0);
    textSize(38);
    text("Squares", 375, 390);
    text("Hexagons", 375, 540);
    if (mousePressed) {
      if ((mouseX - 290 <= 325) && (290 - mouseX <= 0)) {
        if ((330 - mouseY <= 0)&&(mouseY - 330 <= 100)) {
          delay(500);
          println(mode);
          mode = 1;
        } else if ((480 - mouseY <= 0)&&(mouseY - 480 <= 100)) {
          mode = 2;
        }
      }
    }
  } else if (mode == 1) {
    background(0);
    launch2048SQ();
  } else if (mode == 2) {
  }
}
