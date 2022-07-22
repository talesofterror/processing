
class pixelscanner {

  PImage image;

  color lerpTarget;
  color targetMem;


  void pixelLoad(String file) {

    this.image = loadImage(file);
    this.image.loadPixels();
  }

  void colorLerp(color startColor, 
    color endColor, float lerpValue) {

    color lerpedColor;
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


  color lerpOut () {

    this.lerpTarget = this.targetMem;
    color memory = this.targetMem;

    return memory;
  }
}
