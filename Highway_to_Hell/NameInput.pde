class NameInput {
  char letterA; 
  char letterB;
  char letterC; 
  char letterD;
  String sa = str(letterA);
  String sb = str(letterB);
  String sc = str(letterC);
  String sd = str(letterD);
  String sname;
  float textNumber = 0;
  boolean letter1 = true;
  boolean letter2 = false;
  boolean letter3 = false;
  boolean letter4 = false;
  float switchLetters = 0;
  int blue, red, green;


  void draw() {
    background(0);
    fill(255);
    blue = (int)random(0, 255);
    red = (int)random(0, 255);
    green = (int)random(0, 255);
    textSize(40);
    text("Choose name", width * 0.35, height * 0.1); 
    textSize(30);
    text("PRESS DOWN OR UP TO SCROLL BETWEEN LETTERS", width*0.1, height * 0.3);
    textSize(40);
    //Marker
    fill(255);
    //letter1
    if (letter1) {
      triangle(width*0.31, height*0.45, width*0.29, height*0.42, width*0.33, height*0.42);
    }
    //letter2
    if (letter2) {
      triangle(width*0.41, height*0.45, width*0.39, height*0.42, width*0.43, height*0.42);
    }
    //letter3
    if (letter3) {
      triangle(width*0.51, height*0.45, width*0.49, height*0.42, width*0.53, height*0.42);
    }
    //letter4
    if (letter4) {
      triangle(width*0.61, height*0.45, width*0.59, height*0.42, width*0.63, height*0.42);
    }
    //Letter choosing
    text(letterA, width*0.3, height/2);
    text(letterB, width*0.4, height/2);
    text(letterC, width*0.5, height/2);
    text(letterD, width*0.6, height/2);
    sa = str(letterA);
    sb = str(letterB);
    sc =str(letterC);
    sd =str(letterD);
    sname = sa+ sb+ sc+ sd;

    textSize(30);
    text("PRESS LEFT OR RIGHT TO SWITCH POSITION", width*0.14, height * 0.7);
    fill(red, green, blue);
    text("PRESS SPACE TO FINISH", width * 0.3, height * 0.85);
    if (lastKey[DOWN]) {
      textNumber += 1;
    }
    if (lastKey[UP]) {
      textNumber -= 1;
    }
    if (lastKey[LEFT]) {
      switchLetters -= 1;
    }
    if (lastKey[RIGHT]) {
      switchLetters += 1;
    }
    if (letter1) {
      if (textNumber == 0) {
        letterA = ' ';
      }
      if (textNumber == 1) {
        letterA = 'a';
      }
      if (textNumber == 2) {
        letterA = 'b';
      }
      if (textNumber == 3) {
        letterA = 'c';
      }
      if (textNumber == 4) {
        letterA = 'd';
      }
      if (textNumber == 5) {
        letterA = 'e';
      }
      if (textNumber == 6) {
        letterA = 'f';
      }
      if (textNumber == 7) {
        letterA = 'g';
      }
      if (textNumber == 8) {
        letterA = 'h';
      }
      if (textNumber == 9) {
        letterA = 'i';
      }
      if (textNumber == 10) {
        letterA = 'j';
      }
      if (textNumber == 11) {
        letterA = 'k';
      }
      if (textNumber == 12) {
        letterA = 'l';
      }
      if (textNumber == 13) {
        letterA = 'm';
      }
      if (textNumber == 14) {
        letterA = 'n';
      }
      if (textNumber == 15) {
        letterA = 'o';
      }
      if (textNumber == 16) {
        letterA = 'p';
      }
      if (textNumber == 17) {
        letterA = 'q';
      }
      if (textNumber == 18) {
        letterA = 'r';
      }
      if (textNumber == 19) {
        letterA = 's';
      }
      if (textNumber == 20) {
        letterA = 't';
      }
      if (textNumber == 21) {
        letterA = 'u';
      }
      if (textNumber == 22) {
        letterA = 'v';
      }
      if (textNumber == 23) {
        letterA = 'w';
      }
      if (textNumber == 24) {
        letterA = 'q';
      }
      if (textNumber == 25) {
        letterA = 'y';
      }
      if (textNumber == 26) {
        letterA = 'z';
      } 
      if (textNumber > 27) {
        textNumber = 1;
      }
      if (textNumber < 0 ) {
        textNumber = 27;
      }
      if (switchLetters == 1) {
        letter1 = false;
        letter2 = true;
      }
      if (switchLetters < 0) {
        switchLetters = 3;
        letter1 = false;
        letter4 = true;
      }
    }
    if (letter2) { 
      if (textNumber == 0) {
        letterB = ' ';
      }
      if (textNumber == 1) {
        letterB = 'a';
      }
      if (textNumber == 2) {
        letterB = 'b';
      }
      if (textNumber == 3) {
        letterB= 'c';
      }
      if (textNumber == 4) {
        letterB = 'd';
      }
      if (textNumber == 5) {
        letterB = 'e';
      }
      if (textNumber == 6) {
        letterB = 'f';
      }
      if (textNumber == 7) {
        letterB = 'g';
      }
      if (textNumber == 8) {
        letterB = 'h';
      }
      if (textNumber == 9) {
        letterB = 'i';
      }
      if (textNumber == 10) {
        letterB = 'j';
      }
      if (textNumber == 11) {
        letterB = 'k';
      }
      if (textNumber == 12) {
        letterB = 'l';
      }
      if (textNumber == 13) {
        letterB = 'm';
      }
      if (textNumber == 14) {
        letterB = 'n';
      }
      if (textNumber == 15) {
        letterB= 'o';
      }
      if (textNumber == 16) {
        letterB = 'p';
      }
      if (textNumber == 17) {
        letterB = 'q';
      }
      if (textNumber == 18) {
        letterB = 'r';
      }
      if (textNumber == 19) {
        letterB = 's';
      }
      if (textNumber == 20) {
        letterB = 't';
      }
      if (textNumber == 21) {
        letterB = 'u';
      }
      if (textNumber == 22) {
        letterB = 'v';
      }
      if (textNumber == 23) {
        letterB = 'w';
      }
      if (textNumber == 24) {
        letterB = 'q';
      }
      if (textNumber == 25) {
        letterB = 'y';
      }
      if (textNumber == 26) {
        letterB = 'z';
      } 
      if (textNumber > 27) {
        textNumber = 1;
      }
      if (textNumber < 0 ) {
        textNumber = 27;
      }
      if (switchLetters == 2) {
        letter2 = false;
        letter3 = true;
      }
      if (switchLetters == 0) {
        letter2 = false;
        letter1 = true;
      }
    }

    if (letter3) { 
      if (textNumber == 0) {
        letterC = ' ';
      }
      if (textNumber == 1) {
        letterC = 'a';
      }
      if (textNumber == 2) {
        letterC = 'b';
      }
      if (textNumber == 3) {
        letterC= 'c';
      }
      if (textNumber == 4) {
        letterC = 'd';
      }
      if (textNumber == 5) {
        letterC = 'e';
      }
      if (textNumber == 6) {
        letterC = 'f';
      }
      if (textNumber == 7) {
        letterC = 'g';
      }
      if (textNumber == 8) {
        letterC = 'h';
      }
      if (textNumber == 9) {
        letterC = 'i';
      }
      if (textNumber == 10) {
        letterC = 'j';
      }
      if (textNumber == 11) {
        letterC = 'k';
      }
      if (textNumber == 12) {
        letterC = 'l';
      }
      if (textNumber == 13) {
        letterC = 'm';
      }
      if (textNumber == 14) {
        letterC = 'n';
      }
      if (textNumber == 15) {
        letterC= 'o';
      }
      if (textNumber == 16) {
        letterC = 'p';
      }
      if (textNumber == 17) {
        letterC = 'q';
      }
      if (textNumber == 18) {
        letterC = 'r';
      }
      if (textNumber == 19) {
        letterC = 's';
      }
      if (textNumber == 20) {
        letterC = 't';
      }
      if (textNumber == 21) {
        letterC = 'u';
      }
      if (textNumber == 22) {
        letterC = 'v';
      }
      if (textNumber == 23) {
        letterC = 'w';
      }
      if (textNumber == 24) {
        letterC = 'q';
      }
      if (textNumber == 25) {
        letterC = 'y';
      }
      if (textNumber == 26) {
        letterC = 'z';
      } 
      if (textNumber > 27) {
        textNumber = 1;
      }
      if (textNumber < 0 ) {
        textNumber = 27;
      }
      if (switchLetters == 3) {
        letter3 = false;
        letter4 = true;
      }
      if (switchLetters == 1) {
        letter3 = false;
        letter2 = true;
      }
    }

    if (letter4) {  
      if (textNumber == 0) {
        letterD = ' ';
      }
      if (textNumber == 1) {
        letterD = 'a';
      }
      if (textNumber == 2) {
        letterD = 'b';
      }
      if (textNumber == 3) {
        letterD = 'c';
      }
      if (textNumber == 4) {
        letterD = 'd';
      }
      if (textNumber == 5) {
        letterD = 'e';
      }
      if (textNumber == 6) {
        letterD = 'f';
      }
      if (textNumber == 7) {
        letterD = 'g';
      }
      if (textNumber == 8) {
        letterD = 'h';
      }
      if (textNumber == 9) {
        letterD = 'i';
      }
      if (textNumber == 10) {
        letterD = 'j';
      }
      if (textNumber == 11) {
        letterD = 'k';
      }
      if (textNumber == 12) {
        letterD = 'l';
      }
      if (textNumber == 13) {
        letterD = 'm';
      }
      if (textNumber == 14) {
        letterD = 'n';
      }
      if (textNumber == 15) {
        letterD = 'o';
      }
      if (textNumber == 16) {
        letterD = 'p';
      }
      if (textNumber == 17) {
        letterD = 'q';
      }
      if (textNumber == 18) {
        letterD = 'r';
      }
      if (textNumber == 19) {
        letterD = 's';
      }
      if (textNumber == 20) {
        letterD = 't';
      }
      if (textNumber == 21) {
        letterD = 'u';
      }
      if (textNumber == 22) {
        letterD = 'v';
      }
      if (textNumber == 23) {
        letterD = 'w';
      }
      if (textNumber == 24) {
        letterD = 'q';
      }
      if (textNumber == 25) {
        letterD = 'y';
      }
      if (textNumber == 26) {
        letterD = 'z';
      } 
      if (textNumber > 27) {
        textNumber = 1;
      }
      if (textNumber < 0 ) {
        textNumber = 27;
      }
      if (switchLetters >= 4) {
        switchLetters = 0;
        letter4 = false;
        letter1 = true;
      }
      if (switchLetters == 2) {
        letter4 = false;
        letter3 = true;
      }
    }
    if (lastKey[' ']) {
      welcome = true;
      imputName = false;
    }
  }
}
