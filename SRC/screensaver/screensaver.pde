float x, y, a, strokeW, pointCount, strokeR, strokeG, strokeB, pick;
void setup() {
  background(0);
  size(500, 500);
  x = random(width);
  y = random(height);
  a = 0;
}
void draw() { 
  a += 1;
  strokeW = random(1, 5);
  pointCount = random(2, 30);
  strokeR = random(255);
  strokeG = random(255);
  strokeB = random(255);
  if (x > width || x < 0 || y > height || y < 0) {
    x = random(width);
    y = random(height);
    pick = int(random(4));
  }
  if (pick == 0) {  
    stroke(strokeR, strokeG, strokeB);
    strokeWeight(strokeW);
    moveRight(x, y, pointCount);
  } else if (pick == 1) {  
    stroke(strokeR, strokeG, strokeB);
    strokeWeight(strokeW);
    moveLeft(x, y, pointCount);
  } else if (pick == 2) {  
    stroke(strokeR, strokeG, strokeB);
    strokeWeight(strokeW);
    moveDown(x, y, pointCount);
  } else if (pick == 3) {  
    stroke(strokeR, strokeG, strokeB);
    strokeWeight(strokeW);
    moveUp(x, y, pointCount);
  }
  if (a > 500) {
    background(0);
    a = 0;
  }
}
void moveRight(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX+i, startY);
    x = startX + i;
    y = startY;
  }
}
void moveDown(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX, startY+i);
    x = startX;
    y = startY + i;
  }
}
void moveLeft(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX - i, startY);
    x = startX - i;
    y = startY;
  }
}
void moveUp(float startX, float startY, float moveCount) {
  for (float i = 0; i < moveCount; i++) {
    point(startX, startY-i);
    x = startX;
    y = startY-i;
  }
}
