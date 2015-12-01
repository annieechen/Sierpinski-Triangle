


//variables to change width and height of the screen, depending on how much of the triangle one wants displayed. These are the only variables that need to be changed
int w = 500;
int h = 500;

// color of "off" pixels
color background = color(255, 255, 255);
//color of "on" pixels
color green = color (14, 235, 147);

//set up and establish all pixels as "off"
void setup () {
  size (w, h);
  background (background);
}


void draw () {
  loadPixels ();
  //turn on middle pixel in first row
  pixels[index(h/2,1)]= green;
  
  //loop through all the pixels one at a time, starting from the second row
  for (int i = w+1 ; i < w*h ; i++) {
    int x = returnX (i); 
    int y = returnY (i);
   
    //checks the pixel up and to the right and the pixel up and to the left. If one of them is "on", but not the other, it turns the pixel it is checking from on. 
    if ((pixels[index (x-1, y-1)] == green) && (pixels[index(x + 1,y -1)]!=green) || (pixels[index (x-1, y-1)] != green) && (pixels[index(x + 1,y -1)]==green)) {
    pixels[i] = green;
    }
  }
updatePixels();
}

//changes from x and y coordinates to a single index
int index ( int x, int y) {
  //x = x value, y = y value
  return w*y +x ;
}

//returns the x coordinate from an index by taking the remainder when divided by the width
int returnX (int A) {
  return A % w ;
}

//returns the y coordinate from an index by dividing by width and rounding down
int returnY ( int A) {
  return floor(A/w);
}
  
