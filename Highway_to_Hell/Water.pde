class Water {
  float waterX, waterY;
  float waterYSpeed, waterXSpeed;
  float travelSpeed;
  float waterSize;
  boolean water = false;
  color clr; // added variable color
  float travelDistance;

  Water() {
    waterSize = 20;
    waterYSpeed = -7;
    waterXSpeed = -7;
    travelSpeed = 7;
    waterX = -1000;
    waterY = -1000;
    clr = (#5091f5); // Converted RGB to hex
  }

  void shoot(float startX, float startY) {
    water = true;
    travelDistance = 0;
    waterX = startX;
    waterY = startY;
  }

  void update() {

    if (water == true) {
      waterY += waterYSpeed;
      waterX += waterXSpeed;
      travelDistance += abs(travelSpeed);
    }

    if (travelDistance > 300) {
      water = false;
      waterX = -1000;
      waterY = -1000;
    }

    if (water == false) {
      waterX = -1000;
      waterY = -1000;
    }
  }

  void draw () {
    if (water) {
      bubbles.x0 = waterX;
      bubbles.y0 = waterY;
      bubbles.emit(42);

      circle(waterX, waterY, waterSize);
    }
  }
}
