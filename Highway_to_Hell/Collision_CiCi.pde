class CollisionCiCi {
  int VuurCounter = 0;
  int WaterCounter = 0;

  boolean collision(float x0, float y0, float r0, float x1, float y1, float r1) {
    float dx = x0 - x1;
    float dy = y0 - y1;
    float afstand = sqrt(dx*dx + dy*dy);
    return (afstand <= r0 + r1);
  }

  void  collisionVuurWater(Vuur vuur, Water water, Steam steam) {
    if (water.water == true && vuur.vuur == true) {
      if (collision(vuur.vuurX, vuur.vuurY, vuur.vuurSize/2, water.waterX, water.waterY, water.waterSize/2)) {
        water.water = false;
        vuur.vuur = false;
        steam.spawn(vuur.vuurX, vuur.vuurY);
        theAchievements.hasMadeSteam = true;
      }
    }
  }

  void collisionFirePlayer(Vuur vuur, Player player) {
    if (vuur.vuur == true) {
      if (collision(vuur.vuurX, vuur.vuurY, vuur.vuurSize/2, player.x, player.y, player.Size)) {
        vuur.vuur = false;
        player.xSpeed = 7;
        player.ySpeed = 7;
        VuurCounter++;
        if (VuurCounter == 180) {
          player.xSpeed = 5;
          player.ySpeed = 5;
          VuurCounter = 0;
        }
        player.hp -= 25;
      }
    }
  }

  void collisionWaterPlayer(Water water, Player player) {
    if (water.water == true) {
      if (collision(water.waterX, water.waterY, water.waterSize/2, player.x, player.y, player.Size)) {
        water.water = false;
        player.xSpeed = 0;
        WaterCounter++;
        if (WaterCounter == 120) {
          player.xSpeed = 5;
          WaterCounter = 0;
          player.hp -= 20;
        }
      }
    }
  }

  void collisionSteamPlayer(Steam steam, Player player) {
    if (steam.steam == true) {
      if (collision(steam.steamX, steam.steamY, steam.steamSize/2, player.x, player.y, player.Size/2)) {
        steam.steam = false;
        steam.mist = true;
        steam.alphaMist = 250;
      }
    }
  }

  void collisionMudPlayer(Mud mud, Player player) {
    if (mud.mud == true) {
      if (collision(mud.mudX, mud.mudY, mud.mudSize/2, player.x, player.y, player.Size/2)) {
        player.hp += 50;
        mud.mud = false;
      }
    }
  }

  void collisionLavaPlayer(Lava lava, Player player) {
    for (int i = 0; i <lava.lavaAantal; i++) {
      if (collision(lava.lavaX[i], player.x, lava.lavaY[i] + lava.lavaLocation, player.y, lava.lavaDiameter[i]/2, player.Size)) {
        player.xSpeed = 2;
        player.ySpeed = 2;
        lava.tickNow = millis();
        if (lava.tickNow > (lava.tickLast + lava.ticks)) {
          player.hp -= theConfig.LAVATICKDMG;
          lava.tickLast = lava.tickNow;
        }
      } else {
        thePlayer.xSpeed = 5;
        thePlayer.ySpeed = 5;
      }
    }
  }

  void collisionPlayerCPU() {
    for (int i = 0; i < computerCars.size(); i++) {
      float myDist = computerCars.get(i).Size/2 + thePlayer.Size/2;
      if (dist(thePlayer.x, thePlayer.y, computerCars.get(i).xPos, computerCars.get(i).yPos) < myDist) {
        thePlayer.clr = (#ff0000);
        theHUD.setHealth();
      } else {
        if (thePlayer.playerMode == "Aarde") {
          thePlayer.clr = theMenu.aardeCol;
        } else if (thePlayer.playerMode == "Vuur") {
          thePlayer.clr = theMenu.vuurCol;
        } else if (thePlayer.playerMode == "Water") {
          thePlayer.clr = theMenu.waterCol;
        }
      }
    }
  }

  void collisionFireCPU(Vuur vuur) {
    float vuurX = vuur.vuurX;
    float vuurY = vuur.vuurY;

    // CPU vuur collision
    for (int i = 0; i < computerCars.size(); i++) {
      float vuurCollisionDistanceCPU = (computerCars.get(i).Size / 2) + (vuur.vuurSize / 2);
      if (computerCars.get(i).CPU == true) {
        if ((vuurY + vuurCollisionDistanceCPU > computerCars.get(i).yPos && vuurY - vuurCollisionDistanceCPU < computerCars.get(i).yPos) &&
          (vuurX + vuurCollisionDistanceCPU > computerCars.get(i).xPos && vuurX - vuurCollisionDistanceCPU < computerCars.get(i).xPos)) {
          computerCars.get(i).hp -= theConfig.VUURDMG;
          thePlayer.setScore();
          vuur.vuur = false;
        }
      }
    }
  }


  void collisionWaterCPU(Water water) {
    float waterX = water.waterX;
    float waterY = water.waterY;
    // CPU water collision
    for (int i = 0; i < computerCars.size(); i++) {
      float waterCollisionDistanceCPU = (computerCars.get(i).Size / 2) + (water.waterSize / 2);
      if (computerCars.get(i).CPU == true) {
        if ((waterY + waterCollisionDistanceCPU > computerCars.get(i).yPos && waterY - waterCollisionDistanceCPU < computerCars.get(i).yPos) && 
          (waterX + waterCollisionDistanceCPU > computerCars.get(i).xPos && waterX - waterCollisionDistanceCPU < computerCars.get(i).xPos)) {
          computerCars.get(i).hp -= theConfig.WATERDMG;
          thePlayer.setScore();
          water.water = false;
        }
      }
    }
  }
}
