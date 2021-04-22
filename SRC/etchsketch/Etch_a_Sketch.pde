//Variables
int x, y;

void setup() {
  size(1080, 720);
  frameRate(10);
  x=10;
  y=10;
}
void mousePressed() {
  saveFrame("line-######.png");
}
void draw() {
  fill(0);
  strokeWeight(10);
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      fill(0);
    }
  } else {
    fill(255);
  }
}
//  drawname();
//  noLoop();

void keyPressed() {
  if (key == 'A' || key == 'a') {
    moveLeft(5);
  }
  if (key == 'D' || key == 'd') {
    moveRight(5);
  }
  if (key == 'S' || key == 's') {
    moveDown(5);
  }
  if (key == 'W' || key == 'w') {
    moveUp(5);
  }
  if (key == 'q' || key == 'Q') {
    moveUL(int(sqrt(50)));
  }
  if (key == 'e' || key == 'E') {
    moveUR(int(sqrt(50)));
  }
  if (key == 'z' || key == 'Z') {
    moveDL(int(sqrt(50)));
  }
  if (key == 'c' || key == 'C') {
    moveDR(int(sqrt(50)));
  }
}
void drawname() {
  moveRight (20);
  moveLeft(10);
  moveDown (25);
  moveRight(15);
  moveUL(10);
  moveDR(10);
  moveUR(10);
  moveDL(30);
  moveUR(20);
  moveRight(20);
  moveUp(20);
  moveDown(20);
  moveRight(10);
  moveUp(10);
  moveRight(10);
  moveDown(5);
  moveLeft(10);
  moveDown(5);
  moveRight(20);
  moveUp(10);
  moveDown(2);
  moveRight(10);
  moveDown(2);
}
void moveRight(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y);
  }
  x=x+(10*rep);
}
void moveDown(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x, y+i);
  }
  y=y+(10*rep);
}
void moveLeft(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y);
  }
  x=x-(10*rep);
}
void moveUp(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x, y-i);
  }
  y=y-(10*rep);
}
void moveUR(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y-i);
  }
  x=x+(10*rep);
  y=y-(10*rep);
}
void moveDR(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x+i, y+i);
  }
  x=x+(10*rep);
  y=y+(10*rep);
}
void moveUL(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y-i);
  }
  x=x-(10*rep);
  y=y-(10*rep);
}
void moveDL(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(x-i, y+i);
  }
  x=x-(10*rep);
  y=y+(10*rep);
}
