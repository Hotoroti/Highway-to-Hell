class CPU {

  float yPos; // y pos CPU 
  float xPos; // x pos CPU 
  float ySpeed; // y Speed CPU 
  float xSpeed; // x speed CPU 
  color clr; // color CPU 
  final float Size;
  int direction;
  int passedTime;
  float frameCounter;
  float shootTimer;
  int action;
  int elementFire;
  int hp;
  boolean CPU = true;
  float CPUDownTime = 0;
  PImage car = noCar;

  int crunch;

  int CPUElementDecider;
  boolean fireCPU = false;
  boolean waterCPU = false;
  boolean earthCPU = false;
  float sx, sy; //Place on screen, sx = xpos on screen

  CPU() {
    //totalTime = 20;
    frameCounter = 0;
    crunch = height - 30;
    shootTimer = 0;
    yPos = random(height - 50, height - 150);
    xPos = random(100, 1500);
    Size = 50;
    clr = color(#7224C6);
    hp = 100;
    CPUElementDecider = (int)random(0, 3);
    if (CPUElementDecider == 0) {
      fireCPU = true;
    } else if (CPUElementDecider == 1) {
      waterCPU = true;
    } else if (CPUElementDecider == 2) {
      earthCPU = true;
    }
    // savedTime = millis();
  }



  void update() {
    sx = xPos - cameraX;
    sy = yPos - cameraY;

    frameCounter++;
    elementFire++;
    if (frameCounter == 20) {
      frameCounter = 0; 
      action = (int)random(0, 7);
    } else {
      switch(action) {
      case 0:
        setCarDirection(5, -1);
        break;
      case 1:
        setCarDirection(-5, -1);
        break;
      case 2:
        setCarDirection(0, -1);
        break;
      case 3:
        setCarDirection(5, 0);
        break;
      case 4:
        setCarDirection(-5, 0);
        break;
      case 5:
        setCarDirection(0, 0);
        break;
      case 6:
        setCarDirection(5, 1);
        break;
      case 7:
        setCarDirection(-5, 1);
        break; 
      default:
        // does nothing
      }
    } 

    shootTimer++;
    if (shootTimer >= 300) {
      shoot();
      shootTimer = 0;
    }

    findClosestCar(computerCars);

    xPos = constrain(xPos, theBackground.roadX, theBackground.roadX + theBackground.roadPartWidth);
    yPos = constrain(yPos, 25, height- Size/2);
  }

  void shoot() {
    if (fireCPU) {
      theVuur[currentFire].shoot(xPos, yPos-50);
    } else if (waterCPU) {
      theWater[currentWater].shoot(xPos, yPos-50);
    } else if (earthCPU) {
      if (theAarde.wall == false) {
        theAarde.startWallX = xPos - theAarde.wallW/2;
        theAarde.startWallY = yPos + theAarde.wallH/2;
        theAarde.wall = true;
        currentEarth++;
      }
    }
  }

  void findClosestCar(ArrayList<CPU> cars) {
    for (int i = 0; i < cars.size(); i++) {
      if ( cars.get(i).yPos == yPos ) {
        // is on the same Y axis
        return;
      } else if (makePositive(computerCars.get(i).xPos, xPos) < 100) {
        float result = makePositive(computerCars.get(i).xPos, xPos);
        //println(result);
      }
    }
  }


  float makePositive(float carPosition, float ownPosition) {
    float difference = carPosition - ownPosition;
    if (carPosition >= 0) {
      return difference;
    } else {
      // returns negative, should return positive
      return Math.abs(difference);
    }
  }

  void draw() {
    //fill(clr);
    if (CPU == true) {
      if (readyForCrunch) {
        for (int i = 0; i<computerCars.size(); i++) {
          if (thePlayer.y - theConfig.SIZE/2 >= crunch) {
            thePlayer.hp = 0;
          } else if (computerCars.get(i).yPos - theConfig.SIZE/2 >= crunch) {
            computerCars.get(i).hp = 0;
            thePlayer.score += 50;
          }
        }
      }

      noFill();
      imageMode(CENTER);
      if (fireCPU) {
        image(AIfire, xPos+5, yPos+10, 100, 100);
      }
      if (waterCPU) {
        image(AIwater, xPos+5, yPos+10, 100, 100);
      }
      if (earthCPU) {
        image(AIearth, xPos+5, yPos+10, 100, 100);
      }
      //image(car, xPos+5, yPos + 10, 100, 100);
      circle(xPos, yPos, Size); // teken begincirkel
      if (hp < theConfig.HPCPU) {
        fill(#FF4646);
        rect(xPos - 50, yPos - 50, 100, 10);
        fill(#00ff00);
        rect(xPos- 50, yPos - 50, hp, 10);
      }
    }
    if (hp <= 0) {
      thePlayer.enemieskilled += 1;
      CPU = false;
      CPUDownTime++;
      if (CPUDownTime == 100) {
        hp = 100;
        CPUDownTime = 0;
        CPU = true;
      }
    }
  }

  void setCarDirection(int xDirection, int yDirection) {    
    xPos = xPos + xDirection;
    yPos = yPos + yDirection;
  }
}
