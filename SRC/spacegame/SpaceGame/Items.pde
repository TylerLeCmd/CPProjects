class Items {
  color c;
  float xp, yp, randpos, xspeed, rad, size, loop, pass;
  boolean flip;
  Items(color c) {
    this.c = c;
    xp = width/2;
    yp = height/2;
    xspeed = 25;
    rad = 20;
    flip = false;
    size = 5;
    loop = 1;
    pass = 0;
  }
  void display () {
    if (!flip) {
      if (timer.isFinished()) {
        rectMode(CENTER);
        fill(c);
        rect(randpos, yp, size, size);
        rect(randpos+size, yp, size, size);
        rect(randpos, yp+size, size, size);
        rect(randpos-size, yp, size, size);
        rect(randpos, yp-size, size, size);
      }
    }
  }
  void drive() {
    yp += xspeed;
    if (yp > height*10) {
      yp = -25;
      randpos = random(width);
      xspeed = 5;
      loop += 1;
      if (hit) {
        pass = 0;
      } else {
        pass += 1;
      }
    }
  }
}
