int chooseLorR;
float shakeVelocity = 1;

void startScreenshake() {
  chooseLorR = (int)random(0, 2);
  //Right
  if (chooseLorR == 0) {
    cameraX +=  shakeVelocity;
  }
  //Left
  if (chooseLorR == 1) {
    cameraX -=  shakeVelocity;
  }
}
