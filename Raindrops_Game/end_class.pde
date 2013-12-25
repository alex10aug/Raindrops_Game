class EndScreen {
  boolean endGame = false;
  boolean star = false;

  EndScreen() {
    //changes colorMode to RGB
    colorMode(RGB, 255, 255, 255);
  }

  void display(Raindrops r) {
    //displays regular end screen
    r.stopDrops();
    background(255, 0, 0);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(100);
    text("GAME OVER!"+"\n"+"SCORE = "+score, width/2, height/4);
    rectMode(CENTER);
    rect(width/2, 2*height/3, width, 3*height/10);
    fill(255, 0, 0);
    text("TRY AGAIN?", width/2, 2*height/3);
  }

  void star(Raindrops r, Star s) {
    //displays star's end screen
    r.stopDrops();
    background(0, 0, 255);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(100);
    text("YOU WIN!!!", width/2, height/3);
    rectMode(CENTER);
    rect(width/2, 2*height/3, width, height/3);
    fill(0, 0, 255);
    text("TRY AGAIN?", width/2, 2*height/3);
  }
}
