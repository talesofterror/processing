float time = 0;
float speed = 1;
boolean pause = false;
color introStrokeColor = color(255, 220, 10);

void setup() {
  size(600, 600);
  frameRate(24);
  getSurface().setLocation(300, 300);
  }

void draw() {
  background(50);
  time = frameCount / speed;
  
  float sineOfTime50 = sineOfTime(50); 
  float absSine50 = absSine(50);

  stroke(255);
  fill(0);
  rect(90, 5, 115, 170);
  fill(255);

  line(95, 5, 95, absSine50 * 100);
  text(sineOfTime50, 100, 100);
  // println(absSine50);

  text(absSine50, 100, 120);
  for (float x = 100; x <= 200; x+=1) {
    float yInc = round(sineOfTime(20) * 10);
    point(x, 150 + yInc);
  }

  fill(255, 204, 0);
  stroke(introStrokeColor);
  text("function", 100, 190);
  sineWave(100, 220, 10, 0); // sineWave( x, y, amp, phase )
  sineWave(100, 220, 20, 0);
  sineWave(100, 220, 5, 0);
  sineWave(100, 220, 5, 2);


  for (float a = 0; a <= 20; a++) {
    sineWave(100, 250, a, 10);
  }

  for (float a = 0; a <= 20; a++) {
    sineWave(100, 300, a * sineOfTime(50), 10);
  }

  for (float a = 0; a <= 20; a++) {
    sineWave(100, 350, a * sineOfTime(50), 10 * sineOfTime(50));
  }
}

float sineOfTime(float freq) {
  float timeOverFreq = TWO_PI / freq * time;
  float sine = sin(timeOverFreq);
  time+=0.5;
  return sine;
}

float absSine(float freq) {
  float timeOverFreq = TWO_PI / freq * time;
  float sine = abs(sin(timeOverFreq));
  time+=0.5;
  return sine;
}

void sineWave(float xPos, float yPos, float amp, float phase) {
  for (float x = xPos; x <= xPos + 100; x+=1) {
    float yInc = round(sineOfTime(50) * amp + phase);
    point(x, yPos + yInc);
  }
}



void mouseClicked() {
  if (pause == false) {
    noLoop();
    pause = true;
    println(pause);
  } else if (pause == true) {
    loop();
    pause = false;
    println(pause);
  }
}
