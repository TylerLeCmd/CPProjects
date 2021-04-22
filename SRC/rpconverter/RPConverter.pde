boolean val=false;
void setup() {
  size(1440, 720);
}
void draw() {
  background(180);
  strokeWeight(1);
  titleScreen();
  line(0, height/2, width, height/2);
  for (int i=0; i<width; i+=25) {
    line(i, (height/2) - 5, i, (height/2));
    textAlign(CENTER);
    textSize(12);
    if (val == false) {
      text(i*2, i, (height/2)-15);
      val = true;
    } else if (val == true) {
      text(i*2, i, (height/2)-5);
      val = false;
    }
  }
  for (float i=0; i<width; i+=325) {
    line(i, (height/2), i, (height/2)+5);
    textAlign(CENTER);
    textSize(12);
    text(5*(i/325), i, (height/2)+15);
  }
  for (int y=0; y<width; y+=25) {
    lineSnap(y);
  }
}
void titleScreen() {
  textAlign(LEFT);
  textSize(36);
  text("How Much Do I Waste on League?", 100, 100);
  textSize(20);
  text("Tyler Le's Guide on Money Wasting", 150, 150);
  text("Hover over your desired value of Riot Points and get your USD price", 800, 200, 400, 100);
}
void lineSnap(float x) {
  if (mouseX > x-12.5 && mouseX < x+12.5) {
    ellipse(x, height/2, 25, 25);
    textSize(20);
    text("RP:" + RP(x), 1080, 100);
    text("$" + usDollars(x), 1080, 125);
    strokeWeight(8);
    line(0, height/2, x, height/2);
  }
}
float usDollars(float x) {
  return 5*(x/325);
}
float RP(float x) {
  return x*2;
}
