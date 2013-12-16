class Timer {
  int oldTime;

  Timer() {
    oldTime = 0;
  }

  boolean track(int interval) {
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

