Button[] numButtons = new Button[10];
Button[] operButtons = new Button[12];
int x, y;
void setup() {
  size(960, 720);
  numButtons[0] = new Button(240, (height/2)+60, #10959B, #22C9D1, "0");
  numButtons[1] = new Button(180, (height/2)+60, #10959B, #22C9D1, "1");
  numButtons[2] = new Button(120, (height/2)+60, #10959B, #22C9D1, "2");
  numButtons[3] = new Button(60, (height/2)+60, #10959B, #22C9D1, "3");
  numButtons[4] = new Button(160, (height/2), #10959B, #22C9D1, "4");
  numButtons[5] = new Button(100, (height/2), #10959B, #22C9D1, "5");
  numButtons[6] = new Button(40, (height/2), #10959B, #22C9D1, "6");
  numButtons[7] = new Button(140, (height/2)-60, #10959B, #22C9D1, "7");
  numButtons[8] = new Button(80, (height/2)-60, #10959B, #22C9D1, "8");
  numButtons[9] = new Button(20, (height/2)-60, #10959B, #22C9D1, "9");
  operButtons[0] = new Button(200, (height/2)-60, #168B1F, #17E326, "Return/=");
  operButtons[1] = new Button(260, (height/2)-60, #168B1F, #17E326, "-");
  operButtons[2] = new Button(320, (height/2)-60, #168B1F, #17E326, "+");
  operButtons[3] = new Button(280, height/2, #168B1F, #17E326, "/");
  operButtons[4] = new Button(340, height/2, #168B1F, #17E326, "x");
  operButtons[5] = new Button(300, (height/2)+60, #168B1F, #17E326, ".");
  operButtons[6] = new Button(360, (height/2)+60, #168B1F, #17E326, "+|-");
  operButtons[7] = new Button(400, height/2, #CE0000, #FC0D0D, "x'");
  operButtons[8] = new Button(460, height/2, #CE0000, #FC0D0D, "sin");
  operButtons[9] = new Button(520, height/2, #CE0000, #FC0D0D, "cos");
  operButtons[10] = new Button(420, (height/2)+60, #CE0000, #FC0D0D, "tan");
  operButtons[11] = new Button(440, (height/2)-60, #DE9B24, #F59F14, "Clear");
}
void draw() {
  calc();
}
void calc() {
  background(220);
  fill(220);
  rect(380, (height/2)-200, 400, 100);
  numButtons[0].display('V', 'v');
  numButtons[1].display('C', 'c');
  numButtons[2].display('X', 'x');
  numButtons[3].display('Z', 'z');
  numButtons[4].display('D', 'd');
  numButtons[5].display('S', 's');
  numButtons[6].display('A', 'a');
  numButtons[7].display('E', 'e');
  numButtons[8].display('W', 'w');
  numButtons[9].display('Q', 'q');
  operButtons[0].display('R', 'r');
  operButtons[1].display('T', 't');
  operButtons[2].display('Y', 'y');
  operButtons[3].display('G', 'g');
  operButtons[4].display('H', 'h');
  operButtons[5].display('B', 'b');
  operButtons[6].display('N', 'n');
  operButtons[7].display('J', 'j');
  operButtons[8].display('K', 'k');
  operButtons[9].display('L', 'l');
  operButtons[10].display('M', 'm');
  operButtons[11].display('I', 'i');
  println(setValue);
}
