void game() {
  map();
  
  

textSize(75);
  text(" Blue Score:"+bluescore/60, 190, 75);
  text(" Red Score:"+redscore/60, 1200, 75);


       
  int oldRedX = redX;
int oldRedY = redY;

  int oldBlueX = blueX;
int oldBlueY = blueY;

  // Red player
  if (redstun<0){
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
  }


  // Blue player
  if (bluestun<0){
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
  }





  if (redcrown) {
   
    fill(#DDF057);
    ellipse(redX+700,redY+500,125,125);
    redscore=redscore+1;
  }
  
if (bluecrown) {
  
    fill(#DDF057);
    ellipse(blueX+1100,blueY+500,125,125);
    bluescore=bluescore+1;
  }

if (redscore==1800){
  mode=gameover;
}

if (bluescore==1800){
  mode=gameover;
}

  redX=constrain(redX, -700, 1100);
  redY=constrain(redY, -500, 500);

  blueX=constrain(blueX, -1100, 700);
  blueY=constrain(blueY, -500, 500);
  
  // Red collision 
float redCx = redX + 700;
float redCy = redY + 500; 

// Blue collision 
float blueCx = blueX + 1100; 
float blueCy = blueY + 500;

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
  
  
 if(redstun<=0&&bluestun<=0){
  boolean hit = circleCircle(redCx,redCy,redRadius, blueCx,blueCy,blueRadius);
  if (hit) {
      if(redcrown){
        delay(1);
    bluecrown=true;
    redcrown=false;
    redstun=60;
   
  } else if (bluecrown){
    delay(1);
    redcrown=true;
    bluecrown=false;
     bluestun=60;
   
  }
  }
 }
 
 if (crownVisible){
  boolean hit2 = circleCircle2(redCx,redCy,redRadius, crownX,crownY,crownRadius);
  if (hit2) {
redcrown=true;
bluecrown=false;
crownVisible=false;
  }
  
    boolean hit3 = circleCircle3(blueCx,blueCy,blueRadius, crownX,crownY,crownRadius);
  if (hit3) {
bluecrown=true;
redcrown=false;
crownVisible=false;
  }
 }

   if (crownVisible) {
  crown(900,500);
}

    redstun=redstun-1;
  bluestun=bluestun-1;
  
  

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

// CIRCLE/CIRCLE
boolean circleCircle(float redCx, float redCy, float redRadius, float blueCx, float blueCy, float blueRadius) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance
  float distXc = redCx - blueCx;
  float distYc = redCy - blueCy;
  float distancec = sqrt( (distXc*distXc) + (distYc*distYc) );

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distancec <= redRadius+blueRadius) {
    return true;
  }
  return false;
}


// CIRCLE/CIRCLE
boolean circleCircle2(float redCx, float redCy, float redRadius, float crownX, float crownY, float crownRadius) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance
  float distXc2 = redCx - crownX;
  float distYc2 = redCy - crownY;
  float distancec2 = sqrt( (distXc2*distXc2) + (distYc2*distYc2) );

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distancec2 <= redRadius+crownRadius) {
    return true;
  }
  return false;
}


// CIRCLE/CIRCLE
boolean circleCircle3(float blueCx, float blueCy, float blueRadius, float crownX, float crownY, float crownRadius) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance
  float distXc3 = blueCx - crownX;
  float distYc3 = blueCy - crownY;
  float distancec3 = sqrt( (distXc3*distXc3) + (distYc3*distYc3) );

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distancec3 <= blueRadius+crownRadius) {
    return true;
  }
  return false;
}










void crown(int x,int y){
  stroke(1);
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
