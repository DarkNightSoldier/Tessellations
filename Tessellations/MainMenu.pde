void mainMenu() {
  if (mode == 0) {
    loadMM();
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
      if (CheckInside(mouseX, mouseY, 100, 245, 200, 75)) {
        delay(500);
        setup2048SQ();
        mode = 1;
      } else if (CheckInside(mouseX, mouseY, 310, 245, 200, 75)) {
        delay(500);
        setupHexLine2048();
        mode = 2;
      } else if (CheckInside(mouseX, mouseY, 20, 330, 185, 75)) {
        delay(500);
        setupTetrisClassic();
        mode = 3;
      } else if (CheckInside(mouseX, mouseY, 215, 330, 190, 75)) {
        delay(500);
        setupSpaceTris();
        mode = 4;
      } else if (CheckInside(mouseX, mouseY, 415, 330, 190, 75)) {
        delay(500);
        setupTetris2048();
        mode = 5;
      } else if (CheckInside(mouseX, mouseY, 210, 415, 200, 75)) {
        delay(500);
        setupSame();
        mode = 6;
      } else if (CheckInside(mouseX, mouseY, 235, 540, 150, 55)) {
        delay(500);
        mode = 7;
      }
    }
  } else {
    setUI(640, 640);
    if (stateGame) {
      loadMM();
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
        fill(255);
        rect(500, 600, 140, 50);
        setUIaux(640, 640);
      } else if (mode==5) {
        launchTetris2048();
        setUI(640, 640);
      } else if (mode==6) {
        launchSame();
        setUI(640, 640);
      } else if (mode==7) {
        launchScoreBoard();
      }
    }
  }
}

void loadMM() {
  img = loadImage("background.jpg");
  image(img, 0, 0);
  if (file.isPlaying()) {
    mutebutton = loadImage("unmute.png");
    image(mutebutton, 550, 10, 50, 50);
  } else {
    mutebutton = loadImage("mute.png");
    image(mutebutton, 550, 10, 50, 50);
  }
}

void setUI(int xres, int yres) {
  surface.setSize(xres, yres);
  fill(204);
  rect(xres-130, yres-75, 120, 50);
  fill(0);
  textSize(30);
  text("Back", xres-70, yres-40);
  if (mouseButton == LEFT) {
    if (CheckInside(mouseX, mouseY, xres-130, yres-75, 120, 50)) {
      if (mode != 7) {
      highscores[mode-1] = board.score;
      }
      delay(100);
      mode = 0;
    }
  }
}

void setUIaux(int xres, int yres) {
  fill(204);
  rect(xres-130, yres-75, 120, 50);
  fill(0);
  textSize(30);
  text("Back", xres-70, yres-40);
  if (mouseButton == LEFT) {
    if (CheckInside(mouseX, mouseY, xres-130, yres-75, 120, 50)) {
      if (mode != 7) {
      highscores[mode-1] = board.score;
      }
      delay(100);
      mode = 0;
    }
  }
}

//Check if a pont (px,py) is inside a rectangle
//CornerX,CornerY (top left corner) and WiDHT and HeiGHT
boolean CheckInside(float px, float py, float cx, float cy, float whdt, float hght) {
  if ((cx <= px) && (px <= cx + whdt) && (cy <= py ) && (py<= cy + hght)) {
    return true;
  } else {
    return false;
  }
}

void DisplayScore(int xpos,int ypos) {
  fill(255);
  textSize(40);
  text("Score", xpos, ypos);
  text(board.score, xpos, ypos + 50);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (CheckInside(mouseX, mouseY, 550, 10, 50, 50) && file.isPlaying()) {
      file.pause();
    } else if (CheckInside(mouseX, mouseY, 550, 10, 50, 50) && !file.isPlaying()) {
      file.play();
    }
  }
}
