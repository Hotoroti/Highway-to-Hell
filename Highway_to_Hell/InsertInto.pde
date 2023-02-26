class InsertInto {

  void draw() {
    Properties props = new Properties();
    props.setProperty("user", "hogerws");
    props.setProperty("password", "z0B/jJ4rNBwLOH");
    SQLConnection myConnection = new MySQLConnection("jdbc:mysql://oege.ie.hva.nl/zhogerws?serverTimezone=UTC", props);
    insertNewHighscore(myConnection);
    insertNewDeathmarker(myConnection);
  }
  void insertNewHighscore(SQLConnection connection)
  {
    String name = theNameInput.sname;
    int value = (int)thePlayer.score;

    //PlayerName
    connection.updateQuery("INSERT INTO Player (Name, PlayerID) VALUES (\"" + name + "\", " + PlayerId +" ); ");

    //Highscore
    connection.updateQuery("INSERT INTO Highscore (score, Player_PlayerID) VALUES (\"" + value + "\", " + PlayerId +"); ");
  }
  void insertNewDeathmarker(SQLConnection connection)
  {
    theDeathmarker.chooseOfDeathmarker();
    int xPos = (int)thePlayer.x; //The xPos of player death
    int yPos = (int)thePlayer.y; //yPos of player death
    int deathmarkerId = (int)random(0, 999999999); //the ID of the deathmarker

    int value = (int)thePlayer.score; //Same as Highscore

    String element = theDeathmarker.elementName; //Element player choose
    String kleur = theDeathmarker.colorName; // color player choose
    int colorId =  theDeathmarker.chooseColorId; //ID of the color + element

    //Color
    connection.updateQuery("INSERT INTO Kleur ( Color, Element, ColorID) VALUES (\"" + kleur + "\",\"" + element + "\", \"" + colorId + "\" );"); 

    //DeathmarkerPos
    connection.updateQuery("INSERT INTO Deathmarker ( DeathmarkerID,xPos, yPos, H_score , K_ColorID) VALUES (\"" + deathmarkerId + "\", " + xPos +", " + yPos +", " + value +" , " + colorId +"); ");
  }
}
