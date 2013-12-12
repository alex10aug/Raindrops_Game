Raindrops[] drops = new Raindrops[500];
Catcher c;
Timer t;
PImage lake;
//used for making raindrops fall at certain time intervals
int index = 1;
int score = 0;
int interval = 1000;
boolean play = false;
boolean endGame = false;

void setup() {
  lake = loadImage("lake.jpg");
  //  size(lake.width, lake.height);
  size(800, 800);
  //initialize raindrops, catcher, and timer
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Raindrops();
  }
  c = new Catcher();
  t = new Timer();
}

void draw() {
  if (!play) {
    background(0);
    fill(0, 255, 0);
    rectMode(CENTER);
    rect(width/2, height/2, width/2, height/2);
    stroke(255);
    textAlign(CENTER, CENTER);
    text("START", width/2, height/2);
  }
  else {
    background(255, 0, 0);
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
  }
  if (endGame()) {
    background(mouseX, 100, 100);
    for (int i = 0; i < index; i++) {
      drops[i].stopDrops();
    }
    textAlign(CENTER, CENTER);
    textSize(200);
    text("GAME OVER!"+"n/"+score, width/2, height/2);
  }
  println(millis());
}

boolean endGame() {
  if (millis() == 5000) {
    return true;
  }
  else {
    return false;
  }
}

void mousePressed() {
  if (mouseX > width/4 && mouseX < 3*width/4 && mouseY > height/4 && mouseY < 3*height/4) {
    play = true;
  }
}

