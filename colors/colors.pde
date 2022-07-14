Toggler toggle;

void setup()
{
  size(500, 500);
  frameRate(24);
  noCursor();

  toggle = new Toggler();



  // println(r + ", " + g + ", " + b + "; ");
  // println("flipR = " + flipR + ", flipG = " + flipG + ", flipB = " + flipB);
  // println(" ");
}

void draw()
{
  background(r, g, b);

  toggle.red();
  toggle.green();
  toggle.blue();

  stroke(r + r, g + g, b + b);
  line(50, 0, 50, 500);

  stroke(r + r, g + g, b + b);
  line(100, 0, 100, 500);

  stroke(r + r, g + g, b + b);
  line(150, 0, 150, 500);

  stroke(r + r, g + g, b + b);
  line(200, 0, 200, 500);

  stroke(r + r, g + g, b + b);
  line(250, 0, 250, 500);

  stroke(r + r, g + g, b + b);
  line(300, 0, 300, 500);

  stroke(r + r, g + g, b + b);
  line(350, 0, 350, 500);

  stroke(r + r, g + g, b + b);
  line(400, 0, 400, 500);

  stroke(r + r, g + g, b + b);
  line(450, 0, 450, 500);

  // stroke(r + r, g + g, b + b);
  // line(50, 0, 50, 500);


  rectMode(CORNER);


  //COLOR BOXES ROW 1
  stroke(0);
  fill(0, 0, 0);  //BLACK
  rect(1, 10, 30, 30); 

  stroke(0);
  fill(255, 0, 0); //RED
  rect(32, 10, 30, 30); 

  stroke(0);
  fill(0, 255, 0);  //GREEN
  rect(62, 10, 30, 30); 

  stroke(0);
  fill(0, 0, 255);  //BLUE
  rect(92, 10, 30, 30); 

  //COLOR BOXES ROW 2

  stroke(0);
  fill(0, 0, 0);  //BLACK
  rect(1, 50, 30, 30); 

  stroke(0);
  fill(255, 255, 0);  //YELLOW
  rect(32, 50, 30, 30); 

  stroke(0);
  fill(0, 255, 255);  //CYAN
  rect(62, 50, 30, 30); 

  stroke(0);
  fill(255, 0, 255);  //MAGENTA
  rect(92, 50, 30, 30); 



  Cursor();
}
