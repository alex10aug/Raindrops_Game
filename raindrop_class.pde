class Raindrops {
  PImage raindrop;
  PVector l;
  PVector v;
  PVector a;
  float scale;

  Raindrops() {
    scale = 0.1;
    raindrop = loadImage("waterdrop.png");
    raindrop.resize(int(scale*raindrop.width), int(scale*raindrop.height));
    l = new PVector(random(width), random(-height, 0));
    v = new PVector(0, 1);
    a = new PVector(0, 0.001);
    textAlign(CENTER, CENTER);
    textSize(100);
  }

  void show() {
    image(raindrop, l.x, l.y);
  }

  void fall() {
    l.add(v);
    v.add(a);
  }

  void wrap() {
    if (l.y > height) {
      l.y = random(-height, 0);
      l.x = random(width);
    }
  }

  void collectAndScore(Catcher c, int score) {
    text(score, 9*width/10, height/10);
    if (dist(l.x, l.y, c.l.x, c.l.y) < raindrop.height/2 + 30) {
      l.y = random(-height, 0);
      l.x = random(width);
      score++;
    }
  }
}

