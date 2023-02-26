class CollisionFIAA {

  float xFi, yFi, xAa, yAa, hAa, wAa; 

  void update() {
    for (int iVuur = 0; iVuur<nElements; iVuur++) {
      xFi = theVuur[iVuur].vuurX;
      yFi = theVuur[iVuur].vuurY;
      for (int j = 0; j<nElements; j++) {
        xAa = theAarde.wallX;
        yAa = theAarde.wallY + theAarde.wallLocation;
        wAa = theAarde.wallW;
        hAa = theAarde.wallH;
      }

      //collision Steen/Vuur
      for (int iLava = 0; iLava< nElements; iLava++) {
        if (checkCollision(xFi, yFi, xAa, yAa, wAa, hAa )) {
          theLava[iLava].lava = true;
          theAarde.wall = false;
          theVuur[iVuur].vuur = false;
          theAchievements.hasMadeLava = true;
        }
      }
    }
  }

  // collision Aarde/Vuur
  boolean checkCollision(float xFi, float yFi, float xAa, float yAa, float wAa, float hAa ) {
    if (xFi > xAa && xFi < xAa+wAa && yFi < yAa +hAa && yFi >yAa) {
      return true;
    } else {
      return false;
    }
  }
}
