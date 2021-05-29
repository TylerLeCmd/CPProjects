let clock;
let weaps = ["Ka", "Da", "Bl", "Re"];
let buyed = [];
let equ = [];
let x = 0;
let level = 0;
let goal = 0;
let start = false;
let play = true;
let coins = 150;
let rebirth = false;
let complete = 0;
let shoping = false;
let select = false;
let img;
let img2;
let img3;
let img4;

function preload() {
  img = loadImage ("kataan.png");
  img2 = loadImage ("dager.png");
  img3 = loadImage ("redthing.png");
  img4 = loadImage ("shine.png");
}
function setup() {
  createCanvas(windowWidth, windowHeight);
  frameRate(60);
  clock = new Times();
  imageMode(CENTER);
  for (i =0; i < 4; i ++) {
    weaps [i] = false;
    buyed [i] = false;
    equ [i] = false;
  }
}

function draw() {
  if (shoping) {
    shop();
  } else if (!start) {
    startScreen();
  } else {
    background(0);
    textAlign(CENTER);
    rectMode(CENTER);
    fill(255);
    rect(width / 2, height / 5, (width / 5) + (width / 4), 50);
    fill(255, 0, 0);
    rect(width / 2, height / 5, 0 + x * ((width / 5) + (width / 4)) / goal, 50);
    fill(255);
    textSize(24);
    text(x / 10 + "/" + goal / 10, width / 2, height / 5 - 50);
    if (mouseIsPressed) {
      fill(200);
    } else {
      fill(255);
    }
    square(width / 2, height / 5 * 3, 250);
    if (equ [0]) {
      image(img, width/2, height/5 * 3, 200, 200);
    } else if (equ [1]) {
      image(img2, width/2, height/5 * 3, 200, 200);
    } else if (equ [2]) {
      image(img3, width/2, height/5 * 3, 200, 200);
    } else if (equ [3]) {
      image(img4, width/2, height/5 * 3, 200, 200);
    }
    if (x >= goal) {
      textSize(20);
      level += 250;
      levelSelect();
      start = false;
      timer = 10;
      if (equ [0] || equ [2]) {
        timer = 10;
      }
      if (equ [1] || equ [3]) {
        timer = 20;
      }
      play = true;
    } else if (timer == 0) {
      level += 0;
      x = 0;
      levelSelect();
      start = false;
      timer = 10;
      if (equ [0] || equ [2]) {
        timer = 10;
      }
      if (equ [1] || equ [3]) {
        timer = 20;
      }
      play = false;
    }
    clock.timer();
  }
}

function startScreen() {
  background(0);
  textAlign(CENTER);
  if (level != 0) {
    if (!play) {
      fill(255, 0, 0);
      text("Quota Missed!", width / 2, height / 5 + 50);
    } else {
      fill(255, 100, 0);
      text("Quota Met!", width / 2, height / 5 + 50);
    }
  }
  textSize(48);
  fill(255, 110);
  text("Click Fest", width / 2, height / 2 - 200);
  textSize(18);
  text("Completed Levels:" + pow(complete, 1/2), width / 2, height / 2 - 150);
  text("Coins: " + coins, width / 2, height / 2 - 100);
  rectMode(CENTER);
  textSize(36);
  rect(width / 2, height / 2, 350, 100);
  text("Game Start!", width / 2, height / 2);
  rect(width / 2, (height / 2) + 125, 350, 100);
  text("Rebirth", width / 2, (height / 2) + 125);
  rect(width / 2, (height / 2) + 250, 350, 100);
  text("Shop", width / 2, (height / 2) + 250);
  textSize(18);
  text("Coins: Level Count Squared", width / 2, (height / 2) + 150);
  if (mouseX < width / 2 + 175 && mouseX > width / 2 - 175 && mouseY < (height / 2) + 50 && mouseY > (height / 2) - 50) {
    if (mouseIsPressed) {
      start = true;
    }
  }
  if (mouseX < width / 2 + 175 && mouseX > width / 2 - 175 && mouseY < ((height / 2) + 125) + 50 && mouseY > ((height / 2) + 125) - 50) {
    if (mouseIsPressed) {
      coins += complete;
      complete = 0;
      x = 0;
      level = 0;
      goal = 0;
      start = false;
    }
  }
}

