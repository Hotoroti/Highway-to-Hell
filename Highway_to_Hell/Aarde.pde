class Aarde {
  float wallLocation = 1;
  float wallX;
  float wallY;
  float wallW;
  float wallH;
  float startWallX;
  float startWallY;
  float wallSpeed;
  boolean wall = false;
  color clr;
  float xPlayer, yPlayer, xAiF, yAiF, xAa, yAa, hAa, wAa, xAiW, yAiW, xAiE, yAiE;
  Aarde() {
    wallW = 100;
    wallH = 30;
    wallSpeed = 1;
    clr = (#955500);
  }

  void update() {
    xPlayer = width/2;
    yPlayer = thePlayer.y;  
    xAa = theAarde.wallX;
    yAa = theAarde.wallY + theAarde.wallLocation;
    wAa = theAarde.wallW;
    hAa = theAarde.wallH;

    if (wall) {
      wallLocation += wallSpeed;
    }
    if (wallLocation >= height) {
      wallLocation = 0;
      wall = false;
    }
  }

  void draw() {
    if (wall) {
      wallX = startWallX;
      wallY = startWallY;
      fill(0, 0, 0, 0);
      image(muur, wallX + 50, wallY + wallLocation);
      rect(wallX, wallY + wallLocation, wallW, wallH);
    }
  }
}
