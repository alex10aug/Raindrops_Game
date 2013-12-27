//declares all necessary variables and image
Raindrops[] drops = new Raindrops[500];
Catcher c;
EndScreen es;
Timer t;
Star s;
StartScreen ss;
PImage lake;
//used for making raindrops fall at certain time intervals
int index = 1;
//used for displaying start screen
boolean start = true;
//checks to see if the game is playing
boolean play = false;
//keeps track of catches, misses, and lives
int score = 0;
int missedScore = 0;
int lives = 3;

void setup() {
  //loads image of lake
  lake = loadImage("lake.jpg");
  //equates size of display with the size of the lake image
  size(lake.width, lake.height);
  //initialize raindrops, catcher, timer, star, start screen, and end screen
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
  if (start) {
    //start screen displays
    ss.display();
  }
  if (play) {
    start = false;
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
      drops[i].wrap(es, drops[i]);
      //catcher catches raindrops and increases score every time
      drops[i].collect(drops[i], c, es);
      //ends game if lives = 0
      drops[i].endGame(es, drops[i]);
    }
    //sets star's properties
    s.show();
    s.fall();
    for (int i = 0; i < index; i++) {
      s.collect(drops[i], c, es);
    }
    s.avoid(c);
  }
}

void mousePressed() {
  //when mouse is pressed, game is reset
  play = true;
  t.oldTime = millis();
  for (int i = 0; i < index; i++) {
    drops[i].reset();
    drops[i].fall();
    drops[i].endGame(es, drops[i]);
  }
  s.reset();
  s.fall();
  for (int i = 0; i < index; i++) {
    s.collect(drops[i], c, es);
  }
  s.avoid(c);
  index = 1;
  score = 0;
  missedScore = 0;
  lives = 3;
}
