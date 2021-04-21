class Rocks {
  color c;
  float xp, yp, randpos, xspeed, rad, size, loop, pass;
  boolean flip;
  Rocks(color c) {
    this.c = c;
    c = color(240);
    xp = width/2;
    yp = height/2;
    xspeed = 25;
    rad = 20;
    flip = false;
    size = 20;
    loop = 1;
    pass = 0;
  }
  void display () {
    if (!flip) {
      rectMode(CENTER);
      fill(c);
      rect(randpos, yp, size, size);
      if (timer.isFinished() && loop>50) {
        size *= 2;
        loop = 1;
      }
    }
  }
  void drive() {
    yp += xspeed;
    if (yp > height+25) {
      yp = -25;
      randpos = random(width);
      xspeed = 2.5 + random(10);
      loop += 1;
      pass += 1;
    }
  }
}
