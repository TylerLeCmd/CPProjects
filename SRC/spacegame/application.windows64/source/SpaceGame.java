import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SpaceGame extends PApplet {

Car [] cars = new Car[PApplet.parseInt(random(100))];
Rocks [] rocks = new Rocks[PApplet.parseInt(random(10))];
Spaceship space;
Timer timer;
ArrayList<PewPew> lasers = new ArrayList<PewPew>();
public void setup() {
  
  space = new Spaceship(255);
  for (int i=0; i<rocks.length; i++) {
    rocks[i] = new Rocks(color(220));
  }
  lasers = new ArrayList();
  timer = new Timer(PApplet.parseInt(random(2000)));
  for (int i=0; i<cars.length; i++) {
    cars[i] = new Car(color(240));
  }
}
public void draw() {
  background (0);

  if (timer.isFinished()) {
  }
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
  space.display(mouseX, mouseY);
  for (int i=0; i<rocks.length; i++) {
    rocks[i].display();
    rocks[i].drive();
  }
  //if (keyPressed) {
  //  if (keyCode == 'A' || keyCode == 'a') {
  //    lasers [0].display();
  //    println ("Hi");
  //  }
  //}
}
public void keyPressed() {
  lasers.add(new PewPew(mouseX, mouseY-75));
}

class Car {
  int c;
  float xp, yp, randpos, xspeed;

  Car(int c) {
    this.c = c;
    c = color(random(255));
    xp = width/2;
    yp = height/2;
    xspeed = 25;
  }
  public void display () {
    rectMode(CENTER);
    fill(c);
    rect(randpos, yp, 2, 2);
  }
  public void drive() {
    yp += xspeed;
    if (yp > height) {
      yp = 0;
      randpos = random(width);
      xspeed = random(100);
    }
  }
}
class EnemyChaser {
  int x, y, hp, r, g, b;
  char displayMode;
  int c1;

  EnemyChaser(int c) {
    x = 0;
    y = 0;
    hp = 100;
    displayMode = '1';
    this.c1 = c1;
  }
  public boolean reachedBottom() {
    if (y > height+30) {
      return true;
    } else {
      return false;
    }
  }
  public void display(int x, int y) {
    if (displayMode == '1') {
      //ENEMY CHASER
    }
  }
}
class PewPew {
  int x, y, speed;
  char displayMode;
  int c1;
  boolean reachedTop;

  PewPew(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 10;
    displayMode = '1';
    this.c1 = c1;
  }

  public void fire() {
    y -= speed;
  }
  public boolean reachedTop() {
    if (y < -30) {
      return true;
    } else {
      return false;
    }
  }
  public void display() {
    if (displayMode == '1') {
      //ENEMY CHASER
      fill (255, 0, 0);
      rect(x, y, 5, 25);
    }
  }
  public void drive() {
    y -= speed;
    if (y > -30) {
      y = mouseY - 75;
      println("1");
      println("2");
      println("3");
    }
  }
}

class Rocks {
  int c;
  float xp, yp, randpos, xspeed;

  Rocks(int c) {
    this.c = c;
    c = color(240);
    xp = width/2;
    yp = height/2;
    xspeed = 25;
  }
  public void display () {
    rectMode(CENTER);
    fill(c);
    rect(randpos, yp, 20, 20);
  }
  public void drive() {
    yp += xspeed;
    if (yp > height+25) {
      yp = -25;
      randpos = random(width);
      xspeed = 5 + random(10);
    }
  }
}
class Spaceship {
  int x, y, hp, ammo, r, g, b, lives;
  char displayMode;
  int c1;

  Spaceship(int c) {
    x = 0;
    y = 0;
    hp = 100;
    ammo = 90;
    lives = 5;
    displayMode = '1';
    this.c1 = c1;
  }
  public void display(int x, int y) {
    if (displayMode == '1') {
      this.x =x;
      this.y = y;
      fill(255);
      quad(x, y-75, x+25, y+25, x, y, x-25, y+25);
      r = PApplet.parseInt(random(3));
      g = PApplet.parseInt(random(3));
      b = PApplet.parseInt(random(3));
      if (r == 1) {
        fill(255, 0, 0);
        quad(x-25, y+25, x, y, x-12.5f, y+25, x-25, y+37.5f);
      } else if (r == 0) {
        fill(0, 255, 0);
        quad(x-25, y+25, x, y, x-12.5f, y+25, x-25, y+37.5f);
      } else if (r == 2) {
        fill(0, 0, 255);
        quad(x-25, y+25, x, y, x-12.5f, y+25, x-25, y+37.5f);
      }
      if (g == 1) {
        fill(255, 0, 0);
        quad(x+25, y+25, x, y, x+12.5f, y+25, x+25, y+37.5f);
      } else if (g == 0) {
        fill(0, 255, 0);
        quad(x+25, y+25, x, y, x+12.5f, y+25, x+25, y+37.5f);
      } else if (g == 2) {
        fill(0, 0, 255);
        quad(x+25, y+25, x, y, x+12.5f, y+25, x+25, y+37.5f);
      }
      if (b == 1) {
        fill(255, 0, 0);
        quad(x, y-67.5f, x+12.5f, y+12.5f, x, y-12.5f, x-12.5f, y+12.5f);
      } else if (b == 0) {
        fill(0, 255, 0);
        quad(x, y-67.5f, x+12.5f, y+12.5f, x, y-12.5f, x-12.5f, y+12.5f);
      } else if (b == 2) {
        fill(0, 0, 255);
        quad(x, y-67.5f, x+12.5f, y+12.5f, x, y-12.5f, x-12.5f, y+12.5f);
      }
    }
  }
}
class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  public void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }

  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  public boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}

  public void settings() {  size(400, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SpaceGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
