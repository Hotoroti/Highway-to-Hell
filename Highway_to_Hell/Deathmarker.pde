class Deathmarker {
  int chooseColorId;
  String elementName, colorName;

  void draw() {
    Properties props = new Properties();
    props.setProperty("user", "hogerws");
    props.setProperty("password", "z0B/jJ4rNBwLOH");
    SQLConnection myConnection = new MySQLConnection("jdbc:mysql://oege.ie.hva.nl/zhogerws?serverTimezone=UTC", props);
    //showDeathmarker(myConnection);
  }

  void showDeathmarker(SQLConnection connection)
  {
    Table deathmarker = connection.runQuery("SELECT d.xPos, d.yPos, k.Color, h.score FROM Deathmarker AS d INNER JOIN Highscore AS h ON h.score = d.H_score INNER JOIN Kleur AS k ON k.ColorID = d.K_ColorID;");

    for (int  i =0; i < deathmarker.getRowCount(); i++) //check alle rijen(horizontale waarde) in mijn tabel
    {
      TableRow xPos = deathmarker.findRow("d.xPos", i);
      TableRow yPos = deathmarker.findRow("d.yPos", i);
      circle(xPos.getFloat(0), yPos.getFloat(0), 50);
      circle(xPos.getFloat(1), yPos.getFloat(1), 50);
    }
  }
  void chooseOfDeathmarker() {
    if (theMenu.currentPick == 0) {
      chooseColorId = (int)random(0, 333333333);
      elementName = "Earth";
      colorName = "Bruin";
    }
    if (theMenu.currentPick == 1) {
      chooseColorId = (int)random(333333334, 666666666);
      ;
      elementName = "vuur";
      colorName = "Rood";
    } 
    if (theMenu.currentPick == 2) {
      chooseColorId = (int)random(666666667, 999999999);
      elementName = "Water";
      colorName = "Blauw";
    }
  }
}
