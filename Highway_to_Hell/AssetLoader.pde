PImage
  //player
  earthCar, waterCar, fireCar, 
  //ai
  AIwater, AIfire, AIearth, 
  noCar, 
  //elements
  steamImg, lavaImg, lavaCircle1, lavaCircle2, lavaCircle3, 
  bubble, fire, muur, mudImg, 
  //padlock
  padlock;
PImage[] AchievementImg;

SoundFile 
  //Background
  music;

public void loadAssets() {
  //sprites
  muur = loadImage("./resources/muur.png");
  lavaCircle1 = loadImage("./resources/lavaCircle.png");
  lavaCircle2 = loadImage("./resources/lavaCircle2.png");
  lavaCircle3 = loadImage("./resources/lavaCircle3.png");
  lavaImg = loadImage("./resources/lava.png");
  noCar = loadImage("./resources/noCar.png");
  waterCar = loadImage("./resources/PlayerWaterCar.png");
  fireCar  = loadImage("./resources/PlayerFireCar.png");
  earthCar = loadImage("./resources/PlayerEarthCar.png");
  steamImg = loadImage("./resources/Steam.png");
  AIwater = loadImage("./resources/AIWATER.png");
  AIfire = loadImage("./resources/AIVUUR.png");
  AIearth = loadImage("./resources/AIAARDE.png");
  mudImg = loadImage("./resources/mud.png");
  padlock = loadImage("./resources/Padlock.jpg");
  AchievementImg = new PImage[4];
  AchievementImg[0] = loadImage("./resources/Nuclear.png");
  AchievementImg[1] = loadImage("./resources/Erlenmeyer.png");
  AchievementImg[2] = loadImage("./resources/Knife.png");
  AchievementImg[3] = loadImage("./resources/Peace.png");

  //Sound
  music = new SoundFile(this, "HtH8Bit.mp3");
}
