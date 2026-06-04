void game() {
  map();
  
    // Red player
  if (wkey==true){
  redY = redY-5;
  redr=3*PI/2;
}

  if (skey==true){
  redY =redY+5;
   redr=PI/2;
  }
  
  if (akey==true){
  redX= redX-5;
  redr=PI;
}

  if (dkey==true){
  redX = redX+5;
  redr=0;
  }
 
  
  // Blue player 
  if (upkey==true){
  blueY = blueY-5;
  bluer=3*PI/2;
  }
  
  if (downkey==true){
  blueY = blueY+5;
   bluer=PI/2;
}

  if (leftkey==true){
  blueX= blueX-5;
  bluer=PI;
  }
  
  if (rightkey==true){
  blueX = blueX+5;
  bluer=0;
  }
  
redX=constrain(redX,-700,1100);
redY=constrain(redY,-500,500);

blueX=constrain(blueX,-1100,700);
blueY=constrain(blueY,-500,500);

  float testX = redX;
  float testY = redY;
  
  // which edge is closest?
  if (redX < 1000){
    testX = 1000; 
    redX=1000;
    dkey=false; 
  }// test left edge
  else if (redX > 1500) testX =1500;   // right edge
  if (redY <0)         testY =0;      // top edge
  else if (redY > 250) testY =250;   // bottom edge

  // get distance from closest edges
  float distX = redX-testX;
  float distY = redY-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );


pushMatrix();
translate(redX+700,redY+500);
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

void redcharacter(int x,int y) {
  fill(#FADD7C);
  ellipse(-5+x,-40+y,50,10);
  ellipse(-5+x,40+y,50,10);

  fill(#FF0000);
  ellipse(-33+x,-15+y,25,25);
  ellipse(-33+x,15+y,25,25);

  ellipse(0+x,0+y,75,75);

  fill(0);
  ellipse(15+x,0+y,65,65);
}

void bluecharacter(int x,int y){
  fill(#FADD7C);
  ellipse(-5+x,-40+y,50,10);
  ellipse(-5+x,40+y,50,10);

  fill(#0700FF);
  ellipse(-33+x,-15+y,25,25);
  ellipse(-33+x,15+y,25,25);

  ellipse(0+x,0+y,75,75);

  fill(0);
  ellipse(15+x,0+y,65,65);
}
