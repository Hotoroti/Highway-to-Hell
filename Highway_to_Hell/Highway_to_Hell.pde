import samuelal.squelized.*;
import java.util.Properties;
import processing.sound.*;

Menu theMenu;
Player thePlayer;
Backgrounds theBackground;

ArrayList<CPU> computerCars = new ArrayList<CPU>();
int amountOfCars = 0;
int nElements = 8;
int currentFire = 0;
int currentWater = 0;
int currentEarth = 0;
int currentSteam = 0;
int currentMud = 0;
int currentLava = 0;

int nCars = 10;

//Camera
float cameraX = 0, cameraY = 0;


Bubbles bubbles;
FireParticles fireparticles;
Mud[] theMud;
Aarde theAarde;
Vuur[] theVuur;
Water[] theWater;
Lava[] theLava;
Steam[] steam;
CollisionCiCi theCollisionCiCi;
CollisionFIAA theCollisionFIAA;
CollisionWAAA theCollisionWAAA;
CollisionAAAI theCollisionAAAI;
CollisionAAPL theCollisionAAPL;
Config theConfig;
HUD theHUD;
EndScreen theEndscreen;
CPU theCPU;
NameInput theNameInput;
HighScoreScreen theHighScoreScreen;
Achievements theAchievements;
Deathmarker theDeathmarker;
InsertInto theInsertInto;



boolean moveRoadLeft = false;
boolean imputName = true;
boolean welcome = false;
boolean end = false;
boolean showHighscore = false;
boolean playerMovement = true;
boolean savePosition = false;
boolean showAchievements = false;
boolean readyForCrunch = false;
int PlayerId;
int frameCounter = 0;

void setup() {
  size(1600, 900);
  noStroke();
  loadAssets();
  PlayerId = (int)random(1, 999999999);

  music.play(1, 0.2);

  fireparticles= new FireParticles(width/2, height/2);
  fireparticles.spreadFactor=0.9;
  fireparticles.minSpeed=1.0;
  fireparticles.maxSpeed=4.0;
  fireparticles.startVx=0.0069930553;
  fireparticles.startVy=0.0069930553;
  fireparticles.particleShape="quad";
  fireparticles.emitterType="point";
  fireparticles.birthSize=10.0;
  fireparticles.deathSize=38.384613;
  fireparticles.gravity=0.0;
  fireparticles.birthColor=color(255.0, 69.0, 69.0, 255.0);
  fireparticles.deathColor=color(255.0, 137.0, 0.0, 0.0);
  fireparticles.blendMode="add";
  fireparticles.framesToLive=20;

  bubbles= new Bubbles(width/2, height/2);
  bubbles.spreadFactor=2.5174825;
  bubbles.minSpeed=1.0;
  bubbles.maxSpeed=1.0;
  bubbles.startVx=-0.0069929957;
  bubbles.startVy=-0.37062937;
  bubbles.particleShape="ellipse";
  bubbles.emitterType="point";
  bubbles.birthSize=18.307692;
  bubbles.deathSize=1.0;
  bubbles.gravity=0.009090915;
  bubbles.birthColor=color(0.0, 29.0, 255.0, 255.0);
  bubbles.deathColor=color(0.0, 0.0, 255.0, 0.0);
  bubbles.blendMode="add";
  bubbles.framesToLive=20;


  //classes
  theMenu = new Menu();
  theBackground = new Backgrounds();
  theCollisionAAAI = new CollisionAAAI();
  makeCpuCars();
  theMud = new Mud[nElements];
  theVuur = new Vuur[nElements];
  theWater = new Water[nElements];
  theLava = new Lava[nElements];
  steam = new Steam[nElements];
  theAarde = new Aarde();

  for (int i = 0; i < nElements; i++) {

    theVuur[i] = new Vuur();
    theWater[i] = new Water();
    theMud[i] = new Mud();
    theLava[i] = new Lava();
    steam[i] = new Steam();
  }
  theCollisionCiCi = new CollisionCiCi();

  theCollisionFIAA = new CollisionFIAA();
  theCollisionWAAA = new CollisionWAAA();
  theCollisionAAPL = new CollisionAAPL();
  theConfig = new Config();
  theHUD = new HUD();
  theEndscreen = new EndScreen();
  theCPU = new CPU();
  theNameInput = new NameInput();
  theHighScoreScreen = new HighScoreScreen();
  theAchievements = new Achievements();
  theDeathmarker = new Deathmarker();
  theInsertInto = new InsertInto();
}

