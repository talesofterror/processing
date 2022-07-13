WaveCircle circ1, circ2;

void setup() {
  size(400, 400, P3D);
  //frameRate(0.3);
  circ1 = new WaveCircle();
  circ2 = new WaveCircle();
}

float radDist(float t1, float t2) {
  while (t1>=TWO_PI) t1-= TWO_PI;
  while (t1<0) t1 += TWO_PI;

  while (t2>=TWO_PI) t2-= TWO_PI;
  while (t2<0) t2 += TWO_PI;

  float d = abs(t1-t2);
  if (d>=PI) {
    d = PI-(d-PI);
  }
  
  return d;
}

float inc = 0.01;
float circSize = 100;
float distortSize = 1.0;
int freq = 20;

float z =0;
float s = 0;

void draw() {

  inc = 0.01;
  circSize = 100;
  distortSize = 1.0;
  freq = 10;

  strokeWeight(2);
  s += 0.003;
  //if (s >= TWO_PI) s -= TWO_PI;

  float speed = 0.05;

  z += speed;
  if (z >= TWO_PI) z-= TWO_PI;

  clear();
  circ1.draw(z, 1);
  circ2.draw(z, -1);

  //saveFrame("gif/####.png");
}

class WaveCircle {


//  WaveCircle() {
//  }

  void draw(float z, float q) {
    pushMatrix();
    noFill();
    stroke(255);
    beginShape();

    translate(2*circSize, 2*circSize);
    for (float i = 0; i <= TWO_PI; i+=inc) {
      float rad = circSize;
      float dist  = pow(radDist(i, z), 2.0);
      rad += q*distortSize*dist*sin(i*freq);
      vertex(rad*sin(i+s), rad*cos(i+s));
    }
    endShape();
    popMatrix();
  }
}
