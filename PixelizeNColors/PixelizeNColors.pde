
// USER-SET VARIABLES
String STR_IMG = "Elestinae8Poser.jpg"; //2172 × 2880
String STR_SAVE = "P_Elestinae8Poser.jpg"; // FORMAT OPTIONS: .tif .tga .jpg .png

color[] COLORS_PIXELIZER = {
  color(   0,   0,   0),  // 1
  color(  36,  36,  36),  // 2
  color(  73,  73,  73),  // 3
  color( 109, 109, 109),  // 4
  color( 146, 146, 146),  // 5
  color( 182, 182, 182),  // 6
  color( 219, 219, 219),  // 7
  color( 127, 127, 127),  // 8
  color( 255, 255, 255)   // 9
};

color[] COLORS_ENGRAVER = {
  color(   0,   0,   0),  // 1
  color( 255,   0,   0),  // 2
  color(   0,   0, 255),  // 3
  color(  51, 102, 153),  // 4
  color(   0, 255, 255),  // 5
  color(   0, 255,   0),  // 6
  color(   0, 153,  51),  // 7
  color(   0, 102,  51),  // 8
  color( 153, 153,  51),  // 9
  color( 153, 102,  51),  // 10
  color( 102,  51,   0),  // 11
  color( 102,   0, 102),  // 12
  color( 153,   0, 204),  // 13
  color( 255,   0, 255),  // 14
  color( 255, 102,   0),  // 15
  color( 255, 255,   0)   // 16
};
/* <--- move w/}; to adjust colors N 1-16  */

int WINDOW_WIDTH  = 640;
int WINDOW_HEIGHT = 360;

// END USER-SET VARIABLES


PImage img;


void setup() {
  size(800, 500);
  surface.setResizable(true);
  img = loadImage(STR_IMG);
  image(img, 0, 0);
  int dimension = img.width * img.height;
  loadPixels();
  println("width: " + img.width);
  println("height: " + img.height);
  println("dimension: " + dimension);
  for (int i = 0; i < img.width; i += 1) {
    for (int j = 0; j < img.height; j += 1) {
      img.set(i,j,pixelizer(img.get(i,j), COLORS_PIXELIZER, COLORS_ENGRAVER));
    }
  }
  img.save(STR_SAVE);
}

void draw() {
  image(img, 0, 0);
}



color pixelizer(color c, color[] cs, color[] ce) {
  color rc = c;
  
  float idist = 999999999;
  for (int i = 0; i < cs.length; i += 1) {
    float tdist = cdistance(c, cs[i]);
    if (tdist < idist) {
      rc = ce[i];
      idist = tdist;
    }
  }
  
  return rc;
}


float cdistance(color c1, color c2) {
 float cdist = 0;
 
 float r = red(c1) - red(c2);
 float g = green(c1) - green(c2);
 float b = blue(c1) - blue(c2);
 
 cdist = sqrt(pow(r,2) + pow(g,2) + pow(b,2));
 
 return cdist;
}