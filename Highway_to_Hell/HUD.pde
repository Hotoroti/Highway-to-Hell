class HUD {
  float rectWidth;    
  color healthColor;

  float drawWidth;
  String healthMessage;
  String scoreMessage;

  HUD() {
    rectWidth = 200;
    healthColor = #00FF00;
  }

  void setHealth() {
    if (thePlayer.hp > 0) {
      thePlayer.setHealth();
      setHealthColor();
    } else {
      // placeholder  gameover text
      textSize(128);     
      fill(255);
      text("YOU DIED", width/4, height/2);
    }
  }

  void drawHealth() {
    // outline
    fill(0);
    rect(1348, 58, rectWidth + 4, 54, 20);

    //healthbar
    drawWidth = (thePlayer.hp / theConfig.HPPLAYER) * rectWidth;
    fill(healthColor);
    noStroke();
    rect(1350, 60, drawWidth, 30, 16);

    // text
    healthMessage = (int)thePlayer.hp + " / " + (int)theConfig.HPPLAYER;
    fill(255);
    textSize(12);
    text(healthMessage, 1370, 105);
  }

  void setHealthColor() {  
    if (thePlayer.hp < 25) {
      healthColor = #FF0000;
    } else if (thePlayer.hp < 50) {
      healthColor = #FFC800;
    } else {
      healthColor = #00FF00;
    }
  }

  void drawScore() {
    // Score bar
    fill(0);
    rect(1348, 120, rectWidth + 4, 54, 20);

    // text
    scoreMessage = "Score: " + thePlayer.score;
    fill(255);
    textSize(12);
    text(scoreMessage, 1370, 152.5);
  }

  void draw() {
    drawHealth();
    drawScore();
  }
}
