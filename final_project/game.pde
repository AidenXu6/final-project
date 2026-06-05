void game() {
  map();
  int oldRedX = redX;
int oldRedY = redY;

  int oldBlueX = blueX;
int oldBlueY = blueY;

  // Red player
  if (wkey==true) {
    redY = redY-5;
    redr=3*PI/2;
  }

  if (skey==true) {
    redY =redY+5;
    redr=PI/2;
  }

  if (akey==true) {
    redX= redX-5;
    redr=PI;
  }

  if (dkey==true) {
    redX = redX+5;
    redr=0;
  }


  // Blue player
  if (upkey==true) {
    blueY = blueY-5;
    bluer=3*PI/2;
  }

  if (downkey==true) {
    blueY = blueY+5;
    bluer=PI/2;
  }

  if (leftkey==true) {
    blueX= blueX-5;
    bluer=PI;
  }

  if (rightkey==true) {
    blueX = blueX+5;
    bluer=0;
  }
    float cx = redX+700;      // circle position (set with mouse)
float cy = redY+500;
    float cx1 = blueX+1100;      // circle position (set with mouse)
float cy1 = blueY+300;

  redX=constrain(redX, -700, 1100);
  redY=constrain(redY, -500, 500);

  blueX=constrain(blueX, -1100, 700);
  blueY=constrain(blueY, -500, 500);
  
   boolean hit = circleRect(cx,cy,r, sx,sy,sw,sh);
  if (hit) {
 redX = oldRedX;
  redY=oldRedY;
  }
  
     boolean hit1 = circleRect(cx1,cy1,r1, sx,sy,sw,sh);
  if (hit) {
 blueX = oldBlueX;
  blueY=oldBlueY;
  }

  pushMatrix();
  translate(redX+700, redY+500);
  rotate(redr);
  redcharacter(0, 0);
  popMatrix();

  pushMatrix();
  translate(blueX + 1100, blueY + 500);
  rotate(bluer);
  bluecharacter(0, 0);
  popMatrix();
}

void gameClicks() {
  mode=pause;
}

void redcharacter(int x, int y) {
  fill(#FADD7C);
  ellipse(-5+x, -40+y, 50, 10);
  ellipse(-5+x, 40+y, 50, 10);

  fill(#FF0000);
  ellipse(-33+x, -15+y, 25, 25);
  ellipse(-33+x, 15+y, 25, 25);

  ellipse(0+x, 0+y, 75, 75);

  fill(0);
  ellipse(15+x, 0+y, 65, 65);
}

void bluecharacter(int x, int y) {
  fill(#FADD7C);
  ellipse(-5+x, -40+y, 50, 10);
  ellipse(-5+x, 40+y, 50, 10);

  fill(#0700FF);
  ellipse(-33+x, -15+y, 25, 25);
  ellipse(-33+x, 15+y, 25, 25);

  ellipse(0+x, 0+y, 75, 75);

  fill(0);
  ellipse(15+x, 0+y, 65, 65);
}

// CIRCLE/RECTANGLE
boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

  // temporary variables to set edges for testing
  float testX = cx;
  float testY = cy;

  // which edge is closest?
  if (cx < rx)         testX = rx;      // test left edge
  else if (cx > rx+rw) testX = rx+rw;   // right edge
  if (cy < ry)         testY = ry;      // top edge
  else if (cy > ry+rh) testY = ry+rh;   // bottom edge

  // get distance from closest edges
  float distX = cx-testX;
  float distY = cy-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the radius, collision!
  if (distance <= radius) {
    return true;
  }
  return false;
}

// CIRCLE/RECTANGLE
boolean circleRect1(float cx1, float cy1, float radius1, float rx, float ry, float rw, float rh) {

  // temporary variables to set edges for testing
  float testX1 = cx1;
  float testY1 = cy1;

  // which edge is closest?
  if (cx1 < rx)         testX1 = rx;      // test left edge
  else if (cx1 > rx+rw) testX1 = rx+rw;   // right edge
  if (cy1 < ry)         testY1 = ry;      // top edge
  else if (cy1 > ry+rh) testY1 = ry+rh;   // bottom edge

  // get distance from closest edges
  float distX1 = cx1-testX1;
  float distY1 = cy1-testY1;
  float distance1 = sqrt( (distX1*distX1) + (distY1*distY1) );

  // if the distance is less than the radius, collision!
  if (distance1 <= radius1) {
    return true;
  }
  return false;
}
