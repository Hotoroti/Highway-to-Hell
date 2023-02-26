class Steam {
  float steamX, steamY;
  float steamSize;
  boolean steam = false;

  boolean mist = false;
  int alphaMist;

  boolean collisionWithPlayer(float x0, float x1, float y0, float y1, float r0, float r1) {
    float dx = x1 - x0;
    float dy = y1 - y0;
    float afstand = sqrt(dx*dx + dy*dy);
    return (afstand <= r0 + r1);
  }

  Steam() {
    steamSize = 50;
  }

  void spawn(float startX, float startY) {
    steam = true;
    steamX = startX;
    steamY = startY;
    currentSteam++;
  }

  void update() {
    if (steam) {
      steamSize -= 0.2;
    }
    if (steamSize <= 0) {
      steam = false;
    }
    if (steam == false) {
      steamSize = 50;
    }
  }

  void draw() {
    if (steam) {
      imageMode(CENTER);
      image(steamImg, steamX, steamY, steamSize, steamSize);
      if (collisionWithPlayer(steamX, thePlayer.x, steamY, thePlayer.y, steamSize/2, thePlayer.Size/2)) {
        steam = false;
        mist = true;
        alphaMist = 250;
      }
    }
    if (mist) {
      fill(125, 125, 125, alphaMist);
      rect(0, 0, width, height);
      alphaMist--;
      if (alphaMist <= 0) {
        mist = false;
      }
    }
  }
}
