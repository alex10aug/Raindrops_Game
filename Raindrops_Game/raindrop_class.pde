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
    a = new PVector(0, 0.01);
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
    //velocity does not go above 8
    v.limit(8);
  }

  void wrap(EndScreen es, Raindrops r) {
    if (l.y > height) {
      //if catcher misses raindrop, missedScore increases
      missedScore++;
      //every time a raindrop reaches the bottom, it goes back to top
      l.y = random(-height, 0);
      l.x = random(width);
    }
    //if missedScore is greater than 20, lives decreases
    if (missedScore >= 20) {
      lives--;
      missedScore = 0;
    }
    //if you run out of lives, game ends and endGame becomes true
    if (lives == 0) {
      es.display(r);
      play = false;
    }
    //displays missedScore and lives
    textSize(12.5);
    text("Misses", width/10, 3*height/20);
    text("Lives", width/2, 3*height/20);
    textSize(50);
    text(missedScore, width/10, height/10);
    text(lives, width/2, height/10);
  }

  void collect(Raindrops r, Catcher c, EndScreen es) {
    fill(255);
    //displays score
    textSize(12.5);
    text("Catches", 9*width/10, 3*height/20);
    textSize(50);
    text(score, 9*width/10, height/10);
    //if catcher catches raindrop, score increases
    if (dist(l.x, l.y, c.l.x, c.l.y) < raindrop.height/2 + 30) {
      score++;
      l.y = random(-height, 0);
      l.x = random(width);
    }
  }

  void stopDrops() {
    //moves raindrops outside screen when game ends
    l = new PVector(random(width), -height);
    v = new PVector(0, 0); 
    a = new PVector(0, 0);
  }

  void reset() {
    //restores initial conditions when game is reset
    l = new PVector(random(width), random(-height, 0));
    v = new PVector(0, 1);
    a = new PVector(0, 0.001);
  }
}
