
float time = 0; 
float pulse;
float bpm = 0.25;
int dimensionX;
int dimensionY;

PImage eye;
pixelscanner scanBlack;
pixelscanner scanWhite;


void setup() {
  size(1600, 1600);
  frameRate(12);

  scanBlack = new pixelscanner();
  scanBlack.pixelLoad("eye500.png");
  scanBlack.lerpTarget = color(0, 0, 0);

  scanWhite = new pixelscanner();
  scanWhite.pixelLoad("eye500.png");
  scanWhite.lerpTarget = color(255, 255, 255);
}

float sineOfTime (float freq, float amp) {
  float timeOverFreq = (TWO_PI / freq * time);
  float sine = abs(sin(timeOverFreq));
  time++;
  //println(time);
  return sine;
}

void draw() {
  
  background(0);

  scanBlack.newColorLerp(color(255, 0, 0), color(0, 0, 255), sineOfTime(50, 10));
  scanBlack.lerpOut();

  scanWhite.newColorLerp(color(0, 0, 255), color(255, 0, 0), sineOfTime(69, 0));
  scanWhite.lerpOut();
  
  sineVisualizer(sineOfTime(30, 10), width*0.7, height*0.7);


  //saveFrames();
}

void sineVisualizer (float sine, float xCoord, float yCoord) {
  
  stroke(255, 0, 0);
  rect(xCoord, yCoord, 200, 100);
  
  for (int i = 0; i < 100; i++) {
    float yInc = round(sine) * 10; 
    stroke(255, 0, 0);
    point(i + xCoord, yInc + yCoord);
  }
}

void saveFrames () {
  if (frameCount < 49) {
    saveFrame("frames-oldmethod/eye500_####.png");
  } else {
    noLoop();
    print("render complete");
  }
}
