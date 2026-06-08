void game() {
  map();
  
  if (crownVisible) {
  crown(900,500);
}
  
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

if (dist(redX+700, redY+500, crownX, crownY) < crownRadius + r) {
  crownVisible = false;
  redcrown=true;
}

if (dist(blueX+1100, blueY+500, crownX, crownY) < crownRadius + r) {
  crownVisible = false;
  bluecrown=true;
}

if (dist(blueX+1100, blueY+500, redX+700, redY+500) < 75) {
  redcrown=true;
}

if (dist(redX+700, redY+500, blueX+1100, blueY+500) < 75) {
  bluecrown=true;
}

if (redcrown){
  bluecrown=false;
  fill(#CDCE02);
  ellipse(redX+700,redY+500,125,125);
}

if (bluecrown){
  redcrown=false;
  fill(#CDCE02);
  ellipse(blueX+1100,redY+500,125,125);
}


  redX=constrain(redX, -700, 1100);
  redY=constrain(redY, -500, 500);

  blueX=constrain(blueX, -1100, 700);
  blueY=constrain(blueY, -500, 500);
  
  // Red collision
  float redCx = redX + 700;
  float redCy = redY + 500;

  if (circleRect(redCx, redCy, r, sx, sy, sw, sh)) {
    redX = oldRedX;
    redY = oldRedY;
  }
  
    if (circleRect2(redCx, redCy, r, sx2, sy2, sw2, sh2)) {
    redX = oldRedX;
    redY = oldRedY;
  }
  
      if (circleRect3(redCx, redCy, r, sx3, sy3, sw3, sh3)) {
    redX = oldRedX;
    redY = oldRedY;
  }
  
        if (circleRect4(redCx, redCy, r, sx4, sy4, sw4, sh4)) {
    redX = oldRedX;
    redY = oldRedY;
  }

  // Blue collision
  float blueCx = blueX + 1100;
  float blueCy = blueY + 500;

  if (circleRect(blueCx, blueCy, r, sx, sy, sw, sh)) {
    blueX = oldBlueX;
    blueY = oldBlueY;
  }
  
  if (circleRect2(blueCx, blueCy, r, sx2, sy2, sw2, sh2)) {
    blueX = oldBlueX;
    blueY = oldBlueY;
  }
  
    if (circleRect3(blueCx, blueCy, r, sx3, sy3, sw3, sh3)) {
    blueX = oldBlueX;
    blueY = oldBlueY;
  }
  
      if (circleRect4(blueCx, blueCy, r, sx4, sy4, sw4, sh4)) {
    blueX = oldBlueX;
    blueY = oldBlueY;
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
  noStroke();
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
  noStroke();
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

// house hitbox top part
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

// house hitbox bottom part
boolean circleRect2(float cx, float cy, float radius, float rx2, float ry2, float rw2, float rh2) {

  // temporary variables to set edges for testing
  float testX2 = cx;
  float testY2 = cy;

  // which edge is closest?
  if (cx < rx2)         testX2 = rx2;      // test left edge
  else if (cx > rx2+rw2) testX2 = rx2+rw2;   // right edge
  if (cy < ry2)         testY2 = ry2;      // top edge
  else if (cy > ry2+rh2) testY2=ry2+rh2;
  // get distance from closest edges
  float distX2 = cx-testX2;
  float distY2 = cy-testY2;
  float distance2 = sqrt( (distX2*distX2) + (distY2*distY2) );

  // if the distance is less than the radius, collision!
  if (distance2 <= radius) {
    return true;
  }
  return false;
}

boolean circleRect3(float cx, float cy, float radius, float rx3, float ry3, float rw3, float rh3) {

  // temporary variables to set edges for testing
  float testX3 = cx;
  float testY3 = cy;

  // which edge is closest?
  if (cx < rx3)         testX3 = rx3;      // test left edge
  else if (cx > rx3+rw3) testX3 = rx3+rw3;   // right edge
  if (cy < ry3)         testY3 = ry3;      // top edge
  else if (cy > ry3+rh3) testY3=ry3+rh3;
  // get distance from closest edges
  float distX3 = cx-testX3;
  float distY3 = cy-testY3;
  float distance3 = sqrt( (distX3*distX3) + (distY3*distY3) );

  // if the distance is less than the radius, collision!
  if (distance3 <= radius) {
    return true;
  }
  return false;
}

boolean circleRect4(float cx, float cy, float radius, float rx4, float ry4, float rw4, float rh4) {

  // temporary variables to set edges for testing
  float testX4 = cx;
  float testY4 = cy;

  // which edge is closest?
  if (cx < rx4)         testX4 = rx4;      // test left edge
  else if (cx > rx4+rw4) testX4 = rx4+rw4;   // right edge
  if (cy < ry4)         testY4 = ry4;      // top edge
  else if (cy > ry4+rh4) testY4=ry4+rh4;
  // get distance from closest edges
  float distX4 = cx-testX4;
  float distY4 = cy-testY4;
  float distance4 = sqrt( (distX4*distX4) + (distY4*distY4) );

  // if the distance is less than the radius, collision!
  if (distance4 <= radius) {
    return true;
  }
  return false;
}

void crown(int x,int y){
fill(#CDCE02);
ellipse(0+x, 0+y, 100, 100);

noStroke();
fill(#FCFC0A);
rect(-25+x, 0+y, 50, 25);

triangle(-25+x, 0+y, -20+x, -25+y, -15+x, 0+y);
triangle(-15+x, 0+y, -10+x, -25+y, -5+x, 0+y);
triangle(-5+x, 0+y, 0+x, -25+y, 5+x, 0+y);
triangle(5+x, 0+y, 10+x, -25+y, 15+x, 0+y);
triangle(15+x, 0+y, 20+x, -25+y, 25+x, 0+y);
}
