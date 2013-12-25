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
    l = new PVector(random(width/4, 3*width/4), 0);
    v = new PVector(random(-1, 1), random(10, 20));
    a = new PVector(0, 1);
  }

  void show() {
    image(rainbowstar, l.x, l.y);
  }

  void fall() {
    //star has location, velocity, and acceleration
    l.add(v);
    v.add(a);
  }

  void avoid(Catcher c) {
    //when star gets close to catcher, it tries to avoid getting caught
    if (dist(l.x, l.y, c.l.x, c.l.y) < rainbowstar.height/2 + 80) {
      if (!catchStar()) {
        if (l.x > c.l.x) {
          a.x = 10;
        }
        if (l.x < c.l.x) {
          a.x = -10;
        }
      }
    }
  }

  void collect(Raindrops r, Catcher c, EndScreen es) {
    //if catcher catches star, game ends and the star's end screen displays
    if (dist(l.x, l.y, c.l.x, c.l.y) < rainbowstar.height/2 + 30) {
      es.star(r, s);
      play = false;
    }
  }

  boolean catchStar() {
    //checks if catcher catches the star
    if (dist(l.x, l.y, c.l.x, c.l.y) < rainbowstar.height/2 + 30) {
      return true;
    }
    else {
      return false;
    }
  }

  void reset() {    
    //restores initial conditions when game is reset
    l = new PVector(random(width), 0);
    v = new PVector(random(-1, 1), random(10, 20));
    a = new PVector(0, -.01);
  }
}
