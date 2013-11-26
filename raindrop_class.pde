class Raindrops {
  PImage raindrop;
  PVector l;
  PVector v;
  float scale;

  Raindrops() {
    scale = 0.1;
    raindrop = loadImage("waterdrop.jpg");
    l = new PVector(random(width), random(-height, 0));
    v = new PVector(0, random(0.005, 0, 01));
  }

  void show() {
    image(raindrop, l.x, l.y);
  }

  void fall() {
    l.add(v);
  }

  void wrap() {
    if (l.y > height) {
      l.y = random(-height, 0);
      l.x = random(width);
    }
  }
}
