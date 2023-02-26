class Backgrounds {

  int frameCounter = 0;
  int maxFrameCounter = 12;

  int frameCounterScore = 0;

  int nRoadParts;
  float roadX;
  float roadY;
  float roadPartWidth;
  float roadPartHeight;
  float roadStripeWidth;
  float roadStripeLength;
  float roadStripeDistance;
  float lavaStripeWidth;
  float lavaStripeLength;
  float lavaStripeDistance;
  int firstRoadStripeHeight;
  int firstLavaStripeHeight;
  int roadSpeed;
  int lavaSpeed;
  long tickNow, tickLast, ticks = 1000;

  float[] roadLeft;

  Backgrounds() {
    nRoadParts = 60;
    roadPartWidth = width/3;
    roadPartHeight = 30;
    roadStripeWidth = 20;
    roadStripeLength = 80;
    roadStripeDistance = 70;
    lavaStripeWidth = width;
    lavaStripeLength = 80;
    lavaStripeDistance = 150;
    firstRoadStripeHeight = 0;
    firstLavaStripeHeight = 0;
    roadSpeed = 10;
    lavaSpeed = 5;
    roadLeft = new float[nRoadParts];
  }

  void update() {
    firstRoadStripeHeight = firstRoadStripeHeight + roadSpeed;
    firstLavaStripeHeight = firstLavaStripeHeight + lavaSpeed;
    if (firstRoadStripeHeight >= roadStripeLength + roadStripeDistance) {
      firstRoadStripeHeight = 0;
    }
    if (firstLavaStripeHeight >= lavaStripeLength + lavaStripeDistance) {
      firstLavaStripeHeight = 0;
    }
  }

  void draw() {
    imageMode(CORNER);
    image(lavaImg, 0, 0);

    for (int iRoadPart=0; iRoadPart<nRoadParts; iRoadPart++) {
      float sx = roadX - cameraX, sy = roadY - cameraY; //Place on screen, sx = xpos on screen
      roadY = iRoadPart*roadPartHeight;
      float noise = noise(iRoadPart*roadPartHeight/700 - frameCount/100.0);
      roadX = map(noise, 0.25, 1.25, width/6, width/8*6);
      fill(0);
      rect(sx, sy - height/2, roadPartWidth, roadPartHeight); //Everywere sx;sy
      roadLeft[iRoadPart] = roadX;
      if (frameCounter < maxFrameCounter/3) {
        if (iRoadPart%3 == 0 || iRoadPart%3 == 1) {
          fill(255, 255, 0);
          rect(sx + roadPartWidth/2 - roadStripeWidth/2, sy - height/2, roadStripeWidth, roadPartHeight);
        }
      } else if (frameCounter < maxFrameCounter/3*2) {
        if (iRoadPart%3 == 1 || iRoadPart%3 == 2) {
          fill(255, 255, 0);
          rect(sx + roadPartWidth/2 - roadStripeWidth/2, sy - height/2, roadStripeWidth, roadPartHeight);
        }
      } else if (frameCounter < maxFrameCounter) {
        if (iRoadPart%3 == 0 || iRoadPart%3 == 2) {
          fill(255, 255, 0);
          rect(sx + roadPartWidth/2 - roadStripeWidth/2, sy - height/2, roadStripeWidth, roadPartHeight);
        }
      }
    }
    frameCounter++;
    if (frameCounter == maxFrameCounter) {
      frameCounter = 0;
    }
    frameCounterScore++;
  }

  boolean checkCollision(Player player) {
    float playerLeft = thePlayer.x - theConfig.SIZE/2;
    float playerRight = thePlayer.x + theConfig.SIZE/2;
    float location = roadLeft[(int)map(thePlayer.y, 0, height, 0, nRoadParts)];
    if (playerLeft < location) {
      startScreenshake();
      tickNow = millis();
      if (tickNow > (tickLast + ticks)) {
        thePlayer.hp -= theConfig.OFFROADDMG;
        tickLast = tickNow;
      }
      player.xSpeed = 2;
      player.ySpeed = 2;
      if (welcome || end || imputName || showHighscore || showAchievements) {
        thePlayer.score += 0;
        frameCounterScore = 0;
      } else {
        if (frameCounterScore == 60) {
          thePlayer.score += 1;
          frameCounterScore = 0;
        }
      }
      return true;
    } else if (playerRight > location+roadPartWidth) {
      startScreenshake();
      tickNow = millis();
      if (tickNow > (tickLast + ticks)) {
        thePlayer.hp -= theConfig.OFFROADDMG;
        tickLast = tickNow;
      }
      player.xSpeed = 2;
      player.ySpeed = 2;
      if (welcome || end || imputName || showHighscore || showAchievements) {
        thePlayer.score += 0;
        frameCounterScore = 0;
      } else {
        if (frameCounterScore == 60) {
          thePlayer.score += 1;
          frameCounterScore = 0;
        }
      }
      return true;
    }
    player.xSpeed = theConfig.PLAYERSTARTSPEED;
    player.ySpeed = theConfig.PLAYERSTARTSPEED;
    return false;
  }
}
