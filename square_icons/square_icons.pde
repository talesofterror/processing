float time;

pixelscanner scanBlack;
pixelscanner scan1;
pixelscanner scan2;
pixelscanner scan3;
pixelscanner scan4;
pixelscanner scan5;
pixelscanner scan6;

void setup () {
   size(800, 400);
   frameRate(20);

   getSurface().setLocation(1500, 300);

   String imageFile = "main.png";

   scanBlack = new pixelscanner();
   scanBlack.pixelLoad(imageFile);
   scanBlack.lerpTarget = color(0, 0, 0);

   scan1 = new pixelscanner();
   scan1.pixelLoad(imageFile);
   scan1.lerpTarget = color(112, 255, 227);

   scan2 = new pixelscanner();
   scan2.pixelLoad(imageFile);
   scan2.lerpTarget = color(255, 96, 114);

   scan3 = new pixelscanner();
   scan3.pixelLoad(imageFile);
   scan3.lerpTarget = color(255, 65, 77);

   scan4 = new pixelscanner();
   scan4.pixelLoad(imageFile);
   scan4.lerpTarget = color(0, 221, 186);

   scan5 = new pixelscanner();
   scan5.pixelLoad(imageFile);
   scan5.lerpTarget = color(128, 255, 0);

   scan6 = new pixelscanner();
   scan6.pixelLoad(imageFile);
   scan6.lerpTarget = color(153, 255, 169);
}

float sine (float freq, float amp) {
   float timeOverFreq = (TWO_PI / freq * time);
   float sine = abs(sin(timeOverFreq));
   time++;
   //println(time);
   return sine;
}

void draw() {
   background(0);

   float speed = 500;

   scanBlack.colorLerp(color(56, 229, 116), color(56, 229, 202), sine(speed, 0));
   scanBlack.lerpOut();

   scan1.colorLerp(color(56, 229, 202), color(116, 56, 229), sine(speed, 0));
   scan1.lerpOut();

   scan2.colorLerp(color(116, 56, 229), color(202, 56, 229), sine(speed, 0));
   scan2.lerpOut();

   scan3.colorLerp(color(202, 56, 229), color(229, 116, 56), sine(speed, 0));
   scan3.lerpOut();

   scan4.colorLerp(color(229, 116, 56), color(229, 202, 56), sine(speed, 0));
   scan4.lerpOut();

   scan5.colorLerp(color(229, 202, 56), color(229, 202, 56), sine(speed, 0));
   scan5.lerpOut();

   scan6.colorLerp(color(229, 202, 56), color(56, 229, 116), sine(speed, 0));
   scan6.lerpOut();

   println("sine value: " + sine(speed, 0) + ". fream number: " + frameCount);
   // might repeat well after 12 frames

   saveFrames(31);
}

void saveFrames (int numberOfFrames) {
   if (frameCount < numberOfFrames) {
      saveFrame("main/main_####.png");
   } else {
      noLoop();
      print("render complete");
   }
}
