int hi, ammo, time, lives, pass;
int r, g, b;
boolean hit, play;
Car [] cars = new Car[100];
Rocks [] rocks = new Rocks[int(random(10))];
Spaceship space;
Timer timer;
ArrayList<PewPew> lasers = new ArrayList<PewPew>();
void setup() {
  frameRate (60);
  hi = 0;
  ammo = 100;
  time = 10000;
  lives = 5;
  pass = 0;
  play = false;
  size(400, 720);
  timer = new Timer(time);
  space = new Spaceship(255);
  for (int i=0; i<rocks.length; i++) {
    rocks[i] = new Rocks(color(220));
  }
  lasers = new ArrayList();
  for (int i=0; i<cars.length; i++) {
    cars[i] = new Car(color(240));
  }
  timer.start();
}
void draw() {
  if (!play) {
    startScreen();
  } else {
    noCursor();
    background (0);
    for (int i=0; i<cars.length; i++) {
      cars[i].display();
      cars[i].drive();
    }
    for (int i = 0; i < lasers.size(); i++) {
      PewPew laser = lasers.get(i);
      laser.display();
      laser.fire();
      if (laser.reachedTop) {
        lasers.remove(laser);
      }
    }
    for (int i=0; i<rocks.length; i++) {
      rocks[i].display();
      rocks[i].drive();
      //if (rocks.yp > height+25) {
      //}
      if (mouseX < (rocks[i].randpos+25) && mouseX > (rocks[i].randpos-25) && mouseY < (rocks[i].yp+25)&&mouseY > (rocks[i].yp-25)) {
        println ('A');
        println ('A');
        println ('A');
        println ('A');
        println ('A');
        println ('A');
        hit = true;
        if (timer.isFinished()) {
          lives -= 1;
          fill(255, 0, 0);
          rect(random(width), random(height), random(width), random(height));
          timer = new Timer(time);
        }
      } else {
        println ('B');
        hit = false;
      }
    }
    space.display();
    info();

    //space.keyboard();
    //space.edgeDetect();
  }
}
void startScreen() {
  background(0);
  textAlign(CENTER);
  textSize(36);
  fill(255, 110);
  text("Rodger Dodger", width/2, 100);
  rectMode(CENTER);
  rect(width/2, height/2, 350, 100);
  text("Start", width/2, height/2);
  rect(width/2, (height/2)+125, 350, 100);
  text("Exit", width/2, (height/2)+125);
  if (mouseX < width-25 && mouseX > 25 && mouseY < (height/2)+50 && mouseY > (height/2)-50) {
    if (mousePressed) {
      play = true;
    }
  }
  if (mouseX < width-25 && mouseX > 25 && mouseY < ((height/2)+125)+50 && mouseY > ((height/2)+125)-50) {
    if (mousePressed) {
      exit();
    }
  }
}
void keyPressed() {
  if (hi < ammo) {
    lasers.add(new PewPew(mouseX, mouseY-75));
    hi += 1;
    println (hi);
  }
}
void info() {
  fill(150, 128);
  rectMode(RIGHT);
  rect(width, 0, width/5, height/5);
  fill(255, 0, 0, 200);
  textAlign(LEFT);
  textSize(14);
  text("Ammo:" + (ammo-hi), (width/5) + 10, height/50);
  staticShip(0, 0);
  fill(0, 255, 0, 200);
  textSize(18);
  text("x" + (lives), width - 100, 25);
}
void staticShip(int x, int y) {
  x = width - 50;
  y = 100;
  fill(255, 180);
  quad(x, y-75, x+25, y+25, x, y, x-25, y+25);
  r = int(random(3));
  g = int(random(3));
  b = int(random(3));
  if (r == 1) {
    fill(255, 0, 0, 180);
    quad(x-25, y+25, x, y, x-12.5, y+25, x-25, y+37.5);
  } else if (r == 0) {
    fill(0, 255, 0, 180);
    quad(x-25, y+25, x, y, x-12.5, y+25, x-25, y+37.5);
  } else if (r == 2) {
    fill(0, 0, 255, 180);
    quad(x-25, y+25, x, y, x-12.5, y+25, x-25, y+37.5);
  }
  if (g == 1) {
    fill(255, 0, 0, 180);
    quad(x+25, y+25, x, y, x+12.5, y+25, x+25, y+37.5);
  } else if (g == 0) {
    fill(0, 255, 0, 180);
    quad(x+25, y+25, x, y, x+12.5, y+25, x+25, y+37.5);
  } else if (g == 2) {
    fill(0, 0, 255, 180);
    quad(x+25, y+25, x, y, x+12.5, y+25, x+25, y+37.5);
  }
  if (b == 1) {
    fill(255, 0, 0, 180);
    quad(x, y-67.5, x+12.5, y+12.5, x, y-12.5, x-12.5, y+12.5);
  } else if (b == 0) {
    fill(0, 255, 0, 180);
    quad(x, y-67.5, x+12.5, y+12.5, x, y-12.5, x-12.5, y+12.5);
  } else if (b == 2) {
    fill(0, 0, 255, 180);
    quad(x, y-67.5, x+12.5, y+12.5, x, y-12.5, x-12.5, y+12.5);
  }
}
