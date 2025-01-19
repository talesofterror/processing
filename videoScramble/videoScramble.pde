PImage[] frameArray;
String assetPath = "assets/";
int fileCount = 1717;
int sizeX = 800;
int sizeY = 800;

int animationSpeed = 10;
int currentFrame = 0;

void setup () {

  frameArray = new PImage[fileCount];
  for (int i = 0; i < frameArray.length; i++) {
    println("Loading image => " + formatNumber(i) + ".png");
    frameArray[i] = loadImage("assets/" + formatNumber(i) + ".png");
  }

  println("frameArray.length = " + frameArray.length);
  
  surface.setLocation(0,0);
  frameRate(animationSpeed);
  size(sizeX, sizeY);
}

void draw() {
  println(java.time.LocalDateTime.now() + " >> Current Frame => " + calculateFrame());
  image(frameArray[calculateFrame()], 0, 0);
}

private String formatNumber (int i) {
  String index = String.valueOf(i+2);
  if (index.length() == 1) {
    return "000" + index;
  } else if (index.length() == 2) {
    return "00" + index;
  } else {
    return "0" + index;
  }
}

int calculateFrame () {
  if (currentFrame == frameArray.length){
    currentFrame = 0;
    return currentFrame;
  }
  else return currentFrame++;
}
