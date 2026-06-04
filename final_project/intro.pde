void intro(){
  background(#1D7C01);
  fill(255);
  strokeWeight(5);
  tactilerect(275,350,200,100);
  rect(275,350,200,100);
  tactilerect(275,500,200,100);
  rect(275,500,200,100);
   fill(0);
  textSize(90);
  text("Start",285,425);
  textSize(57);
  text("Options",280,570);
  textSize(100);
  text("King of the Yard",100,300);
  
}

void introClicks(){
  mode=game;

}

void tactilerect(int x, int y, int w, int h) {
  if (mouseX>x&&mouseX<x+w&&mouseY>y&&mouseY<y+h) {
    stroke(#FF001E);
  } else {
    stroke (0);
  }
}
