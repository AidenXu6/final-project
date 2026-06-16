void pause(){
  muds.pause();
  gameovers.pause();
  theme.pause();
  moving.pause();
  lawnmowers.pause();
  fill(#FA0000);
   textSize(150);
      text("PAUSED",650,500);
}

void pauseClicks(){
  mode=game;
  theme.loop();
}
