class StartScreen {
  StartScreen() {
  }
  
  void display() {    
    fill(0, 255, 0);
    rectMode(CENTER);
    rect(width/2, height/2, width/2, height/2);
    fill(255);    
    textAlign(CENTER, CENTER);
    textSize(100);
    text("START!", width/2, height/2);
  }
}

