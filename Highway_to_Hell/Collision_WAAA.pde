class CollisionWAAA {
  float xWa, yWa, xAa, yAa, hAa, wAa; 
  void update() {
    for (int iWater = 0; iWater<nElements; iWater++) {
      xWa = theWater[iWater].waterX;
      yWa = theWater[iWater].waterY;
      xAa = theAarde.wallX;
      yAa = theAarde.wallY + theAarde.wallLocation;
      wAa = theAarde.wallW;
      hAa = theAarde.wallH;

      //collision Steen/Vuur
      for (int iMud = 0; iMud< nElements; iMud++) {
        if (checkCollision(xWa, yWa, xAa, yAa, wAa, hAa )) {
          theMud[currentMud].spawn(xWa, yWa);
          theAarde.wall = false;
          theWater[iWater].water = false;
          theAchievements.hasMadeMud = true;
        }
      }
    }
  }

  // collision Aarde/Vuur
  boolean checkCollision(float xWa, float yWa, float xAa, float yAa, float wAa, float hAa ) {
    if (xWa > xAa && xWa < xAa+wAa && yWa < yAa +hAa && yWa >yAa) {
      return true;
    } else {
      return false;
    }
  }
}
