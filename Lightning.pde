//Zap a Mole
//Created by Stephen Biachi
//Special thanks to Chris Bianchi

//Lighning Start
int startx=0;
int starty=200;
//Size
int mysize = 400;

//colors
int mystroke1 =(int) (Math.random()*255);
int mystroke2 =(int) (Math.random()*255);
int mystroke3 =(int) (Math.random()*255);
//mole
int molex=200;
int moley=50;
int moler=20;
boolean hitmole = false;

void setup(){
  size(400,400);
  mysize = 400;
  background(0,0,0);
}
void draw(){
  if (!hitmole) {
  //mole
  fill(150,100,5);
  stroke(150,100,5);
  ellipse(molex,moley,moler,moler);
  }
  
  //lightning and Hitmole
  while(startx<400 && !hitmole){
  int endx= startx+(int) (Math.random()*9);
  int rny=(int)(Math.random()*19)-9;
 //Hitmole X Axis
  int endy=starty+rny;
  if (molex >= startx && molex <= endx) {
   int lineyatmole;
   if (endx == startx) {
     lineyatmole = starty;
   } else {
     //HitMole 
     // try to solve
     // y = m * x + b where y = lineyatmole
     int x = molex-startx;
     int b = starty;
     float m = (endy-starty)/(endx-startx);
     lineyatmole = (int)m*x+b; 
   }
   if(Math.abs(lineyatmole - moley) <= moler/2) {
     hitmole = true;
    //Dead Mole
    fill(255,0,0);
    stroke(255,0,0);
    ellipse(molex,moley,moler+1,moler+1);

   }
  }
//Color and Reset
  stroke(mystroke1,mystroke2,mystroke3);
  line(startx,starty,endx,endy);
  startx=endx;
  starty=endy;
  }
  
  
}
void mousePressed(){ 
  //New all
  startx=0;
  starty=200;
  mystroke1 =(int) (Math.random()*255); 
  mystroke2 =(int) (Math.random()*255);
  mystroke3 =(int) (Math.random()*255);
    //mole
  molex=(int) (Math.random()*(mysize-moler*2))+moler;
  moley=(int) (Math.random()*(mysize-moler*2))+moler;
  background(0,0,0);
  
}
