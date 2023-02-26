class WaterAi {
  float waterAiLocation = 1;
  float x, y, vx, vy;
  float startWaterAiX;
  float startWaterAiY;
  float diameter;
  boolean water = false;
  color clr; // added variable color

  WaterAi() {
    diameter = 15;
    vx = 0;
    vy = -7;
    clr = (#5091f5); // Converted RGB to hex
  }

  void update() {
    if (water) {
      waterAiLocation += vy;
    }
    if (waterAiLocation <= -height) {
      waterAiLocation = 0;
      water = false;
    }
  }

  void draw () {

    if (water) {
      x = startWaterAiX;
      y = startWaterAiY;
      fill(clr); // see variable
      circle(x, y + waterAiLocation, diameter);
    }
  }
}
