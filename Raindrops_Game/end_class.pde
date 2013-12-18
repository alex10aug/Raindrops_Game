class EndScreen {
  Raindrops r;
  Catcher c;
  Star s;
  EndScreen es;
  
  EndScreen() {
    r = new Raindrops();
    c = new Catcher();
    s = new Star();
    es = new EndScreen();
  }

  void endGame(Raindrops r, Catcher c, Star s, EndScreen es) {
    r.l.y = 2*height;
    c.l.y = 2*height;
    s.l.y = 2*height;
    es.display();
  }

  void display() {
    background(mouseX, 100, 100);
    endGame(r, c, s, es);
    textAlign(CENTER, CENTER);
    textSize(100);
    text("GAME OVER!"+"n/"+"SCORE = "+score, width/2, height/3);
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(width/2, 5*height/6, width/2, height/3);
    text("TRY AGAIN?", width/2, 5*height/6);
  }
}

