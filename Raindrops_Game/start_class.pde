class StartScreen {
  StartScreen() {
  }

  void display() {
    colorMode(RGB, 255, 255, 255);
    //displays start screen
    background(0, 255, 0);
    fill(255);    
    textAlign(CENTER, CENTER);
    textSize(100);
    text("START", width/2, height/2);
  }
}