void updateGame() {
  theBackground.update();
  thePlayer.update();
  updateCpuCars(amountOfCars);
  checkPlayerScore(thePlayer.score);


  for (int i = 0; i < nElements; i++) {
    theAarde.update();
    theVuur[i].update();
    theWater[i].update();
    theMud[i].update();
    theLava[i].update();
    steam[i].update();
  }
  for (int i = 0; i < nElements; i++) {
    for (int j = 0; j < nElements; j++) {
      theCollisionCiCi.collisionVuurWater(theVuur[i], theWater[j], steam[currentSteam]);
      theCollisionCiCi.collisionFirePlayer(theVuur[i], thePlayer);
      theCollisionCiCi.collisionWaterPlayer(theWater[j], thePlayer);
      theCollisionCiCi.collisionSteamPlayer(steam[i], thePlayer);
      theCollisionCiCi.collisionMudPlayer(theMud[i], thePlayer);
      theCollisionCiCi.collisionLavaPlayer(theLava[i], thePlayer);
      theCollisionCiCi.collisionPlayerCPU();
      theCollisionCiCi.collisionFireCPU(theVuur[i]);
      theCollisionCiCi.collisionWaterCPU(theWater[i]);
    }
  }

  if (currentFire >= nElements) {
    currentFire = 0;
  }
  if (currentWater >= nElements) {
    currentWater = 0;
  }
  if (currentEarth >= nElements) {
    currentEarth = 0;
  }
  if (currentMud >= nElements) {
    currentMud = 0;
  }
  if (currentLava >= nElements) {
    currentLava = 0;
  }
  if (currentSteam >= nElements) {
    currentSteam = 0;
  }

  theCollisionAAAI.update();
  theCollisionFIAA.update();
  theCollisionWAAA.update();
  theCollisionAAPL.update();
  theConfig.update();
  theCPU.update();

  theAchievements.update();
  theBackground.checkCollision(thePlayer);
  fireparticles.update();
  bubbles.update();
}

void drawGame() {
  thePlayer.draw();
  drawCpuCars(amountOfCars);
  for (int i = 0; i < nElements; i++) {
    theAarde.draw();
    theVuur[i].draw();
    theWater[i].draw();
    theMud[i].draw();
    theLava[i].draw();
    steam[i].draw();
  }
  theHUD.draw();
  theAchievements.draw();

  //Paste following to draw()
  fireparticles.draw();
  bubbles.draw();
}

void draw() {
  theBackground.draw(); // background outside of drawGame for welcome screen
  if (imputName) {
    theNameInput.draw();
    playerMovement = false;
    theCPU.CPU = false;
  } else if (welcome) {
    theMenu.displayMenu();
    playerMovement = false;
    theCPU.CPU = false;
  } else if (showHighscore) {
    theHighScoreScreen.draw();
    playerMovement = false;
    theCPU.CPU = false;
  } else if (showAchievements) {
    theAchievements.draw();
    playerMovement = false;
    theCPU.CPU = false;
  } else if (end) {
    theEndscreen.draw();
    playerMovement = false;
    theCPU.CPU = false;
  } else {
    drawGame();
    updateGame();
    theCPU.CPU = true;
    playerMovement = true;
  }
  updatekeys();
} 


void makeCpuCars() {
  computerCars.add(new CPU());
  amountOfCars++;
}

void updateCpuCars(int amountOfCars) {
  for (int i = 0; i < amountOfCars; i++) {
    computerCars.get(i).update();
  }
}

void drawCpuCars(int amountOfCars) {
  for (int i = 0; i < amountOfCars; i++) {
    computerCars.get(i).draw();
  }
}

void checkPlayerScore(int score) {
  if (score % 400 == 0 && score != 0) {
    makeCpuCars();
  }
}
