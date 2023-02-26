class Vuur {
  float vuurX, vuurY;
  float vuurYSpeed, vuurXSpeed;
  float travelSpeed;
  float vuurSize;
  boolean vuur = false;
  color clr; // added color variable
  float travelDistance;

  Vuur() {
    vuurSize = 25;
    vuurYSpeed = -10;
    vuurXSpeed = -10;
    travelSpeed = 7;
    vuurX =  -1000;
    vuurY = -1000;
    clr = (#E37D00); // converted rgb to hex
  }

  void shoot(float startX, float startY) {
    vuur = true;
    travelDistance = 0;
    vuurX = startX;
    vuurY = startY;
  }

  void update() {

    if (vuur == true) {
      vuurY += vuurYSpeed;
      vuurX += vuurXSpeed;
      travelDistance += abs(travelSpeed);
    }

    if (travelDistance > 300) {
      vuur = false;
      vuurX = -3000;
      vuurY = -3000;
    }

    if (vuur == false) {
      vuurX = -3000;
      vuurY = -3000;
    }
  }

  void draw() {
    if (vuur) {
      fireparticles.x0 = vuurX;
      fireparticles.y0 = vuurY;
      fireparticles.emit(42);

      circle(vuurX, vuurY, vuurSize);
    }
  }
}