function shop() {
  //if (mouseIsPressed) {
  //  select = true;
  //} else {
  //  select = false;
  //}
  background(0);
  textAlign(CENTER);
  textSize(48);
  fill(255, 110);
  text("Shop", width / 2, height / 2 - 200);
  textSize(18);
  text("Coins: " + coins, width / 2, height / 2 - 150);
  rectMode(CENTER);
  if (weaps [0]) {
    if (buyed [0]) {
      if (!equ [0]) {
        select = true;
        textSize(36);
        text("Equip?", width / 2, (height / 2) + 125);
      } else {
        select = false;
        textSize(36);
        text("Equipped", width/2, (height/2) + 125);
      }
    } else {
      select = true;
      textSize(36);
      text("Purchase?", width / 2, (height / 2) + 125);
      textSize (18);
      text("Price: 50 Coins", width / 2, (height / 2) + 70);
    }
  } else if (weaps [1]) {
    if (buyed [1]) {
      if (!equ [1]) {
        select = true;
        textSize(36);
        text("Equip?", width / 2, (height / 2) + 125);
      } else {
        select = false;
        textSize(36);
        text("Equipped", width/2, (height/2) + 125);
      }
    } else {
      select = true;
      textSize(36);
      text("Purchase?", width / 2, (height / 2) + 125);
      textSize (18);
      text("Price: 100 Coins", width / 2, (height / 2) + 70);
    }
  } else if (weaps [2]) {
    if (buyed [2]) {
      if (!equ [2]) {
        select = true;
        textSize(36);
        text("Equip?", width / 2, (height / 2) + 125);
      } else {
        select = false;
        textSize(36);
        text("Equipped", width/2, (height/2) + 125);
      }
    } else {
      select = true;
      textSize(36);
      text("Purchase?", width / 2, (height / 2) + 125);
      textSize (18);
      text("Price: 200 Coins", width / 2, (height / 2) + 70);
    }
  } else if (weaps [3]) {
    if (buyed [3]) {
      if (!equ [3]) {
        select = true;
        textSize(36);
        text("Equip?", width / 2, (height / 2) + 125);
      } else {
        select = false;
        textSize(36);
        text("Equipped", width/2, (height/2) + 125);
      }
    } else {
      select = true;
      textSize(36);
      text("Purchase?", width / 2, (height / 2) + 125);
      textSize (18);
      text("Price: 300 Coins", width / 2, (height / 2) + 70);
    }
  }
  if (!select) {
    fill(255, 50);
  } else {
    fill(255, 110);
  }
  rect(width / 2, (height / 2) + 125, 350, 100);
  if (mouseX < width / 2 + 175 && mouseX > width / 2 - 175 && mouseY < ((height / 2) + 125) + 50 && mouseY > ((height / 2) + 125) - 50) {
    if (mouseIsPressed) {
      if (weaps [0]) {
        if (!buyed [0]) {
          if (coins >= 50) {
            buyed [0] = true;
            equ [0] = true;
            equ [1] = false;
            equ [2] = false;
            equ [3] = false;
            coins -= 50;
          } else {
            select = false;
          }
        } else if (buyed [0]) {
          if (!equ [0]) {
            equ [0] = true;
            equ [1] = false;
            equ [2] = false;
            equ [3] = false;
          }
        }
      } else if (weaps [1]) {
        if (!buyed [1]) {
          if (coins >= 100) {
            buyed [1] = true;
            equ [0] = false;
            equ [1] = true;
            equ [2] = false;
            equ [3] = false;
            coins -= 100;
          } else {
            select = false;
          }
        } else if (buyed [1]) {
          if (!equ [1]) {
            equ [0] = false;
            equ [1] = true;
            equ [2] = false;
            equ [3] = false;
          }
        }
      } else if (weaps [2]) {
        if (!buyed [2]) {
          if (coins >= 200) {
            buyed [2] = true;
            equ [0] = false;
            equ [1] = false;
            equ [2] = true;
            equ [3] = false;
            coins -= 200;
          } else {
            select = false;
          }
        } else if (buyed [2]) {
          if (!equ [2]) {
            equ [0] = false;
            equ [1] = false;
            equ [2] = true;
            equ [3] = false;
          }
        }
      } else if (weaps [3]) {
        if (!buyed [3]) {
          if (coins >= 300) {
            buyed [3] = true;
            equ [0] = false;
            equ [1] = false;
            equ [2] = false;
            equ [3] = true;
            coins -= 300;
          } else {
            select = false;
          }
        } else if (buyed [3]) {
          if (!equ [3]) {
            equ [0] = false;
            equ [1] = false;
            equ [2] = false;
            equ [3] = true;
          }
        }
      }
    }
  }
  fill(255, 110);
  rect(width / 2, (height / 2) + 250, 350, 100);
  textSize(36);
  text("Exit", width / 2, (height / 2) + 250);
  text("Pikapika Katana", width / 2 - 500, 350);
  text("Digger Dagger", width / 2 - 500, 475);
  text("Ruby Sword", width / 2 + 500, 350);
  text("Sapphire Sword", width / 2 + 500, 475);
  textSize(18);
  text("Quick, and Shiny. Doubled Power", width / 2 - 500, 375);
  text("Scarily Small. This'll be a while (DT)", width / 2 - 500, 500);
  text("It's Made of Ruby. Triplely Good", width / 2 + 500, 375);
  text("Blue, Da Bu Dee. Triplely and Timely Good", width / 2 + 500, 500);
  text("One Time Purchase", width / 2, (height / 2) + 150);
  rect(width / 2 - 500, 350, 350, 100);
  rect(width / 2 - 500, 475, 350, 100);
  rect(width / 2 + 500, 350, 350, 100);
  rect(width / 2 + 500, 475, 350, 100);
  if (weaps [0]) {
    image(img, width/2, height/2 - 50, 200, 200);
  } else if (weaps [1]) {
    image(img2, width/2, height/2 - 50, 200, 200);
  } else if (weaps [2]) {
    image(img3, width/2, height/2 - 50, 200, 200);
  } else if (weaps [3]) {
    image(img4, width/2, height/2 - 50, 200, 200);
  }
  //box 1
  if (mouseX < width / 2 - 325 && mouseX > width / 2 - 675  && mouseY < 400 && mouseY > 300) {
    if (mouseIsPressed) {
      weaps [0] = true;
      weaps [1] = false;
      weaps [2] = false;
      weaps [3] = false;
      if (coins >= 50) {      
        select = true;
      } else {      
        select = false;
      }
    }
  }

  //box 2
  if (mouseX < width / 2 - 325 && mouseX > width / 2 - 675  && mouseY < 525 && mouseY > 425) {
    if (mouseIsPressed) {
      weaps [0] = false;
      weaps [1] = true;
      weaps [2] = false;
      weaps [3] = false;
      if (coins >= 100) {      
        select = true;
      } else {      
        select = false;
      }
    }
  }
  //box 3
  if (mouseX < width / 2 + 675  && mouseX > width / 2 + 325 && mouseY < 400 && mouseY > 300) {
    if (mouseIsPressed) {
      weaps [0] = false;
      weaps [1] = false;
      weaps [2] = true;
      weaps [3] = false;
      if (coins >= 200) {      
        select = true;
      } else {      
        select = false;
      }
    }
  }
  //box 4
  if (mouseX < width / 2 + 675  && mouseX > width / 2 + 325 && mouseY < 525 && mouseY > 425) {
    if (mouseIsPressed) {
      weaps [0] = false;
      weaps [1] = false;
      weaps [2] = false;
      weaps [3] = true;
      if (coins >= 300) {      
        select = true;
      } else {      
        select = false;
      }
    }
  }
  if (mouseX < width / 2 + 175 && mouseX > width / 2 - 175 && mouseY < ((height / 2) + 125) + 50 && mouseY > ((height / 2) + 125) - 50) {
    if (mouseIsPressed) {
      x = 0;
      level = 0;
      goal = 0;
      start = false;
    }
  }
}


function levelSelect() {
  if (x >= goal) {
    goal = 0;
    goal += level;
    complete = floor((x / 250) * (x/250));
    x = 0;
  }
}

function mouseReleased() {
  if (!start) {
    if (mouseX < width / 2 + 175 && mouseX > width / 2 - 175 && mouseY < ((height / 2) + 250) + 50 && mouseY > ((height / 2) + 250) - 50) {
      if (!shoping) {
        shoping = true;
      } else if (shoping) {
        shoping = false;
      }
    }
  }
}

function mouseClicked() {
  if (x !== goal) {
    if (start) {
      if (timer != 0) {
        if (mouseX > width / 2 - 125 && mouseX < width / 2 + 125 && mouseY > height / 5 * 3 - 125 && mouseY < height / 5 * 3 + 125) {
          if (equ [0]) {
            x += 20;
          }
          if (equ [2]) {
            x += 30;
          }
          if (equ [3]) {
            x += 30;
          }
          x += 10;
        }
      }
    }
  }
}
