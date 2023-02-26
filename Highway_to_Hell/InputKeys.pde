final int KEY_LIMIT = 1024;
boolean[] keysPressed = new boolean[KEY_LIMIT];
boolean[] prevFramePressed = new boolean[KEY_LIMIT];
boolean[] lastKey = new boolean[KEY_LIMIT];

void updatekeys() {
  for (int iKey = 0; iKey < keysPressed.length; iKey++) {
    lastKey[iKey] = keysPressed[iKey] && !prevFramePressed[iKey]; 
    prevFramePressed[iKey] = keysPressed[iKey];
  }
}


void keyPressed() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = true;
  if (key>= KEY_LIMIT) return;
  keysPressed[key] = true;
}

void keyReleased() {
  if (keyCode >= KEY_LIMIT) return;
  keysPressed[keyCode] = false;
  if (key >= KEY_LIMIT) return;
  keysPressed[key] = false;
}
