
float time = 0; 
float pulse;
float bpm = 0.25;

PImage eye;
pixelscanner scanBlack;
pixelscanner scanWhite;

// black
//color pixelBlack = color(0, 0, 0);
//color blackStart = color(0, 100, 255);
//color blackFinish = color(255, 0, 10);
//color blackLerp;
//color blackMem;


void setup() {
   size(1600, 1600);
   frameRate(12);

   scanBlack = new pixelscanner();
   scanBlack.pixelLoad("eye500.png");
   scanBlack.lerpTarget = color(0,0,0);
   
   scanWhite = new pixelscanner();
   scanWhite.pixelLoad("eye500.png");
   scanWhite.lerpTarget = color(255,255,255);

   //blackMem = pixelBlack;
}

float sineOfTime (float freq, float amp) {
   float timeOverFreq = ((TWO_PI / freq) * frameCount + amp);
   float sine = abs(sin(timeOverFreq) - 0.2);
   time++;
   //println(time);
   return sine;
}

void draw() {

   //blackLerp = lerpColor(blackStart, blackFinish, sineOfTime(100, 100));
   //scanBlack.colorLerp(blackMem, blackLerp);
   //blackMem = blackLerp;
   //scanBlack.image.updatePixels();
   //image(scanBlack.image, 0, 0);

   scanBlack.newColorLerp(scanBlack.lerpTarget, color(255, 0, 0), 
      color(0, 0, 255), sineOfTime(69, 0));
   scanBlack.lerpOut();
   
   scanWhite.newColorLerp(scanWhite.lerpTarget, color(20, 200, 255), 
      color(255, 200, 20), sineOfTime(69,0));
      scanWhite.lerpOut();


   //saveFrames();
}

void saveFrames () {
   if (frameCount < 49) {
      saveFrame("frames-oldmethod/eye500_####.png");
   } else {
      noLoop();
      print("render complete");
   }
}
