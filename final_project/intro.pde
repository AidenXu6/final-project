void intro(){
   
  map();
  fill(255);
  strokeWeight(5);
  tactilerect(800,450,200,100);
  rect(800,450,200,100);
   fill(0);
  textSize(90);
  text("Start",810,525);


  textSize(100);
  text("King of the Yard",585,400);
  
}

void introClicks(){ 
  if (mouseX>800&&mouseX<1000&&mouseY>450&&mouseY<550){
 mode=game;
 }

bluescore=0;
redscore=0;
redcrown=false;
bluecrown=false;
crownVisible=true;
blueX=blueY=redX=redY=0;

}

void tactilerect(int x, int y, int w, int h) {
  if (mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+h) {
    stroke(#FF001E);
  } else {
    stroke (0);
  }
}
