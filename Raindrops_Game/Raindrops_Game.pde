Raindrops[] drops = new Raindrops[500];
Catcher c;
Timer t;
PImage lake;
//used for making raindrops fall at certain time intervals
int index = 1;
int score = 0;
int interval = 1000;

void setup() {
  lake = loadImage("lake.jpg");
  size(lake.width, lake.height);
  //initialize raindrops, catcher, and timer
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrops();
  }
  c = new Catcher();
  t = new Timer();
}

void draw() {
  colorMode(HSB, width, 100, 100);
  background(lake);
  //display catcher
  c.show();
  //every time millis() - oldTime >= interval, index increases
  if (t.track()) {
    index++;
  }
  for (int i = 0; i < index; i++) {
    //display raindrops
    drops[i].show();
    //makes raindrops fall
    drops[i].fall();
    //every time a raindrop reaches the bottom, it goes back to top
    drops[i].wrap();
    //catcher catches raindrops and increases score every time
    drops[i].collect(c);
  }
  text(score, 9*width/10, height/10);
  println(millis());
}

void endGame() {
  if (millis() == 5000) {
    background(mouseX, 100, 100);
    for (int i = 0; i < index; i++) {
      drops[i].stopDrops();
    }
    textAlign(CENTER, CENTER);
    textSize(200);
    text("GAME OVER!"+"n/"+score, width/2, height/2);
  }
}
