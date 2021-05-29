class Times {
  setter() {

  }
  timer() {
    fill(255);
    fill(255,0,0);
    text(timer, 100, 100);
    if (frameCount % 60 == 0 && timer > 0) {
      timer--;
    }
    if (timer == 0) {
      text("You Lost!", width / 2, height / 5 + 50);

    }
  }
}
