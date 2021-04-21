class Spaceship {
  int x, y, hp, ammo, r, g, b, lives;
  char displayMode;
  color c1;

  Spaceship(color c) {
    x = mouseX;
    y = mouseY;
    hp = 100;
    ammo = 90;
    lives = 5;
    displayMode = '1';
    this.c1 = c1;
  }
  void keyboard() {
    if (keyPressed) {
      if (key == 'W' || key == 'w') {
        y -= 10;
      }
      if (key == 'A' || key == 'a') {
        x -= 10;
      }
      if (key == 'S' || key == 's') {
        y += 10;
      }
      if (key == 'D' || key == 'd') {
        x += 10;
      }
    }
  }
  //void edgeDetect() {
  //  if (y < 540) {
  //    y = 540;
  //  } else if (y > 540){
  //    y = mouseY;
  //  }
  //  x = mouseX;
  //}
  void display() {
    if (displayMode == '1') {
      x = mouseX;
      y = mouseY;
      this.x =x;
      this.y = y;
      fill(255);
      quad(x, y-37.5, x+12.5, y+12.5, x, y, x-12.5, y+12.5);
      r = int(random(3));
      g = int(random(3));
      b = int(random(3));
      if (r == 1) {
        fill(255, 0, 0);
        quad(x-12.5, y+12.5, x, y, x-6.25, y+12.5, x-12.5, y+18.75);
      } else if (r == 0) {
        fill(0, 255, 0);
        quad(x-12.5, y+12.5, x, y, x-6.25, y+12.5, x-12.5, y+18.75);
      } else if (r == 2) {
        fill(0, 0, 255);
        quad(x-12.5, y+12.5, x, y, x-6.25, y+12.5, x-12.5, y+18.75);
      }
      if (g == 1) {
        fill(255, 0, 0);
        quad(x+12.5, y+12.5, x, y, x+6.25, y+12.5, x+12.5, y+18.75);
      } else if (g == 0) {
        fill(0, 255, 0);
        quad(x+12.5, y+12.5, x, y, x+6.25, y+12.5, x+12.5, y+18.75);
      } else if (g == 2) {
        fill(0, 0, 255);
        quad(x+12.5, y+12.5, x, y, x+6.25, y+12.5, x+12.5, y+18.75);
      }
      if (b == 1) {
        fill(255, 0, 0);
        quad(x, y-33.75, x+6.25, y+6.25, x, y-6.25, x-6.25, y+6.25);
      } else if (b == 0) {
        fill(0, 255, 0);
        quad(x, y-33.75, x+6.25, y+6.25, x, y-6.25, x-6.25, y+6.25);
      } else if (b == 2) {
        fill(0, 0, 255);
        quad(x, y-33.75, x+6.25, y+6.25, x, y-6.25, x-6.25, y+6.25);
      }
    }
  }
}
