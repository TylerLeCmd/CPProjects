Car [] cars = new Car[int(random(100))];
Rocks [] rocks = new Rocks[int(random(10))];
Spaceship space;
Timer timer;
ArrayList<PewPew> lasers = new ArrayList<PewPew>();
void setup() {
  size(400, 720);
  space = new Spaceship(255);
  for (int i=0; i<rocks.length; i++) {
    rocks[i] = new Rocks(color(220));
  }
  lasers = new ArrayList();
  timer = new Timer(int(random(2000)));
  for (int i=0; i<cars.length; i++) {
    cars[i] = new Car(color(240));
  }
}
void draw() {
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
void keyPressed() {
  lasers.add(new PewPew(mouseX, mouseY-75));
}
