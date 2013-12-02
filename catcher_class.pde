class Catcher {
  PVector l;
  int d;

  Catcher() {
    d = width/20;
    l = new PVector(mouseX, height - d);
  }

  void show() {
    fill(255);    
    ellipse(l.x, l.y, d, d);
  }
}
