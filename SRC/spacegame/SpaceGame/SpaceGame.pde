// Tyler Le
// SpaceGame 2021
import processing.sound.*;
SoundFile healthspot, dead;
int hi, ammo, time, lives, pass, count, score;
int r, g, b;
boolean hit, play, mode, pause, heal, loopless;
Car [] cars = new Car[100];
Rocks [] rocks = new Rocks[int(random(25, 75))];
Items health;
Spaceship space;
Timer timer;
ArrayList<PewPew> lasers = new ArrayList<PewPew>();
void setup() {
  healthspot = new SoundFile (this, "Enemy Spotted Sound Effect (Counter Strike Radio Commands).mp3");
  dead = new SoundFile (this, "Terrorists win - CSGO Sound Effect.mp3");
  frameRate (60);
  hi = 0;
  ammo = 100;
  time = 1000;
  lives = 100;
  pass = 0;
  loopless = true;
  play = false;
  size(400, 720);
  health = new Items(color(0, 255, 0));
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
  score = 0;
}
void draw() {
  println (mode);
  if (!play) {
    startScreen();
  } else {
    println(rocks[1].pass);
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
      if (mouseX < (rocks[i].randpos+rocks[i].size) && mouseX > (rocks[i].randpos-rocks[i].size) && mouseY < (rocks[i].yp+rocks[i].size)&&mouseY > (rocks[i].yp-rocks[i].size)) {
        //println ('A');
        //println ('A');
        //println ('A');
        //println ('A');
        //println ('A');
        //println ('A');
        hit = true;
        lives -= 1;
        rectMode(LEFT);
        fill(255, 0, 0, 100);
        rect(width, 0, width/5, height/5);
      } else {
        //println ('B');
        hit = false;
      }
    }
    if (!mode) {
      health.display();
      health.drive();
      if (mouseX < (health.randpos+rocks[1].size) && mouseX > (health.randpos-rocks[1].size) && mouseY < (health.yp+rocks[1].size)&&mouseY > (health.yp-rocks[1].size)) {
        heal = true;
        lives -= 1;
        timer = new Timer(time);
        rectMode(LEFT);
        fill(0, 255, 0, 100);
        rect(width, 0, width/5, height/5);
      } else {
        //println ('B');
        heal = false;
      }
    }
    space.display();
    info();
    if (!pause) {
      if (mode) {
        score += 5;
      }
      if (!mode) {
        score += 1;
      }
    }
    if (lives < 0) {
      pause = true;
      cursor();
      if (loopless) {
        dead.play();
        loopless = false;
      }
      endScreen();
    }
    if (heal) {
      if (!pause)
        lives = 100;
    }
  }
}

//space.keyboard();
//space.edgeDetect();

