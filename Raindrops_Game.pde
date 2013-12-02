Raindrops[] drops = new Raindrops[500];
Catcher c;

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
  for (int i = 0; i < drops.length; i++) {
    drops[i].show();
    drops[i].fall();
    drops[i].wrap();
    drops[i].collect(c);
  }
}

