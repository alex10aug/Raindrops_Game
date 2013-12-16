class Raindrops {
  PImage raindrop;
  PVector l;
  PVector v;
  PVector a;
  float scale;
  int d = 50;
  int missedScore = 0;

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
    //raindrops have location, velocity, and acceleration
    l.add(v);
    v.add(a);
  }

  void wrap() {
    //every time a raindrop reaches the bottom, it goes back to top
    if (l.y > height) {
      l.y = random(-height, 0);
      l.x = random(width);
    }
  }

  void collect(Catcher c) {
    text(score, 9*width/10, height/10);
    if (dist(l.x, l.y, c.l.x, c.l.y) < raindrop.height/2 + 30) {
      score++;
      l.y = random(-height, 0);
      l.x = random(width);
    }
  }

  void stopDrops() {
    l.y = random(-height, 0);
  }
}

