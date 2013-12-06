class Timer {
  int currentTime;
  int oldTime;
  int interval;

  Timer() {
    currentTime = millis();
    oldTime = 0;
    interval = 1000;
  }

  boolean check() {
    if (currentTime - oldTime >= interval) {
      oldTime = currentTime;
      return true;
    }
    else {
      return false;
    }
  }
}
