float r = 100;
float g = 250;
float b = 50;

float rIncrement = 10;
float gIncrement = 5;
float bIncrement = 25;

//Limits are bound to these values for now, otherwise they go negative
float Limit1 = 200;
float Limit2 = 250;

boolean flipR = false;
boolean flipG = false;
boolean flipB = false;

class Toggler {





  void red() {

    if (flipR == false) {
      r -= rIncrement;
    }

    if (r == Limit1) {
      flipR = true;
    }

    if (flipR == true) {
      r += rIncrement;
    }

    if (r == Limit2) {
      flipR = false;
    }
  }

  void green() {

    if (flipG == false) {
      g -= gIncrement;
    }

    if (g == Limit1) {
      flipG = true;
    }

    if (flipG == true) {
      g += gIncrement;
    }

    if (g == Limit2) {
      flipG = false;
    }
  }


  void blue() {

    if (flipB == false) {
      b -= bIncrement;
    }

    if (b == Limit1) {
      flipB = true;
    }

    if (flipB == true) {
      b += bIncrement;
    }

    if (b == Limit2) {
      flipB = false;
    }

    print(r + ", " + g + ", " + b + "; ");
    println("flipR = " + flipR + ", flipG = " + flipG + ", flipB = " + flipB);
    println(" ");
  }
}
