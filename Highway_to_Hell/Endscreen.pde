class EndScreen {
  int frameCounter = 0;
  void draw() {
    theBackground.draw();
    frameCounter++;
    theCPU.CPU = false;
    savePosition = true;
    playerMovement = false;
    if (frameCounter == 60) {
      theInsertInto.draw();
    }
    fill(255);
    textSize(80);
    text("Game Over", width/2 - 200, 225);
    textSize(30);
    text("Score: " +thePlayer.score, width/2 - 200, height * 0.40);
    text("KilledEnemies: " + thePlayer.enemieskilled/100, width/2 - 200, height * 0.50);
    fill(random(0, 255), random(0, 255), random(0, 255));
    text("Press R to restart", width/ 2 - 200, height * 0.80);
    text("Press X to put a new name", width/ 2 - 200, height * 0.90);
    text("Press SPACE for HighScore", width/2-200, height * 0.70);
    text("Press A for Achievements", width/2-200, height * 0.60);


    //GoToAchievements
    if (lastKey['a']) {
      end = false;
      welcome = false;
      imputName = false;
      showHighscore = false;
      showAchievements = true;
    }

    //GoToHighScore
    if (lastKey[32]) {
      end = false;
      welcome = false;
      imputName = false;
      showHighscore = true;
      showAchievements = false;
    }

    //reset
    if (lastKey['r']) {
      welcome = true;
      end = false;
      imputName = false;
      showHighscore = false;
      showAchievements = false;
      thePlayer.hp = 100;
      thePlayer.score = 0;
      thePlayer.enemieskilled = 0;
      theHUD.healthColor = #00FF00;
      computerCars.clear();
      amountOfCars = 0;
    }

    //nameInput
    if (lastKey['x']) {
      welcome = false;
      end = false;
      imputName = true;
      showHighscore = false;
      showAchievements = false;
      //ResetOfHUD
      thePlayer.hp = 100;
      thePlayer.score = 0;
      thePlayer.enemieskilled = 0;
      theHUD.healthColor = #00FF00;
      //ResetOfCars
      computerCars.clear();
      amountOfCars = 0;
      //ResetOfNameInput
      theNameInput.letter1 = true;
      theNameInput.letter2 = false;
      theNameInput.letter3 = false;
      theNameInput.letter4 = false;
      theNameInput.letterA = ' ';
      theNameInput.letterB = ' ';
      theNameInput.letterC = ' ';
      theNameInput.letterD = ' ';
    }
  }
}
