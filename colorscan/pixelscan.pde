void pixelScan(color a, color lerp) {
  
  for (int i = 0; i < width*height; i++) {
    if (eye.pixels[i] == a) {
      eye.pixels[i] = lerp;
    }
  }
  
}
