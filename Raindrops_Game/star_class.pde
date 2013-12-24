class Star {
  PImage rainbowstar;
  PVector l;
  PVector v;
  PVector a;
  float scale;

  Star() {
    scale = 0.05;
    rainbowstar = loadImage("rainbowstar.png");
    rainbowstar.resize(int(rainbowstar.width*scale), int(rainbowstar.height*scale));
    l = new PVector(random(width), 0);
    v = new PVector(random(-1, 1), random(10, 20));
    a = new PVector(0, -.01);
  }

  void show() {
    image(rainbowstar, l.x, l.y);
  }

  void fall() {
    l.add(v);
    v.add(a);
  }
  
  void collect(Catcher c, EndScreen es) {
    if (dist(l.x, l.y, c.l.x, c.l.y) < rainbowstar.height/2 + 30) {
      background(mouseX, 100, 100);
      es.display();
    }
  }
}
