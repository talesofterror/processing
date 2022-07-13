float time = 0;
boolean pause;

void setup() {
  size(600, 600); 
  frameRate(24);
}

void draw() {
  background(50);

  float absSine100 = abs(sineOfTime(100));

  stroke(255); 
  text(sineOfTime(50), 100, 100);
  text(absSine100, 100, 120);

  line(95, -125, 95, absSine100 * 125);

  point(100, 250);

  for (float x = 100; x <= 200; x+=1) {
    float yInc = round(sineOfTime(100) * 10);
    point(x, 150 + yInc);
  }
}

float sineOfTime(float freq) {
  float timeOverFreq = TWO_PI / freq * time;
  float sine = sin(timeOverFreq); 
  time++;
  return sine;
}

void mousePressed() {
    if (pause == false){
      noLoop(); pause = true;}
    if (pause == true){
      loop(); pause = false;}
  }
