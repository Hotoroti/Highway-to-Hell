class Menu {
  color aardeCol = (#955500);
  color vuurCol = (#E37D00);
  color waterCol = (#5091f5);
  int currentPick = 0;

  PImage playerCar[] = {earthCar, fireCar, waterCar};
  String elementName[] = {"Aarde", "Vuur", "Water"};

  void welcome() {
    // Double lines are to create a 3D outline effect
    int lX = 650;
    int rX = 950;
    color anyKey = color(random(0, 255), random(0, 255), random(0, 255));
    textSize(64);
    fill(#C90000);
    textAlign(CENTER);
    text("HIGHWAY TO HELL", width/2, height/4);
    textSize(65);
    fill(255);
    text("HIGHWAY TO HELL", width/2, height/4);

    textSize(32);
    fill(#C90000);
    text("Controls", width/2, 400);
    textSize(33);
    fill(255);
    text("Controls", width/2, 400);

    fill(anyKey);
    text("Press SPACE to start!", width/2, 800);

    textSize(24);
    fill(#C90000);
    text("Movement", lX, 450);
    text("arrow keys", rX, 450);
    text("Element", lX, 500);
    text("Space", rX, 500);

    textSize(25);
    fill(255);
    text("Movement", lX, 450);
    text("arrow keys", rX, 450);
    text("Element", lX, 500);
    text("Space", rX, 500);
  }

  void displayCarSelect() {
    imageMode(CENTER);
    image(playerCar[currentPick], width/2 + 10, 680);
    //circle(width/2, 650, 100);
    fill(#C90000);
    textSize(48);
    text(" < ", width/2 - 75, 670);
    text(" > ", width/2 + 75, 670);
    textSize(50);
    fill(255);
    text(" < ", width/2 - 75, 670);
    text(" > ", width/2 + 75, 670);
    textSize(24);
    fill(#C90000);
    text(elementName[currentPick], width/2, 750);
    fill(255);
    textSize(25);
    text(elementName[currentPick], width/2, 750);
  }

  void carSelect() {
    // selection towards the right
    if (keyPressed) {
      if (keyCode == 39) {
        if (currentPick == 0) {
          currentPick = 1;
          keyCode = 38;
        }
      }
    }
    if (keyPressed) {
      if (keyCode == 39) {
        if (currentPick == 1) {
          currentPick = 2;
          keyCode = 38;
        }
      }
    }
    if (keyPressed) {
      if (keyCode == 39) {
        if (currentPick == 2) {
          currentPick = 0;
          keyCode = 38;
        }
      }
    }
    // selection towards the left
    if (keyPressed) {
      if (keyCode == 37) {
        if (currentPick == 2) {
          currentPick = 1;
          keyCode = 38;
        }
      }
    }
    if (keyPressed) {
      if (keyCode == 37) {
        if (currentPick == 1) {
          currentPick = 0;
          keyCode = 38;
        }
      }
    }
    if (keyPressed) {
      if (keyCode == 37) {
        if (currentPick == 0) {
          currentPick = 2;
          keyCode = 38;
        }
      }
    }
  }

  void carConfirm() {
    if (lastKey[' ']) {
      thePlayer = new Player(elementName[currentPick]);
      welcome = false;
      textAlign(LEFT);
    }
  }

  void displayMenu() {
    welcome();
    carSelect();
    displayCarSelect();
    carConfirm();
  }
}
