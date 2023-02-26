class Mud {
  float mudX, mudY;
  float mudSpeed;
  float mudSize;
  boolean mud = false;
  color clr;
  float travelDistance;

  Mud() {
    mudSize = 50;
    mudSpeed = 10;
    mudX = -1000;
    mudY = -1000;
    clr = (#8B4D00);
  }

  void spawn(float startX, float startY) {
    mud = true;
    mudX = startX;
    mudY = startY;
    currentMud++;
  }

  void update() {
    if (mud == true) {
      mudY += mudSpeed;
    }

    if (mudY >= height || mudY <= 0) {
      mud = false;
      mudX = -1000;
      mudY = -1000;
    }
  }

  void draw() {
    if (mud) {
      fill(clr);
      circle(mudX, mudY, mudSize);
    }
  }
}
