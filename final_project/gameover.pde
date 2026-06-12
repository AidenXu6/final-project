void gameover(){
background (255);
if (redscore==1800){
fill(#FF0000);
  textSize(250);
        text("Red Wins!",400,300);
        
                textSize(100);
        text("Red Score:"+redscore/60,150,700);
        
        text ("Blue Score:"+bluescore/60,1100,700);
}

if (bluescore==1800){
fill(#FF0000);
  textSize(250);
        text("Blue Wins!",400,300);
        
                textSize(100);
        text("Red Score:"+redscore/60,150,700);
        
        text ("Blue Score:"+bluescore/60,1100,700);
}

}

void gameoverClicks(){
  mode=intro;
}
