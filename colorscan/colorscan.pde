
float time = 0; 
float pulse;
float freq = 10;
int dimensionX;
int dimensionY;

PImage eye;

pixelscanner springSkull;

// EYE
// pixelscanner scanBlack;
// pixelscanner scanWhite;

void setup() {
  size(800, 800);
  frameRate(12);
  getSurface().setLocation(500, 200);

  springSkull = new pixelscanner("spring-skull.png");

  // EYE 500
  //
  // scanBlack = new pixelscanner();
  // scanBlack.pixelLoad("eye500.png");
  // scanBlack.lerpTarget = color(0, 0, 0);

  // scanWhite = new pixelscanner();
  // scanWhite.pixelLoad("eye500.png");
  // scanWhite.lerpTarget = color(255, 255, 255);
}

void draw() {

  float sineInc = sineOfTime2(freq, 1);
  // println(sineInc);
  
  background(0);

  springSkull.image.resize(width, height);
  image(springSkull.image, 0, 0);

  // EYE 500
  //
  // scanBlack.colorLerp(color(233, 50, 255), color(0, 0, 255), sineInc);
  // scanBlack.lerpOut();

  // scanWhite.colorLerp(color(0, 55, 255), color(255, 55, 0), sineInc);
  // scanWhite.lerpOut();
  
  sineVisualizer(sineOfTime(50, 10), width*0.7, height*0.7);
  // sineWave2(sineInc, freq, width*0.7, height*0.7, 50, 0);
  
  
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
  time+=1;
  //println(time);

  return sine;
}

float sineOfTime2(float freq, float amp) {
  float timeOverFreq = TWO_PI / freq * time;
  // float timeOverFreq = TWO_PI / freq * frameCount/2;
  float sine = amp * sin(timeOverFreq) + 0.5;
  time+=0.2;
  // time = frameCount / 5;
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

void sineWave(float freq, float xPos, float yPos, float amp, float phase) {
  strokeWeight(5);
  for (float x = xPos; x <= xPos + 300; x+=1) {
    float yInc = round(sineOfTime2(freq, amp) * amp + phase);
    point(x, yPos + yInc);
  }
}

// Unable to get this working with the sine parameter.
// When I call it with sineInc I get a flat line.     
void sineWave2(float sine, float freq, float xPos, float yPos, float amp, float phase) {
  strokeWeight(5);
  for (float x = xPos; x <= xPos + 300; x+=1) {
    // float yInc = round(sineOfTime2(freq, amp) * amp + phase);
    float yInc = sine;
    point(x, yPos + yInc);
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
