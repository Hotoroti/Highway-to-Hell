class CollisionAAAI {
  float xAi, yAi, xAa, yAa, hAa, wAa; 

  void update() {
    for (int i = 0; i<computerCars.size(); i++) {
      xAi = computerCars.get(i).xPos;
      yAi = computerCars.get(i).yPos;
      for (int j = 0; j<nElements; j++) {
        xAa = theAarde.wallX;
        yAa = theAarde.wallY + theAarde.wallLocation;
        wAa = theAarde.wallW;
        hAa = theAarde.wallH;
      }

      //collision Steen/Ai
      for (int j = 0; j<nElements; j++) {

        if (checkCollisionOnder(xAi, yAi, xAa, yAa, wAa, hAa )) {
          computerCars.get(i).ySpeed *= -1;
          computerCars.get(i).yPos = (theAarde.wallY + theAarde.wallH + theAarde.wallLocation);
          readyForCrunch = true;
        } else {
          computerCars.get(i).xSpeed = 1;
          computerCars.get(i).ySpeed = 1;
        }
      }
    }
  }

  // collision Aarde/Ai
  //Onder
  boolean checkCollisionOnder(float xAi, float yAi, float xAa, float yAa, float wAa, float hAa ) {
    if (xAi > xAa && xAi < xAa+wAa && yAi < yAa +hAa && yAi >yAa) {
      return true;
    } else {
      return false;
    }
  }
}
