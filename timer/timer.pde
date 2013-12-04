int currentTime = 0;
int oldTime = 0;
int d;
int c;
PVector l;
PVector v;

void setup() {
  size(800, 600);
  d = width/10;
  l = new PVector(random(width), random(height));
  v = new PVector(0, 0);
}

void draw() {
  currentTime = millis();
  background(c);
  fill(255, 0, 0);
  ellipse(l.x, l.y, d, d);
  l.add(v);
  if (l.x > width - d/2 || l.x < d/2) {
    v.x = -v.x;
  }
  if (l.y > height - d/2 || l.y < d/2) {
    v.y = -v.y;
  }
  if (currentTime - oldTime >= 1000) {
    v = new PVector(random(-100, 100), random(-100, 100));
    c = color(random(255));
    oldTime = currentTime;
  }
}

void mousePressed() {
  v = new PVector(0, 0);
}

