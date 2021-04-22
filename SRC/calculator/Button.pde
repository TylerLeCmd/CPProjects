int setValue;
class Button {
  int x, y, w, h, x2, y2, size1, size2;
  String val;
  color c1, c2;
  boolean looped;

  Button(int tempX, int tempY, color pepega, color pog, String kekw) {
    x = tempX;
    y = tempY;
    val = kekw;
    c1 = pepega;
    c2 = pog;
  }
  void keyChecks(char ohaeyo) {
    if (ohaeyo == 'V') {
      setValue = 0;
    } else if (ohaeyo == 'C') {
      setValue = 1;
    } else if (ohaeyo == 'X') {
      setValue = 2;
    } else if (ohaeyo == 'Z') {
      setValue = 3;
    } else if (ohaeyo == 'D') {
      setValue = 4;
    } else if (ohaeyo == 'S') {
      setValue = 5;
    } else if (ohaeyo == 'A') {
      setValue = 6;
    } else if (ohaeyo == 'E') {
      setValue = 7;
    } else if (ohaeyo == 'W') {
      setValue = 8;
    } else if (ohaeyo == 'Q') {
      setValue = 9;
    } else if (ohaeyo == 'R') {
      setValue = 10;
    } else if (ohaeyo == 'T') {
      setValue = 11;
    } else if (ohaeyo == 'Y') {
      setValue = 12;
    } else if (ohaeyo == 'G') {
      setValue = 13;
    } else if (ohaeyo == 'H') {
      setValue = 14;
    } else if (ohaeyo == 'B') {
      setValue = 15;
    } else if (ohaeyo == 'N') {
      setValue = 16;
    } else if (ohaeyo == 'J') {
      setValue = 17;
    } else if (ohaeyo == 'K') {
      setValue = 18;
    } else if (ohaeyo == 'L') {
      setValue = 19;
    } else if (ohaeyo == 'M') {
      setValue = 20;
    } else if (ohaeyo == 'I') {
      setValue = 21;
    }
  }
  void display(char lulw, char LULW) {
    if (key == lulw || key == LULW) {
      keyChecks(lulw);
      size1 = 50;
      size2 = 90;
      fill(c1);
      text(setValue, 10, 10);
    } else if (key == 'F' || key == 'f') {
      clear();
      background(0);
      fill(0);
      textSize(48);
      textAlign(CENTER);
      fill(255);
      text("Respect paid", width/2, (height/2)-200);
    } else {
      fill(c2);
    }
    rect(x, y, 50, 50, 5);
    fill(0);
    textAlign(CENTER);
    text(val, x+25, y+25);
    text(lulw, x+45, y+49);
    looped = true;
  }
  void one(int f) {
    x2 = 680 - f;
    y2 = (height/2)-195;
    line(x2+size1, y2, x2+size1, y2+size2);
  }
  void two(int f) {
    x2 = 680 - f;
    y2 = (height/2)-195;
    line(x2, y2, x2+size1, y2);
    line(x2+size1, y2, x2+size1, y2+size1);
    line(x2+size1, y2+size1, x2, y2+size1);
    line(x2, y2+size1, x2, y2+size2);
    line(x2, y2+size2, x2+size1, y2+size2);
  }

  void three(int f) {
    x2 = 680 - f;
    y2 = (height/2)-195;
    line(x2, y2, x2+size1, y2);
    line(x2+size1, y2, x2+size1, y2+size1);
    line(x2+size1, y2+size1, x2, y2+size1);
    line(x2+size1, y2+size1, x2+size1, y2+size2);
    line(x2, y2+size2, x2+size1, y2+size2);
  }

  void four(int f) {
    x2 = 680 - f;
    y2 = (height/2)-195;
    line(x2, y2, x2, y2+size1);
    line(x2+size1, y2, x2+size1, y2+size1);
    line(x2+size1, y2+size1, x2, y2+size1);
    line(x2+size1, y2+size1, x2+size1, y2+size2);
  }
  void five(int f) {
    x2 = 680 - f;
    y2 = (height/2)-195;
    line(x2+size1, y2, x2, y2);
    line(x2, y2, x2, y2+size1);
    line(x2+size1, y2+size1, x2, y2+size1);
    line(x2+size1, y2+size1, x2+size1, y2+size2);
    line(x2+size1, y2+size2, x2, y2+size2);
  }
  void six(int f) {
    x2 = 680 - f;
    y2 = (height/2)-195;
    line(x2+size1, y2, x2, y2);
    line(x2, y2, x2, y2+size1);
    line(x2+size1, y2+size1, x2, y2+size1);
    line(x2+size1, y2+size1, x2+size1, y2+size2);
    line(x2+size1, y2+size2, x2, y2+size2);
    line(x2, y2+size2, x2, y2+size1);
  }
  void seven(int f) {
    x2 = 680 - f;
    y2 = (height/2)-195;
    line(x2, y2, x2+size1, y2);
    line(x2+size1, y2, x2+size1, y2+size2);
  }
  void eight(int f) {
    x2 = 680 - f;
    y2 = (height/2)-195;
    line(x2+size1, y2, x2, y2);
    line(x2, y2, x2, y2+size1);
    line(x2+size1, y2+size1, x2, y2+size1);
    line(x2+size1, y2+size1, x2+size1, y2+size2);
    line(x2+size1, y2+size2, x2, y2+size2);
    line(x2, y2+size2, x2, y2+size1);
    line(x2+size1, y2, x2+size1, y2+size1);
  }
  void nine(int f) {
    x2 = 680 - f;
    y2 = (height/2)-195;
    line(x2+size1, y2, x2, y2);
    line(x2, y2, x2, y2+size1);
    line(x2+size1, y2+size1, x2, y2+size1);
    line(x2+size1, y2+size1, x2+size1, y2+size2);
    line(x2+size1, y2+size2, x2, y2+size2);
    line(x2+size1, y2, x2+size1, y2+size1);
  }
  void zero(int f) {
    x2 = 680 - f;
    y2 = (height/2)-195;
    line(x2, y2, x2+size1, y2);
    line(x2+size1, y2, x2+size1, y2+size2);
    line(x2, y2+size2, x2, y2);
    line(x2, y2+size2, x2+size1, y2+size2);
  }
}
