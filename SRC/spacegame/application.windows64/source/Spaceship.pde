class Spaceship {
  int x, y, hp, ammo, r, g, b, lives;
  char displayMode;
  color c1;

  Spaceship(color c) {
    x = 0;
    y = 0;
    hp = 100;
    ammo = 90;
    lives = 5;
    displayMode = '1';
    this.c1 = c1;
  }
  void display(int x, int y) {
    if (displayMode == '1') {
      this.x =x;
      this.y = y;
      fill(255);
      quad(x, y-75, x+25, y+25, x, y, x-25, y+25);
      r = int(random(3));
      g = int(random(3));
      b = int(random(3));
      if (r == 1) {
        fill(255, 0, 0);
        quad(x-25, y+25, x, y, x-12.5, y+25, x-25, y+37.5);
      } else if (r == 0) {
        fill(0, 255, 0);
        quad(x-25, y+25, x, y, x-12.5, y+25, x-25, y+37.5);
      } else if (r == 2) {
        fill(0, 0, 255);
        quad(x-25, y+25, x, y, x-12.5, y+25, x-25, y+37.5);
      }
      if (g == 1) {
        fill(255, 0, 0);
        quad(x+25, y+25, x, y, x+12.5, y+25, x+25, y+37.5);
      } else if (g == 0) {
        fill(0, 255, 0);
        quad(x+25, y+25, x, y, x+12.5, y+25, x+25, y+37.5);
      } else if (g == 2) {
        fill(0, 0, 255);
        quad(x+25, y+25, x, y, x+12.5, y+25, x+25, y+37.5);
      }
      if (b == 1) {
        fill(255, 0, 0);
        quad(x, y-67.5, x+12.5, y+12.5, x, y-12.5, x-12.5, y+12.5);
      } else if (b == 0) {
        fill(0, 255, 0);
        quad(x, y-67.5, x+12.5, y+12.5, x, y-12.5, x-12.5, y+12.5);
      } else if (b == 2) {
        fill(0, 0, 255);
        quad(x, y-67.5, x+12.5, y+12.5, x, y-12.5, x-12.5, y+12.5);
      }
    }
  }
}
