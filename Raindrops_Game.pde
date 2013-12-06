Raindrops[] drops = new Raindrops[500];
Catcher c;
int score;
int oldTime = 0;
int index = 1;
int interval = 1000;

void setup() {
  size(600, 800);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrops();
  }
  c = new Catcher();
}

void draw() {
  background(0);
  c.show();
  if (millis() - oldTime >= interval) {
    index++;
    oldTime = millis();
  }
  for (int i = 0; i < index; i++) {
    drops[i].show();
    drops[i].fall();
    drops[i].wrap();
    drops[i].collectAndScore(c, 0);
//    keepScore(drops[i], c);
  }
}

//void keepScore(Raindrops r, Catcher c) {
//  score = 0;
//  text(score, 9*width/10, height/10);
//  if (dist(r.l.x, r.l.y, c.l.x, c.l.y) < 31.455) {
//    r.l.y = random(-height, 0);
//    r.l.x = random(width);
//    score++;
//  }
//}

