class catcher {
  int d;

  catcher() {
    d = width/20;
  }

  void showC() {
    fill(255);    
    ellipse(mouseX, width-100, d, d);
  }
}
