PVector canvas;
PVector worldOrigin;
PVector object;
PVector movementVector = new PVector(1, 1);
PVector directionVector;
boolean edgeHit = false;

enum Direction {
  forward,
    backward
}

Direction direction = Direction.forward;

void setup() {
  size(400, 400);
  canvas = new PVector(width, height);
  object = new PVector(10, 10);
  worldOrigin = new PVector(0, 0);
}

void draw() {
  background(100);
  stroke(255, 150, 0);
  strokeWeight(5);

  bouncingDot();
}

void bouncingDot () {
  point(object.x, object.y);

  if (object.equals(worldOrigin) | object.equals(canvas)) {
    directionToggle();
  }

  if (direction == Direction.forward) {
    object.add(movementVector);
  } else {
    object.sub(movementVector);
  }
}

void directionToggle() {
  if (direction == Direction.forward) {
    direction = Direction.backward;
  } else {
    direction = Direction.forward;
  }

  edgeHit = !edgeHit;
}
