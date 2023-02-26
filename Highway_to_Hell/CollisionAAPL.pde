class CollisionAAPL {

  float X1, xStraal, yStraal, Straal, Y1, X2, Y2, H, W; 

  void update() {

    X1 = thePlayer.x;
    Y1 = thePlayer.y;
    for (int i = 0; i<nElements; i++) {
      X2 = theAarde.wallX;
      Y2 = theAarde.wallY +theAarde.wallLocation;
      W = theAarde.wallW;
      H = theAarde.wallH;
    }

    //collision Steen/Player
    for (int i = 0; i<nElements; i++) {
      if (theAarde.wall == true) {
        if (checkCollisionA1(X1, Y1, X2, Y2, W, H)) {
          thePlayer.ySpeed *= -1; 
          thePlayer.clr = (#ff0000);
        } else if (checkCollisionA2(X1, Y1, X2, Y2, W, H )) {
          thePlayer.ySpeed *= -1;
          thePlayer.y = (theAarde.wallY + theAarde.wallH + theAarde.wallLocation);
          thePlayer.clr = (#FAF208);
        } else if (checkCollisionA3(X1, Y1, X2, Y2, W, H )) {
          thePlayer.xSpeed *= -1;
          thePlayer.clr = (#FF039A);
        } else if (checkCollisionA4(X1, Y1, X2, Y2, W, H )) {
          thePlayer.xSpeed *= -1;
          thePlayer.clr = (#03F4FF);
        } else {
          thePlayer.ySpeed = theConfig.PLAYERSTARTSPEED;
          thePlayer.xSpeed = theConfig.PLAYERSTARTSPEED;
        }
      }
    }
  }



  // collision Aarde/Player
  //Boven
  boolean checkCollisionA1(float X1, float Y1, float X2, float Y2, float W, float H ) {
    if (X1 > (X2+W*0.1) && X1 < (X2+W*0.9) && Y1  > Y2 && Y1  <Y2+(H/2)) {
      return true;
    } else {
      return false;
    }
  }
  //Onder
  boolean checkCollisionA2(float X1, float Y1, float X2, float Y2, float W, float H ) {
    if (X1 > (X2+W*0.1) && X1 < (X2+W*0.9) && Y1  < (Y2 +H +1) && Y1  >Y2+(H/2)) {
      return true;
    } else {
      return false;
    }
  }
  //Rechts
  boolean checkCollisionA3(float X1, float Y1, float X2, float Y2, float W, float H ) {
    if (X1 - 25 > (X2+W*0.9) && X1 - 25 < (X2+W+1) && Y1 < (Y2 +H) && Y1>Y2) {
      return true;
    } else {
      return false;
    }
  }
  //Links
  boolean checkCollisionA4(float X1, float Y1, float X2, float Y2, float W, float H ) {
    if (X1 + 25 > (X2 -1) && X1 + 25 < (X2+W*0.1) && Y1 < (Y2 +H) && Y1>Y2) {
      return true;
    } else {
      return false;
    }
  }
}
