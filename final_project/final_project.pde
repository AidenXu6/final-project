//Aiden
int mode;
final int intro=0;
final int game=1;
final int pause=2;
final int gameover=3;


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sound variavles
Minim minim;
AudioPlayer muds,lawnmowers,gameovers,moving,theme;

//keyboard variables
boolean wkey, skey, akey, dkey, upkey, downkey, rightkey, leftkey;

//character vars
int redX, redY, blueX, blueY;
float redr, bluer;

float cx = redX;      // circle position (set with mouse)
float cy = redY;
float cx1 = blueX;      // circle position (set with mouse)
float cy1 = blueY;
float r =37.5;      // circle radius
float r1 =37.5;

float sx = 1000;    // square position
float sy = 0;
float sw = 500;    // and dimensions
float sh = 250;
float sx2 = 1250;    // square position
float sy2 = 100;
float sw2 = 250;    // and dimensions
float sh2 = 450;
float sx3 = 200;    // square position
float sy3 = 700;
float sw3 = 500;    // and dimensions
float sh3 = 100;
float sx4= 200;    // square position
float sy4 = 950;
float sw4 = 500;    // and dimensions
float sh4 = 125;
int oldRedX = redX;
int oldRedY = redY;
int oldBlueX = blueX;
int oldBlueY = blueY;

float crownX = 900;
float crownY = 500;
float crownRadius = 50;

boolean crownVisible=true;

boolean bluecrown=false;
boolean redcrown=false;

int mowx=0;
int mowy=0;

int redstun=0;
int bluestun=0;

int redscore=0;
int bluescore=0;

float redRadius=47.5;
float blueRadius=47.5;

int mudslowblue=0;
int mudslowred=0;

float mudX=1300;
float mudY=850;
float mudr=75;

float mudX2=1375;
float mudY2=850;
float mudr2=62.5;

float mudX3=850;
float mudY3=200;
float mudr3=50;

int mowerDir = 0;      
int mowerTimer = 0;
float mowerAngle = 0;
float moww=100;
float mowh=50;


void setup() {
  size(1800, 1000, P2D);
  


  background(255);
  mode=intro;

  redX=0;
  redY=0;

  redr=0;
  bluer=0;
  
    //minim
  minim=new Minim(this);
  theme=minim.loadFile("theme.mp3");
  muds=minim.loadFile("muds.wav");
   lawnmowers=minim.loadFile("lawnmowers.mp3");
   gameovers=minim.loadFile("gameovers.wav");
   moving=minim.loadFile("moving.mp3");
    theme.loop();
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

void map() {
  background(#04CB2A);

  noStroke();
  fill(#DE8C10);
  rect(1000, 0, 500, 200);
  rect(1250, 200, 250, 300);

  stroke(1);
  line(1000, 0, 1100, 100);
  line(1000, 200, 1100, 100);
  line(1100, 100, 1375, 100);
  line(1500, 0, 1250, 200);

  line(1250, 500, 1375, 425);
  line(1500, 500, 1375, 425);
  line(1375, 425, 1375, 100);

  noStroke();
  fill(#ECF511);
  rect(1025, 200, 225, 75);

  fill(#ECF511);
  noStroke();
  rect(1275, 500, 200, 75);

  noStroke();
  fill(#A2C9C7);
  rect(1075, 215, 25, 25);
  rect(1150, 215, 25, 25);
  rect(1365, 525, 25, 25);

  noStroke();
  fill(#029D00);
  rect(1025, 275, 225, 25);
  rect(1275, 575, 200, 25);



  //poool
  stroke(1);
  fill(#539FFA);
  strokeWeight(5);
  stroke(0);
  rect(200, 700, 500, 300, 10);

  fill(#2187FF);
  noStroke();
  rect(203, 703, 496, 50, 2);



  //floaties in pool
  strokeWeight(2);
  stroke(0);
  fill(#77FA21);
  rect(225, 825, 125, 75, 10);

  rect(375, 830, 125, 75, 10);

  rect(525, 820, 125, 75, 10);
  
  //mud
noStroke();
fill(#6A5203);
ellipse(1300,850,150,150);
ellipse(1375,850,125,125);

ellipse(850,200,100,100);

//lawn thing
fill(#137C04);
rect(100,75,500,500,20);
}
