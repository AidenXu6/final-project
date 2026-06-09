void intro(){
  background(#1D7C01);
  fill(255);
  strokeWeight(5);
  tactilerect(800,350,200,100);
  rect(800,350,200,100);
   fill(0);
  textSize(90);
  text("Start",810,425);


  textSize(100);
  text("King of the Yard",585,300);
  
}

void introClicks(){ 
  if (mouseX>800&&mouseX<1000&&mouseY>350&&mouseY<450){
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
