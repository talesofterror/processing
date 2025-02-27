/* autogenerated by Processing revision 1289 on 2025-01-19 */
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

public class videoScramble extends PApplet {

PImage[] frameArray;
int currentFrame = 0;

public void setup () {
  frameArray = new PImage[249];
  for (int i = 0; i < frameArray.length; i++) {
    println("Loading image => " + formatNumber(i) + ".png");
    frameArray[i] = loadImage("assets/" + formatNumber(i) + ".png");
  }

  println("frameArray.length = " + frameArray.length);
  
  surface.setLocation(0,0);
  frameRate(10);
  /* size commented out by preprocessor */;
}

public void draw() {
  frameCalculator();
  println(java.time.LocalDateTime.now() + " >> Current Frame => " + currentFrame);
  image(frameArray[currentFrame], 0, 0);
  currentFrame++;
}

private String formatNumber (int i) {
  String index = String.valueOf(i+2);
  if (index.length() == 1) {
    return "000" + index;
  } else if (index.length() == 2) {
    return "00" + index;
  } else {
    return "0" + index;
  }
}

public void frameCalculator () {
  for (int i = 0; i < frameArray.length-1; i++) {
    if (i > frameArray.length-2) {
      currentFrame = 0;
    }
  }
  loop();
}


  public void settings() { size(1920, 1080); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "videoScramble" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