void startScreen() {
  background(0);
  textAlign(CENTER);
  textSize(48);
  fill(255, 110);
  text("Rodger Dodger", width/2, 100);
  textSize(18);
  text("No Defense,", width/2, 125);
  text("No Escape,", width/2, 150);
  text("Just Infinitism", width/2, 175);
  rectMode(CENTER);
  textSize(36);
  rect(width/2, height/2, 350, 100);
  text("Start: Normal", width/2, height/2);
  rect(width/2, (height/2)+125, 350, 100);
  text("Start: Hardcore", width/2, (height/2)+125);
  textSize(18);
  text("x5 Multiplier", width/2, (height/2)+150);
  if (mouseX < width-25 && mouseX > 25 && mouseY < (height/2)+50 && mouseY > (height/2)-50) {
    if (mousePressed) {
      play = true;
      pause = false;
    }
  }
  if (mouseX < width-25 && mouseX > 25 && mouseY < ((height/2)+125)+50 && mouseY > ((height/2)+125)-50) {
    if (mousePressed) {
      play = true;
      mode = true;
      pause = false;
      lives = 1;
    }
  }
  rect(width/2, (height/2)+250, 350, 100);
  textSize(36);
  text("Exit", width/2, (height/2)+250);
  if (mouseX < width-25 && mouseX > 25 && mouseY < ((height/2)+250)+50 && mouseY > ((height/2)+250)-50) {
    if (mousePressed) {
      exit();
    }
  }
}
void endScreen() {
  background(0);
  textAlign(CENTER);
  textSize(36);
  fill(255, 110);
  text("Mission Failed", width/2, 100);
  textSize(18);
  fill(255, 110);
  text("We'll get them next time", width/2, 150);
  if (!mode) {
    textSize(36);
    text("Score:" + (score), width/2, height/2);
    textSize(18);
    text("Rock Size:" + (rocks[1].size), width/2, height/2+20);
    rectMode(CENTER);
  }
  if (mode) {
    textSize(36);
    text("Score:" + (score), width/2, height/2-125);
    textSize(18);
    text("Rock Size:" + (rocks[1].size), width/2, height/2-125+20);
    rectMode(CENTER);
  }
  if (!mode) {
    textSize(36);
    rect(width/2, (height/2)+125, 350, 100);
    text("Continue?", width/2, height/2+125);
    textSize(18);
    text("(-250 Points)", width/2, height/2+145);
  } 
  if (mode) {
    textSize(36);
    text("No Continuing in Hardcore", width/2, height/2, width, 100);
    textSize(18);
    text("(Sorry!)", width/2, height/2+100);
  }
  rect(width/2, (height/2)+250, 350, 100);
  textSize(36);
  text("Exit", width/2, (height/2)+250);
  if (!mode) {
    if (mouseX < width-25 && mouseX > 25 && mouseY < ((height/2)+125)+50 && mouseY > ((height/2)+125)-50) {
      if (mousePressed) {
        if (!mode) {
          lives = 100;
        } else if (mode) {
          lives = 1;
        }
        play = true;
        pause = false;
        score -= 250;
      }
    }
  }
  if (mouseX < width-25 && mouseX > 25 && mouseY < ((height/2)+250)+50 && mouseY > ((height/2)+250)-50) {
    if (mousePressed) {
      exit();
    }
  }
}
void stats() {
  background(0);
  textAlign(CENTER);
  textSize(36);
  fill(255, 110);
  text("Mission Failed", width/2, 100);
  textSize(18);
  fill(255, 110);
  text("We'll get them next time", width/2, 150);
  rectMode(CENTER);
  textSize(36);
  rect(width/2, (height/2)+250, 350, 100);
  text("Back", width/2, (height/2)+250);
  if (mouseX < width-25 && mouseX > 25 && mouseY < ((height/2)+250)+50 && mouseY > ((height/2)+250)-50) {
    if (mousePressed) {
      endScreen();
    }
  }
}
//void keyPressed() {
//  if (hi < ammo) {
//    lasers.add(new PewPew(mouseX, mouseY-75));
//    hi += 1;
//    println (timer.savedTime);
//  }
//}
void info() {
  fill(150, 128);
  rectMode(RIGHT);
  rect(width, 0, width/5, height/5);
  fill(255, 0, 0, 200);
  textAlign(LEFT);
  textSize(14);
  text("Rock Size:" + (rocks[1].size), (width/5) + 10, height/50);
  staticShip(0, 0);
  fill(0, 255, 0, 200);
  textSize(18);
  text("HP:" + (lives), width - 100, 25);
  fill(0, 0, 255, 200);
  if (rocks[1].pass < 50) {
    textSize(14);
    text("Rock Wave:" + (rocks[1].pass) + "/50", (width/5) + 10, (height/50)+20);
    fill (255, 255, 0, 200);
  } else {
    textSize(14);
    text("Rock Wave:" + (rocks[1].pass) + "/∞?", (width/5) + 10, (height/50)+20);
    fill (255, 255, 0, 200);
  }
  if (rocks[1].pass > 50) {
    fill (255, 0, 0);
    textSize(20);
    text("You Think You Can Pass?", (width/5) + 10, (height/50)+80);
  }
  fill (255, 255, 0, 200);
  textSize(14);
  text("Score:" + (score), (width/5) + 10, (height/50)+40);
  if (!mode) {
    fill (0, 255, 128, 200);
    textSize(14);
    text("Distance To Next Health:" + ((height*10)-health.yp), (width/5) + 10, (height/50)+60);
    if (health.yp == 0) {
      healthspot.play();
    }
  }
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
