class Catcher {
  PImage hands;
  PVector l;
  float scale;

  Catcher() {
    scale = 0.2;
    hands = loadImage("hands.png");
    hands.resize(int(scale*hands.width), int(scale*hands.height));
    l = new PVector(mouseX, 8.5*height/10);
  }

  void show() {
    colorMode(HSB, width, 100, 100);
    //catcher can only move horizontally
    fill(mouseX, 100, 100);
    l.x = mouseX;
    imageMode(CENTER);    
    image(hands, l.x, l.y);
  }
}
