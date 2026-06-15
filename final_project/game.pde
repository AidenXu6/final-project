void game() {
  map();

  mowerTimer=mowerTimer-1;

if (mowerTimer <= 0) {
  mowerDir = int(random(4));   // random direction
  mowerTimer = 60;             // change every second
}

// move
int speed = 3;

if (mowerDir == 0) mowx=mowx+speed;      // right
if (mowerDir == 1) mowy= mowy+speed;      // down
if (mowerDir == 2) mowx=mowx- speed;      // left
if (mowerDir == 3) mowy=mowy- speed;      // up

if (mowerDir == 0){
  mowerAngle = 0;
  moww=100;
  mowh=50;
}
if (mowerDir == 1){
  moww=50;
  mowh=100;
  mowerAngle = PI/2;
}
if (mowerDir == 2) {
  mowerAngle = PI;
    moww=100;
  mowh=50;
}
if (mowerDir == 3) {
  mowerAngle = 3*PI/2;
  moww=50;
  mowh=100;
}

mowx = constrain(mowx, -150, 250);
mowy = constrain(mowy, -50, 400);
  
fill(#FC0000);
textSize(75);
  text(" Blue Score:"+bluescore/60, 190, 75);
  text(" Red Score:"+redscore/60, 1200, 75);

pushMatrix();
translate(300+mowx, 200+mowy);
rotate(mowerAngle);
lawnmower(0,0);
popMatrix();
       
  int oldRedX = redX;
int oldRedY = redY;

  int oldBlueX = blueX;
int oldBlueY = blueY;

  // Red player
  if (redstun<0&&mudslowred<0){
  if (wkey==true) {
    redY = redY-5;
    redr=3*PI/2;
    muds.rewind();
  }

  if (skey==true) {
    redY =redY+5;
    redr=PI/2;
     muds.rewind();
 
  }

  if (akey==true) {
    redX= redX-5;
    redr=PI;
     
    muds.rewind();
  }

  if (dkey==true) {
    redX = redX+5;
    redr=0;
      muds.rewind();
    
  }
  }else if (redstun<0&&mudslowred>0){
  if (wkey==true) {
    redY = redY-2;
    redr=3*PI/2;
   
  }

  if (skey==true) {
    redY =redY+2;
    redr=PI/2;
  
  }

  if (akey==true) {
    redX= redX-2;
    redr=PI;
  
  }

  if (dkey==true) {
    redX = redX+2;
    redr=0;
   
  }
  }

  // Blue player
  if (bluestun<0&&mudslowblue<0){
  if (upkey==true) {
    blueY = blueY-5;
    bluer=3*PI/2;
    muds.rewind();
  }

  if (downkey==true) {
    blueY = blueY+5;
    bluer=PI/2;
    muds.rewind();
  }

  if (leftkey==true) {
    blueX= blueX-5;
    bluer=PI;
    muds.rewind();
  }

  if (rightkey==true) {
    blueX = blueX+5;
    bluer=0;
    muds.rewind();
  }
  }else if (bluestun<0&&mudslowblue>0){
     if (upkey==true) {
    blueY = blueY-2;
    bluer=3*PI/2;
 
  }

  if (downkey==true) {
    blueY = blueY+2;
    bluer=PI/2;

  }

  if (leftkey==true) {
    blueX= blueX-2;
    bluer=PI;

  }

  if (rightkey==true) {
    blueX = blueX+2;
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
        theme.pause();
    
    gameovers.rewind();
    gameovers.play();
}

if (bluescore==1800){
  mode=gameover;
      theme.pause();
    
    gameovers.rewind();
    gameovers.play();
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
  
          if (circleRect5(redCx, redCy, redRadius, mowx+300, mowy+200, moww, mowh)) {
    redX = oldRedX;
    redY = oldRedY;
    redstun=60;
    lawnmowers.play();
    lawnmowers.rewind();
  }
            if (circleRect5(blueCx, blueCy, blueRadius, mowx+300, mowy+200, moww, mowh)) {
    blueX = oldBlueX;
    blueY = oldBlueY;
    bluestun=60;
     lawnmowers.play();
    lawnmowers.rewind();
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
  
  boolean hit4=circleCircle4(blueCx,  blueCy,  blueRadius,  mudX,  mudY,  mudr);
  if(hit4){
    mudslowblue=90;
    
 muds.play();

  }
  
    boolean hit5=circleCircle5(redCx,  redCy,  redRadius,  mudX,  mudY,  mudr);
  if(hit5){
    mudslowred=90;

 
 muds.play();
    
  }
    
      boolean hit6=circleCircle6(redCx,  redCy,  redRadius,  mudX2,  mudY2,  mudr2);
  if(hit6){
    mudslowred=90;
  
    muds.play();

    
  }
  
    boolean hit7=circleCircle7(blueCx,  blueCy,  blueRadius,  mudX2,  mudY2,  mudr2);
  if(hit7){
    mudslowblue=90;
  
   muds.play();

    
  }
  
      boolean hit8=circleCircle8(blueCx,  blueCy,  blueRadius,  mudX3,  mudY3,  mudr3);
  if(hit8){
    mudslowblue=90;
     muds.play();
   

   
  }
  
        boolean hit9=circleCircle9(redCx,  redCy,  redRadius,  mudX3,  mudY3,  mudr3);
  if(hit9){
    mudslowred=90;
   
    muds.play();
  
  }
 
 
  
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
  mudslowblue= mudslowblue-1;
  
  mudslowred= mudslowred-1;

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

boolean circleRect5(float redCx, float redCy, float redRadius, float mowx, float mowy, float moww, float mowh) {

  // temporary variables to set edges for testing
  float testX5 = redCx;
  float testY5 = redCy;

  // which edge is closest?
  if (redCx < mowx)         testX5 = mowx;      // test left edge
  else if (redCx > mowx+moww) testX5 = mowx+moww;   // right edge
  if (redCy < mowy)         testY5 = mowy;      // top edge
  else if (redCy > mowy+mowh) testY5=mowy+mowh;
  // get distance from closest edges
  float distX5 = redCx-testX5;
  float distY5 = redCy-testY5;
  float distance5 = sqrt( (distX5*distX5) + (distY5*distY5) );

  // if the distance is less than the radius, collision!
  if (distance5 <= redRadius) {
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

// CIRCLE/CIRCLE
boolean circleCircle4(float blueCx, float blueCy, float blueRadius, float mudX, float mudY, float mudr) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance
  float distXc4 = blueCx - mudX;
  float distYc4 = blueCy - mudY;
  float distancec4 = sqrt( (distXc4*distXc4) + (distYc4*distYc4) );

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distancec4 <= blueRadius+mudr) {
    return true;
  }
  return false;
}

// CIRCLE/CIRCLE
boolean circleCircle5(float redCx, float redCy, float redRadius, float mudX, float mudY, float mudr) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance
  float distXc5 = redCx - mudX;
  float distYc5 = redCy - mudY;
  float distancec5 = sqrt( (distXc5*distXc5) + (distYc5*distYc5) );

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distancec5 <= redRadius+mudr) {
    return true;
  }
  return false;
}

// CIRCLE/CIRCLE
boolean circleCircle6(float redCx, float redCy, float redRadius, float mudX2, float mudY2, float mudr2) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance
  float distXc6 = redCx - mudX2;
  float distYc6 = redCy - mudY2;
  float distancec6 = sqrt( (distXc6*distXc6) + (distYc6*distYc6) );

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distancec6 <= redRadius+mudr2) {
    return true;
  }
  return false;
}

// CIRCLE/CIRCLE
boolean circleCircle7(float blueCx, float blueCy, float blueRadius, float mudX2, float mudY2, float mudr2) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance
  float distXc7 = blueCx - mudX2;
  float distYc7 = blueCy - mudY2;
  float distancec7 = sqrt( (distXc7*distXc7) + (distYc7*distYc7) );

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distancec7 <= blueRadius+mudr2) {
    return true;
  }
  return false;
}

