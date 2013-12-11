class Timer {
  int oldTime;
  int interval;

  Timer() {
    oldTime = 0;
    interval = 1000;
  }

  boolean track() {
    //every time millis() - oldTime >= interval, left side resets to zero
    if (millis() - oldTime >= interval) {
      oldTime = millis();
      return true;
    }
    else {
      return false;
    }
  }
}

