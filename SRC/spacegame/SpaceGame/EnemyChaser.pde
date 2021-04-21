class EnemyChaser {
  int x, y, hp, r, g, b;
  char displayMode;
  color c1;

  EnemyChaser(color c) {
    x = 0;
    y = 0;
    hp = 100;
    displayMode = '1';
    this.c1 = c1;
  }
  boolean reachedBottom() {
    if (y > height+30) {
      return true;
    } else {
      return false;
    }
  }
  void display(int x, int y) {
    if (displayMode == '1') {
      //ENEMY CHASER
    }
  }
}
