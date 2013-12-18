class EndScreen {
  EndScreen() {
  }

  void display() {
    background(mouseX, 100, 100);
    textAlign(CENTER, CENTER);
    textSize(100);
    text("GAME OVER!"+"n/"+"SCORE = "+score, width/2, height/3);
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(width/2, 5*height/6, width/2, height/3);
    text("TRY AGAIN?", width/2, 5*height/6);
  }
}

