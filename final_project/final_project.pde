//Aiden
int mode;
final int intro=0;
final int game=1;
final int pause=2;
final int gameover=3;

//keyboard variables
boolean wkey, skey,akey,dkey, upkey, downkey,rightkey,leftkey;

//character vars
int redX,redY,blueX,blueY;
float redr,bluer;

void setup() {
  size(1800, 1000,P2D);
  
  background(255);
  mode=game;
  
  redX=0;
  redY=0;
  
  redr=0;
  bluer=0;

}

void draw() {
  if (mode==intro) {
    intro();
  } else if (mode==game) {
    game();
  } else if (mode==pause) {
    pause();
  } else if (mode==gameover) {
    gameover();
  } else {
    println("Error:Mode="+mode);
  }
}
