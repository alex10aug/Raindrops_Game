class Catcher {
  PImage hands;
  int d;
  PVector l;
  float scale;

  Catcher() {
    scale = 0.2;
    hands = loadImage("hands.png");
    hands.resize(int(scale*hands.width), int(scale*hands.height));
    d = width/20;
    l = new PVector(mouseX, 8.5*height/10);
  }

  void show() {
    fill(255);
    l.x = mouseX;    
    image(hands, l.x, l.y);
  }
}

