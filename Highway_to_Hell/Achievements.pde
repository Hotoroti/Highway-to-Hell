class Achievements {

  int popupX = 1300;
  int popupY = 800;
  int popupW = 300;
  int popupH = 100;
  int achievementX = 250;
  int achievementY;
  int achievementW = 200;
  int achievementH = 250;

  int nAchievements = 4;

  boolean[] Achievements = new boolean[nAchievements];

  String[] Names = {"Experimentalist", "Scientist", "Murderer", "Pacifist"};
  String[] Descriptions = {"Try all elements", "Make all reactions", "Kill 15 enemies", "Kill nobody for 5 minutes"};

  int[] FrameCounters = new int[nAchievements];

  boolean hasUsedFire = false;
  boolean hasUsedWater = false;
  boolean hasUsedEarth = false;

  boolean hasMadeSteam = false;
  boolean hasMadeLava = false;
  boolean hasMadeMud = false;

  int pacifistCounter = 0;

  final float xPosition = width * 0.25;




  void update() {
    achievementY = height/3;
    if (Achievements[3] == false && thePlayer.enemieskilled == 0) {
      pacifistCounter++;
    }
    if (pacifistCounter == 18000 && thePlayer.enemieskilled == 0) {
      Achievements[3] = true;
    }

    if (thePlayer.enemieskilled >= 15) {
      Achievements[2] = true;
    }

    if (hasUsedFire && hasUsedWater && hasUsedEarth) {
      Achievements[0] = true;
    }

    if (hasMadeSteam && hasMadeLava && hasMadeMud) {
      Achievements[1] = true;
    }
  }

  void draw() {
    for (int i = 0; i < nAchievements; i++) {
      if (Achievements[i] && FrameCounters[i] <= 300) {
        fill(0);
        rect(popupX, popupY, popupW, popupH);
        fill(255);
        rect(popupX+10, popupY+10, popupW-20, popupH-20);
        fill(0);
        textSize(12);
        text("ACHIEVEMENT UNLOCKED", popupX+20, popupY+40);
        textSize(10);
        text(Names[i], popupX+20, popupY+70);
        FrameCounters[i]++;
        if (FrameCounters[i] == 1) {
          Properties props = new Properties();
          props.setProperty("user", "muijded2");
          props.setProperty("password", "E+6wWY#JBdl8IU");
          SQLConnection myConnection = new MySQLConnection("jdbc:mysql://oege.ie.hva.nl/zmuijded2?serverTimezone=UTC", props);
          insertNewAchievement(myConnection);
          playerHasAchievement(myConnection, i+1);
        }
      }
    }
    if (showAchievements == true) {
      background(0);
      textSize(64);
      fill(255);
      text("ACHIEVEMENTS", xPosition, height * 0.15);
      for (int i = 0; i < nAchievements; i++) {
        if (Achievements[i] == false) {
          drawLockedAchievement(achievementX + 300*i, achievementY-(120-i*40)+80);
        } else {
          drawUnlockedAchievement(achievementX + 300*i, achievementY-(120-i*40)+80, i);
        }
      }
      fill(255);
      textSize(32);
      text("Press R to restart", xPosition, height * 0.95 );
      text("Press X to put a new name", xPosition, height * 0.9 );

      //reset to welcome
      if (lastKey['r']) {
        showHighscore = false;
        welcome = true;
        end = false;
        imputName = false;
        showAchievements = false;
        thePlayer.hp = 100;
        thePlayer.score = 0;
        thePlayer.enemieskilled = 0;
        theHUD.healthColor = #00FF00;
        computerCars.clear();
        amountOfCars = 0;
      }
      //NameInput
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


  void playerHasAchievement(SQLConnection connection, int Number)
  {      
    String name = theNameInput.sname;
    connection.updateQuery("INSERT INTO Players (PlayerName, PlayerID) VALUES (\"" + name + "\", " + PlayerId +" ); ");
    connection.updateQuery("INSERT INTO Players_has_Achievements (Players_PlayerID, Achievements_AchievementID) VALUES (\"" + PlayerId + "\", " + Number +"); ");
  }

  void insertNewAchievement(SQLConnection connection)
  {
    for (int i = 1; i < nAchievements+1; i++) {
      connection.updateQuery("INSERT INTO Achievements (AchievementName, AchievementID) VALUES (\"" + Names[i-1] + "\", " + i +" ); ");
    }
  }

  void drawLockedAchievement(int x, int y) {
    fill(255);
    rect(x, y, achievementW, achievementH);
    textSize(32);
    text("LOCKED", x, y-5);
    image(padlock, x, y+25);
  }

  void drawUnlockedAchievement(int x, int y, int z) {
    fill(125);
    rect(x, y, achievementW, achievementH);
    textSize(32);
    text(Names[z], x, y-5);
    image(AchievementImg[z], x, y+25);
    textSize(16);
    text(Descriptions[z], x, y+270);
  }
}
