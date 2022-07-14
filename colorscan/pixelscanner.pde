
class pixelscanner {

   PImage image;
   
   color lerpTarget;
   color targetMem;


   void pixelLoad(String file) {

      image = loadImage(file);
      image.loadPixels();
   }

   void colorLerp(color a, color lerp) {

      for (int i = 0; i < width*height; i++) {
         if (image.pixels[i] == a) {
            image.pixels[i] = lerp;
         }
      }
   }

   void newColorLerp(color target, color startColor, 
                     color endColor, float lerpValue) {
      
      color lerpedColor;
      lerpedColor = lerpColor(startColor, endColor, lerpValue);

      for (int i = 0; i < width * height; i++) {
         if (image.pixels[i] == target) {
            image.pixels[i] = lerpedColor;
         }
      }

      targetMem = lerpedColor;
      image.updatePixels();
      image(image, 0, 0);
   }


   color lerpOut () {
      
      lerpTarget = targetMem;
      color memory = targetMem;

      return memory;
   }
}
