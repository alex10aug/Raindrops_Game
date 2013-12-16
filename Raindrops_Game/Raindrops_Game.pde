Raindrops[] drops = new Raindrops[500];
Catcher c;
Timer t;
StartScreen ss;
EndScreen es;
Star s;
PImage lake;
//used for making raindrops fall at certain time intervals
int index = 1;
int score = 0;
int interval = 1000;
boolean play = false;
boolean endGame = false;

void setup() {
  lake = loadImage("lake.jpg");
  size(lake.width, lake.height);
  //initialize raindrops, catcher, and timer
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrops();
  }
  c = new Catcher();
  t = new Timer();
  s = new Star();
  ss = new StartScreen();
  es = new EndScreen();
}

void draw() {
  if (!play) {
    background(0);
    ss.display();
  }
  else {
    background(lake);
    //show catcher
    c.show();
    //every time millis() - oldTime >= interval, index increases
    if (t.track(1000)) {
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
    s.show();
    s.fall();
    s.collect(c);
    text(score, 9*width/10, height/10);
  }
  println(millis());
}

void endGame(Raindrops r, Catcher c, Star s, EndScreen es) {
  r.l.y = 2*height;
  c.l.y = 2*height;
  s.l.y = 2*height;
  es.display();
}

void mousePressed() {
  if (mouseX > width/4 && mouseX < 3*width/4 && mouseY > height/4 && mouseY < 3*height/4) {
    play = true;
  }
}

