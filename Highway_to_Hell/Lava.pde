class Lava {
  int lavaAantal = 3;
  boolean lava = false;
  float lavaLocation = 0;
  float[] lavaX = new float[3];
  float[] lavaY = new float[3];
  float[] lavaDiameter = new float[3];
  float[] startLavaX = new float[3];
  float[] startLavaY = new float[3];

  int lavaSpeed = 2;
  long tickNow, tickLast, ticks = 1000;

  Lava() {
    lavaDiameter[0] = 50;
    lavaDiameter[1] = 40;
    lavaDiameter[2] = 30;
  }


  void update() {
    for (int i = 0; i < lavaAantal; i++) {
      if (!lava) {
        lavaLocation = 0;
      } else {
        lavaLocation += lavaSpeed;
      }

      if (lavaY[i] >= height) {
        lavaLocation = 0;
        lava = false;
      }
    }
  }

  void draw() {
    if (!lava) {
      startLavaX[0] = thePlayer.x;
      startLavaX[1] = thePlayer.x + 30;
      startLavaX[2] = thePlayer.x - 20;
      startLavaY[0] = theAarde.wallY + theAarde.wallLocation + lavaDiameter[0];
      startLavaY[1] = theAarde.wallY + theAarde.wallLocation + lavaDiameter[1]; 
      startLavaY[2] = (theAarde.wallY - 20) + theAarde.wallLocation + lavaDiameter[2];
    } else {
      for (int i = 0; i < lavaAantal; i++) {
        fill(0, 0, 0, 0);
        lavaX[i] = startLavaX[i];
        lavaY[i] = startLavaY[i];

        image(lavaCircle1, lavaX[0], lavaY[0] + lavaLocation);
        image(lavaCircle2, lavaX[1], lavaY[1] + lavaLocation);
        image(lavaCircle3, lavaX[2], lavaY[2] + lavaLocation);
        circle(lavaX[i], lavaY[i] + lavaLocation, lavaDiameter[i]);
      }
    }
  }
}
