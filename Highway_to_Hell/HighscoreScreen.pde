class HighScoreScreen {

  final float xPosition = width * 0.38, yPosition = height * 0.34;
  final float xPositionHighscore = width * 0.51;
  final float xPositionRank = width*0.25;

  void draw() {
    Properties props = new Properties();
    props.setProperty("user", "hogerws");
    props.setProperty("password", "z0B/jJ4rNBwLOH");
    SQLConnection myConnection = new MySQLConnection("jdbc:mysql://oege.ie.hva.nl/zhogerws?serverTimezone=UTC", props);

    if (showHighscore) {
      background(0);
      textSize(32);
      fill(255);
      showHighscores(myConnection);

      textSize(60);
      text("Highscore", width/3, height * 0.20);

      fill(0);
      rect(0, height* 0.86, width, height);

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

  void showHighscores(SQLConnection connection)
  {
    Table highscores = connection.runQuery("SELECT p.Name, h.score FROM Highscore AS h INNER JOIN Player AS p ON p.PlayerID = h.Player_PlayerID ORDER BY score DESC;");
    text("NAME", xPosition, yPosition);
    text("HIGHSCORE", xPositionHighscore, yPosition);
    text("RANK", xPositionRank, yPosition);
    text("1", xPositionRank, height * 0.40);
    text("2", xPositionRank, height * 0.45);
    text("3", xPositionRank, height * 0.50);
    text("4", xPositionRank, height * 0.55);
    text("5", xPositionRank, height * 0.60);
    text("6", xPositionRank, height * 0.65);
    text("7", xPositionRank, height * 0.70);
    text("8", xPositionRank, height * 0.75);
    text("9", xPositionRank, height * 0.80);
    text("10", xPositionRank, height * 0.85);
    text("_______________________", xPositionRank, height * 0.35);

    for (int  i =0; i < highscores.getRowCount(); i++) //check alle rijen(horizontale waarde) in mijn tabel
    {
      TableRow row = highscores.getRow(i); //get the row at index 0
      text(row.getString(0), xPosition, yPosition + (i+1)*50);
      text(row.getString(1), xPositionHighscore, yPosition + (i+1)*50);
    }
  }
}
