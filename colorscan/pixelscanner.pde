
class pixelscanner {

  PImage image;

  color lerpTarget;
  color targetMem;


  pixelscanner(String file) {

    this.image = loadImage(file);
    this.image.loadPixels();
  }

  // void colorLerp(color a, color lerp) {

  //   for (int i = 0; i < width*height; i++) {
  //     if (image.pixels[i] == a) {
  //       image.pixels[i] = lerp;
  //     }
  //   }
  // }


// COULD REFACTOR colorLerp() TO INCORPORATE METHOD CHAINING
// Something like:
//  pixelscanner.startColor("...").endColor("...").lerp(lerpValue) 
// Maybe find a way to make lerpOut() unnecessary?

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
