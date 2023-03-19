/* autogenerated by Processing revision 1289 on 2023-03-19 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class colorscan extends PApplet {


float time = 0; 
float pulse;
float bpm = 0.25f;
int dimensionX;
int dimensionY;

PImage eye;
pixelscanner scanBlack;
pixelscanner scanWhite;

float testSine;


public void setup() {
  /* size commented out by preprocessor */;
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

public void draw() {

  float sineInc = sineOfTime(30, 1);
  println(sineInc);
  
  background(0);

  scanBlack.newColorLerp(color(255, 0, 0), color(0, 0, 255), sineInc);
  scanBlack.lerpOut();

  scanWhite.newColorLerp(color(255, 155, 0), color(255, 55, 0), sineInc);
  scanWhite.lerpOut();
  
  //sineVisualizer(sineOfTime(50, 10), width*0.7, height*0.7);
  sineWave(sineInc, width*0.7f, height*0.7f, 50, 50);
  
  if (keyPressed) {
    if (key == 'w'){
      exit();
    }
  }
  
  //saveFrames();
}

public float sineOfTime (float freq, float amp) {
  float timeOverFreq = (TWO_PI / freq * time);
  float sine = amp * abs(sin(timeOverFreq));
  time++;
  //println(time);
  return sine;
}

public void sineVisualizer (float sine, float xCoord, float yCoord) {
  
  stroke(255, 0, 0);
  rect(xCoord, yCoord, 200, 100);
  
  for (int x = 0; x < 100; x++) {
    float yInc = round(sine); 
    stroke(255, 0, 0);
    point(x + xCoord, yCoord + yInc);
  }
}

public void sineWave(float sine, float xPos, float yPos, float amp, float phase) {
  float i = 0;
  strokeWeight(3);
  for (float x = xPos; x <= xPos + 100; x+=1) {
    float yInc = round(sine);
    point(x, yPos + yInc + i);
    i+=0.2f;
  }
}

public void saveFrames () {
  if (frameCount < 49) {
    saveFrame("frames-oldmethod/eye500_####.png");
  } else {
    noLoop();
    print("render complete");
  }
}

class pixelscanner {

  PImage image;

  int lerpTarget;
  int targetMem;


  public void pixelLoad(String file) {

    this.image = loadImage(file);
    this.image.loadPixels();
  }

  public void colorLerp(int a, int lerp) {

    for (int i = 0; i < width*height; i++) {
      if (image.pixels[i] == a) {
        image.pixels[i] = lerp;
      }
    }
  }

  public void newColorLerp(int startColor, 
    int endColor, float lerpValue) {

    int lerpedColor;
    lerpedColor = lerpColor(startColor, endColor, lerpValue);

    for (int i = 0; i < width * height; i++) {
      if (this.image.pixels[i] == this.lerpTarget) {
        this.image.pixels[i] = lerpedColor;
      } else if ( this.image.pixels[i] != this.lerpTarget) {
        this.image.pixels[i] = color(0, 0, 0, 1); }
    }

    this.targetMem = lerpedColor;
    this.image.updatePixels();
    image(this.image, 0, 0);
    //this.image.resize(dimensionX, 0);
  }


  public int lerpOut () {

    this.lerpTarget = this.targetMem;
    int memory = this.targetMem;

    return memory;
  }
}


  public void settings() { size(1600, 1600); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "colorscan" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
