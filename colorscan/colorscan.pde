
float time = 0; 
float pulse;
float bpm = 0.25;
int dimensionX;
int dimensionY;

PImage eye;
pixelscanner scanBlack;
pixelscanner scanWhite;

float testSine;


void setup() {
  size(1600, 1600);
  frameRate(12);
  getSurface().setLocation(500, 200);

  testSine = sineOfTime(50, 10);

  scanBlack = new pixelscanner();
  scanBlack.pixelLoad("eye500.png");
  scanBlack.lerpTarget = color(0, 0, 0);

  scanWhite = new pixelscanner();
  scanWhite.pixelLoad("eye500.png");
  scanWhite.lerpTarget = color(255, 255, 255);
}

void draw() {

  float sineInc = sineOfTime(30, 1);
  println(sineInc);
  
  background(0);

  scanBlack.newColorLerp(color(255, 0, 0), color(0, 0, 255), sineInc);
  scanBlack.lerpOut();

  scanWhite.newColorLerp(color(255, 155, 0), color(255, 55, 0), sineInc);
  scanWhite.lerpOut();
  
  //sineVisualizer(sineOfTime(50, 10), width*0.7, height*0.7);
  sineWave(sineInc, width*0.7, height*0.7, 50, 50);
  
  if (keyPressed) {
    if (key == 'w'){
      exit();
    }
  }
  
  //saveFrames();
}

float sineOfTime (float freq, float amp) {
  float timeOverFreq = (TWO_PI / freq * time);
  float sine = amp * abs(sin(timeOverFreq));
  time++;
  //println(time);
  return sine;
}

void sineVisualizer (float sine, float xCoord, float yCoord) {
  
  stroke(255, 0, 0);
  rect(xCoord, yCoord, 200, 100);
  
  for (int x = 0; x < 100; x++) {
    float yInc = round(sine); 
    stroke(255, 0, 0);
    point(x + xCoord, yCoord + yInc);
  }
}

void sineWave(float sine, float xPos, float yPos, float amp, float phase) {
  float i = 0;
  strokeWeight(3);
  for (float x = xPos; x <= xPos + 100; x+=1) {
    float yInc = round(sine);
    point(x, yPos + yInc + i);
    i+=0.2;
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
