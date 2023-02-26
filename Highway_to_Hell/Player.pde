class Player {
  float hp;
  float x; // x pos Player
  float y; // y pod Player
  float Size;
  float xSpeed; //x Speed Player
  float ySpeed; // y Speed player
  float vx, vy;
  color clr; // color player
  PImage car;
  int xDirection;
  int yDirection;
  int score;
  int enemieskilled;
  long vuurnowpress, vuurlastpress, vuurcooldown = 1000;
  long waternowpress, waterlastpress, watercooldown = 1000;
  String playerMode;
  float sx, sy; //Place on screen, sx = xpos on screen
  int frameCounter = 0;

  Player(String mode) {
    Size = 50;
    x = width/2;
    y = height/2;
    xSpeed = 5;
    ySpeed = 5;
    vx = 0;
    vy = 0;
    car = carDecider(mode);
    hp = 100;
    score = 0;
    enemieskilled = 0;
    playerMode = mode;
  }

  void update() {
    vy *= 0.9;
    vx *= 0.9;
    frameCounter++;
    //camera
    cameraX = x-width/2;
    cameraY = y - height/2;
    sx = x - cameraX;
    sy = y - cameraY;


    //controls
    if (playerMovement) {
      if (keysPressed[UP]) {
        vy = -1;
      }
      if (keysPressed[DOWN]) {
        vy = 1;
      }
      if (keysPressed[LEFT]) {
        vx = -1;
      }
      if (keysPressed[RIGHT]) {
        vx = 1;
      }
    }
    if (keysPressed[' ']) {
      if (playerMode == "Aarde") {
        if (theAarde.wall == false) {
          theAarde.startWallX = thePlayer.x - theAarde.wallW/2;
          theAarde.startWallY = thePlayer.y + theAarde.wallH/2;
          theAarde.wall = true;
          currentEarth++;
          if (vx == 1) {
            theAarde.startWallX = thePlayer.x + theAarde.wallW/2;
            theAarde.startWallY = thePlayer.y;
            theAarde.wall = true;
            currentEarth++;
          }
          if (vx == -1) {
            theAarde.startWallX = thePlayer.x - theAarde.wallW*1.5;
            theAarde.startWallY = thePlayer.y;
            theAarde.wall = true;
            currentEarth++;
          }
        }
      } else if (playerMode == "Vuur") {
        vuurnowpress = millis();
        if (vuurnowpress > (vuurlastpress + vuurcooldown)) {
          if (theVuur[currentFire].vuur == false) {
            if (vy == -1 || yDirection == 0) {
              theVuur[currentFire].vuurYSpeed = -(int)theConfig.VUURSPEED;
              theVuur[currentFire].vuurXSpeed = 0;
              theVuur[currentFire].shoot(x, y-60);
            }
            if (vy == 1) {
              theVuur[currentFire].vuurYSpeed = (int)theConfig.VUURSPEED;
              theVuur[currentFire].vuurXSpeed = 0;
              theVuur[currentFire].shoot(x, y+80);
            }
            if (vx == 1) {
              theVuur[currentFire].vuurXSpeed = (int)theConfig.VUURSPEED;
              theVuur[currentFire].vuurYSpeed = 0;
              theVuur[currentFire].shoot(x + 60, y);
            }
            if (vx == -1) {
              theVuur[currentFire].vuurXSpeed = -(int)theConfig.VUURSPEED;
              theVuur[currentFire].vuurYSpeed = 0;
              theVuur[currentFire].shoot(x - 80, y);
            }
          }
          vuurlastpress = vuurnowpress;
        }
      } else if (playerMode == "Water") {
        waternowpress = millis();
        if (waternowpress > (waterlastpress + watercooldown)) {
          if (theWater[currentWater].water == false) {
            if (vy == -1 || yDirection == 0) {
              theWater[currentWater].waterYSpeed = -(int)theConfig.WATERSPEED;
              theWater[currentWater].waterXSpeed = 0;
              theWater[currentWater].shoot(x, y-60);
            }
            if (vy == 1) {
              theWater[currentWater].waterYSpeed = (int)theConfig.WATERSPEED;
              theWater[currentWater].waterXSpeed = 0;
              theWater[currentWater].shoot(x, y+80);
            }
            if (vx == -1) {
              theWater[currentWater].waterXSpeed = -(int)theConfig.WATERSPEED;
              theWater[currentWater].waterYSpeed = 0;
              theWater[currentWater].shoot(x - 80, y);
            }

            if (vx == 1) {
              theWater[currentWater].waterXSpeed = (int)theConfig.WATERSPEED;
              theWater[currentWater].waterYSpeed = 0;
              theWater[currentWater].shoot(x + 60, y);
            }
          }
          waterlastpress = waternowpress;
        }
      }
    }

    y += vy * ySpeed;
    x += vx * xSpeed;

    if (welcome || end || imputName || showHighscore || showAchievements) {
      thePlayer.score += 0;
      thePlayer.enemieskilled += 0;
      frameCounter = 0;
    } 
    if (frameCounter == 60) {
      thePlayer.score += 2;
      frameCounter = 0;
    }


    hp = constrain(hp, 0, 100);
  }

  void setScore() {
    score += 10;
  }

  void setHealth() {
    hp -= 1;
  }
  void draw() {


    noFill();
    imageMode(CENTER);

    image(car, x+5, y + 10, 100, 100);
    circle(x, y, Size); // teken begincirkel
  }

  PImage carDecider(String mode) {
    if (mode == "Aarde") {
      theAchievements.hasUsedEarth = true;
      return earthCar;
    } else if (mode == "Vuur") {
      theAchievements.hasUsedFire = true;
      return fireCar;
    } else if (mode == "Water") {
      theAchievements.hasUsedWater = true;
      return waterCar;
    } else {
      return noCar;
    }
  }
}
