class PewPew {
  int x, y, speed;
  char displayMode;
  color c1;
  boolean reachedTop;

  PewPew(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 10;
    displayMode = '1';
    this.c1 = c1;
  }

  void fire() {
    y -= speed;
  }
  boolean reachedTop() {
    if (y < -30) {
      return true;
    } else {
      return false;
    }
  }
  void display() {
    if (displayMode == '1') {
      //ENEMY CHASER
      fill (255, 0, 0);
      rect(x, y, 5, 25);
    }
  }
  void drive() {
    y -= speed;
    if (y > -30) {
      y = mouseY - 75;
      println("1");
      println("2");
      println("3");
    }
  }
}