// CIRCLE/CIRCLE
boolean circleCircle8(float blueCx, float blueCy, float blueRadius, float mudX3, float mudY3, float mudr3) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance
  float distXc8 = blueCx - mudX3;
  float distYc8 = blueCy - mudY3;
  float distancec8 = sqrt( (distXc8*distXc8) + (distYc8*distYc8) );

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distancec8 <= blueRadius+mudr3) {
    return true;
  }
  return false;
}

// CIRCLE/CIRCLE
boolean circleCircle9(float redCx, float redCy, float redRadius, float mudX3, float mudY3, float mudr3) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance
  float distXc9 = redCx - mudX3;
  float distYc9 = redCy - mudY3;
  float distancec9 = sqrt( (distXc9*distXc9) + (distYc9*distYc9) );

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distancec9 <= redRadius+mudr3) {
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

void lawnmower(int x,int y){
  fill(#FAEE08);
rect(-50+x, -25+y, 100, 50);

fill(0);
ellipse(-35+x, -35+y, 40, 20);
ellipse(35+x, -35+y, 40, 20);
ellipse(-35+x, 35+y, 40, 20);
ellipse(35+x, 35+y, 40, 20);

rect(-75+x, -25+y, 25, 10);
rect(-75+x, -25+y, 10, 50);
rect(-75+x, 15+y, 25, 10);
}
