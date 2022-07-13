
float time; 
float pulse;
float bpm = 0.25;

PImage eye;

// black
color pixelBlack = color(0, 0, 0);
color blackStart = color(0, 0, 0);
color blackFinish = color(255, 255, 255);
color blackLerp;
color blackMem;

// yellow
color pixelYellow = color(255, 223, 0);
color yellowStart = color(223, 200, 0);
color yellowFinish = color(225, 150, 123);
color yellowLerp;
color yellowMem;

// orange light
color pixelOrgLight = color(255, 153, 0);
color orgLightStart = color(255, 153, 0);
color orgLightFinish = color(255, 53, 127);
color orgLightLerp;
color orgLightMem;

// orange dark
color pixelOrgDark = color(255, 223, 0);
color orgDarkStart = color(255, 223, 0);
color orgDarkFinish = color(255, 223, 125);
color orgDarkLerp;
color orgDarkMem;

// pink
color pixelPink = color(255, 0, 128);
color pinkStart = color(255, 0, 128);
color pinkFinish = color(255, 200, 128);
color pinkLerp;
color pinkMem;

// light blue
color pixelLightBlue = color(71, 238, 255);
color lightBlueStart = color(71, 238, 255);
color lightBlueFinish = color(0, 71, 55);
color lightBlueLerp;
color lightBlueMem;

// light green
color pixelLightGreen = color(0, 255, 199);
color lightGreenStart = color(0, 255, 199);
color lightGreenFinish = color(255, 55, 055);
color lightGreenLerp;
color lightGreenMem;

// dark green
color pixelDarkGreen = color(0, 255, 128);
color darkGreenStart = color(0, 255, 128);
color darkGreenFinish = color(255, 55, 28);
color darkGreenLerp;
color darkGreenMem;

// puple
color pixelPurple = color(191, 0, 255);
color purpleStart = color(0, 0, 255);
color purpleFinish = color(191, 0, 255);
color purpleLerp;
color purpleMem;


void setup() {
  size(256, 256);
  frameRate(12);

  eye = loadImage("eye256.png");
  eye.loadPixels();

  blackMem = pixelBlack;
  yellowMem = pixelYellow;
  orgLightMem = pixelOrgLight;
  orgDarkMem = pixelOrgDark;
  pinkMem = pixelPink;
  lightBlueMem = pixelLightBlue;
  lightGreenMem = pixelLightGreen;
  darkGreenMem = pixelDarkGreen;
  purpleMem = pixelPurple;
}

void draw() {

  pulse = 0.6*(1+sin(TWO_PI * bpm * frameCount/2));

  blackLerp = lerpColor(blackStart, blackFinish, pulse);
  yellowLerp = lerpColor(yellowStart, yellowFinish, pulse/5);
  orgLightLerp = lerpColor(orgLightStart, orgLightFinish, pulse/6);
  orgDarkLerp = lerpColor(orgDarkStart, orgDarkFinish, pulse/6);
  pinkLerp = lerpColor(pinkStart, pinkFinish, pulse/5);
  lightBlueLerp = lerpColor(lightBlueStart, lightBlueFinish, pulse/5);
  lightGreenLerp = lerpColor(lightGreenStart, lightGreenFinish, pulse/5);
  darkGreenLerp = lerpColor(darkGreenStart, darkGreenFinish, pulse/3);
  purpleLerp = lerpColor(purpleStart, purpleFinish, pulse/3);

  pixelScan(blackMem, blackLerp);
  blackMem = blackLerp;

  pixelScan(yellowMem, yellowLerp);
  yellowMem = yellowLerp;

  pixelScan(orgLightMem, orgLightLerp);
  orgLightMem = orgLightLerp;

  pixelScan(orgDarkMem, orgDarkLerp);
  orgDarkMem = orgDarkLerp;

  pixelScan(pinkMem, pinkLerp);
  pinkMem = pinkLerp;

  pixelScan(lightBlueMem, lightBlueLerp);
  lightBlueMem = lightBlueLerp;

  pixelScan(lightGreenMem, lightGreenLerp);
  lightGreenMem = lightGreenLerp;

  pixelScan(darkGreenMem, darkGreenLerp);
  darkGreenMem = orgDarkLerp;

  pixelScan(purpleMem, purpleLerp);
  purpleMem = purpleLerp;

  eye.updatePixels();

  image(eye, 0, 0);
  
  
  //SAVE FRAMES:
  
  //if (frameCount < 49){
  //saveFrame("eye256_####.png");
  //} else {
  //  noLoop();
  //}
}
