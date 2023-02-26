class Config {
  final float PLAYERSTARTSPEED = 5;
  final float SIZE = 50;
  final float XBORDER = 25;
  final float YBORDER = 25;
  final float YBORDERAIMIN = 300; 
  final float YBORDERAIMAX = 1300; 
  final float HPCPU = 100; 
  final float HPPLAYER = 100;
  final float VUURDMG = 25, WATERDMG = 20;
  final float WATERSPEED = 7, VUURSPEED = 10;
  final float LAVATICKDMG = 5;
  final int OFFROADDMG = 1;
  PFont prstartk;

  Config() {
    prstartk = createFont("resources/prstartk.ttf", 32);
    textFont(prstartk);
  }

  void update() {

    //constrain Player
    thePlayer.x = constrain(thePlayer.x, YBORDER, width - SIZE / 2);
    thePlayer.y = constrain(thePlayer.y, XBORDER, height - SIZE / 2);

    //Constrain Ai
    //constrain Ai
    theCPU.xPos = constrain(theCPU.xPos, YBORDERAIMIN, YBORDERAIMAX);
    theCPU.yPos = constrain(theCPU.yPos, XBORDER, height- SIZE/2);  

    //Death of player
    if (thePlayer.hp <= 0) {
      end = true;
    }
  }
}
