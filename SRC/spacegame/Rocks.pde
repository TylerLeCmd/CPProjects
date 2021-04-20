class Rocks {
  color c;
  float xp, yp, randpos, xspeed, rad;
  boolean flip;
  Rocks(color c) {
    this.c = c;
    c = color(240);
    xp = width/2;
    yp = height/2;
    xspeed = 25;
    rad = 20;
    flip = false;
  }
  void display () {
    if (!flip) {
      rectMode(CENTER);
      fill(c);
      rect(randpos, yp, 20, 20);
    }
  }
  void drive() {
    yp += xspeed;
    if (yp > height+25) {
      yp = -25;
      randpos = random(width);
      xspeed = 5 + random(10);
    }
  }
}
