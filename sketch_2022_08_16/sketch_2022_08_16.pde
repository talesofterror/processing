float amp = 1; 
float freq = 15;
float theta = 0.0; 

float rectWidth = 40;
float rectHeight = 40;
float strokePixels = 5;

float time = 0;
float sine;


void setup () {
  size(800, 800); 
  getSurface().setLocation(1500, 400);
}

void draw() {

  sine = abs(sin(time/100));
  time++;
  //println(sine);

  background(0);

  rectMaker(newSine(0), newSine(0));
}

void rectMaker (float colorOffsetA, float colorOffsetB) {

  for (int i = 0; i < width; i+=50) {
    for (int j = 0; j < height; j+=50) {

      float startPosY = height - rectHeight - strokePixels;
      float startPosX = width - rectWidth - strokePixels;
      float colorSine = newSine(0);


      colorMode(HSB, 1);
      stroke(1, 0, 1);
      fill(colorSine, 1, 1);

      strokeWeight(strokePixels);
      rect(startPosX - i, startPosY - j, rectWidth, rectHeight);
    }
  }
}

float newSine (float phase) {
  float timeOverFreq = TWO_PI / freq * (time * 0.5);
  float newSine = amp * sin(timeOverFreq) + phase;
  // time+=0.5;
  
  return newSine;
}
