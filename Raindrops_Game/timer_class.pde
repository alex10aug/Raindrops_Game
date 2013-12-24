class Timer {
  int oldTime = 0;

  Timer() {
  }

  boolean track(int interval) {
    //every time millis() - oldTime > interval, left side resets to zero
    if (millis() - oldTime > interval) {
      oldTime = millis();
      return true;
    }
    else {
      return false;
    }
  }
}
