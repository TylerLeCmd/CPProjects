class Car {
  color c;
  float xp, yp, randpos, xspeed;

  Car(color c) {
    this.c = c;
    c = color(random(255));
    xp = width/2;
    yp = height/2;
    xspeed = 25;
  }
  void display () {
    rectMode(CENTER);
    fill(c);
    rect(randpos, yp, 2, 2);
  }
  void drive() {
    yp += xspeed;
    if (yp > height) {
      yp = 0;
      randpos = random(width);
      xspeed = random(100);
    }
  }
}
