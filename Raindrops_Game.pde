Raindrops[] drops = new Raindrops[500];

void setup() {
  size(200, 1000);
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrops();
  }
}

void draw() {
  background(0);
  catcher.showC();
  for (int i = 0; i < drops.length; i++) {
    drops[i].show();
    drops[i].fall();
    drops[i].wrap();
  }
}
