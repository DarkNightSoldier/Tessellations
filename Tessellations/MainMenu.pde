void mainMenu() {
  if (mode == 0) {
    loadBG();
    fill(255);
    textSize(72);
    textAlign(CENTER);
    text("Tessellations", w/2, 100);
    textSize(42);
    text("Select Mode", 330, 160);
    fill(204);
    textAlign(LEFT);
    rect(100, 245, 200, 75);
    rect(310, 245, 200, 75);
    rect(20, 330, 185, 75);
    rect(215, 330, 190, 75);
    rect(415, 330, 190, 75);
    rect(210, 415, 200, 75);
    rect(235, 540, 150, 55);
    fill(0);
    textSize(30);
    text("Square 2048", 120, 290);
    text("HexLine 2048", 325, 290);
    text("Classic tetris", 35, 380);
    text("Space Tris", 250, 380);
    text("Tetris 2048", 445, 380);
    text("SameGame", 240, 460);
    textSize(25);
    text("Scoreboard", 255, 575);
    if (mouseButton == LEFT) {
      if ((245 <= mouseY ) && (mouseY - 245<= 75)) {
        if ((100 <= mouseX)&&(mouseX -100 <= 200)) {
          delay(500);
          setup2048SQ();
          mode = 1;
        } else if ((310 <= mouseX)&&(mouseX -310 <= 200)) {
          delay(500);
          setupHexLine2048();
          mode = 2;
        }
      } else if ((330 <= mouseY ) && (mouseY - 330<= 75)) {
        if ((20 <= mouseX)&&(mouseX -20 <= 185)) {
          delay(500);
          setupTetrisClassic();
          mode = 3;
        } else if ((215 <= mouseX)&&(mouseX -215 <= 190)) {
          delay(500);
          setupSpaceTris();
          mode = 4;
        } else if ((415 <= mouseX)&&(mouseX -415 <= 190)) {
          delay(500);
          setupTetris2048();
          mode = 5;
        }
      } else if ((415 <= mouseY ) && (mouseY - 415<= 75)) {
        if ((210 <= mouseX)&&(mouseX -210 <= 200)) {
          delay(500);
          setupSame();
          mode = 6;
        }
      } else if ((540 <= mouseY ) && (mouseY - 540<= 45)) {
        if ((235 <= mouseX)&&(mouseX -235 <= 150)) {
          delay(500);
          //Poner aquí el setup de la tabla de puntuaciones (Si es necesario, de lo contrario, borrar esta linea)
          mode = 7;
        }
      }
    }
  } else {
    setUI(640, 640);
    if (stateGame) {
      loadBG();
      if (mode == 1) {
        launch2048SQ();
        setUI(640, 640);
      } else if (mode == 2) {
        launchHexLine2048();
        setUI(640, 640);
      } else if (mode == 3) {
        launchTetrisClassic();
        setUI(640, 640);
      } else if (mode == 4) {
        launchSpaceTris();
        setUIaux(640, 640);
      } else if (mode==5) {
        launchTetris2048();
        setUI(640, 640);
      } else if (mode==6) {
        launchSame();
        setUI(640, 640);
      } else if (mode==7) {
        //Funcion launch del scoreboard
        setUI(640, 640);
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
  rect(xres-130, yres-75, 120, 50);
  fill(0);
  textSize(30);
  text("Back", xres-70, yres-40);
  if (mouseButton == LEFT) {
    if ((mouseX >= xres-130) && (xres - mouseX >= 10) && (mouseY >= yres-75) && (yres - mouseY >= 25)) {
      delay(100);
      mode = 0;
    }
  }
}

void setUIaux(int xres, int yres) {
  fill(204);
  rect(500, 600, 140, 50);
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
