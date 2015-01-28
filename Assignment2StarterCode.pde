//C13446122 8-bit asteroid game
//here another update on the project

//------PREMISE-----//
//it's a space shooter where you to have to
//defend the earth from the asteroids as long as possible
//the longer you last the better score you get

//------------GAME MECHANICS--------------//
//you play the game with w,a,s,d controls and use the space button to shoot
//the grey asteroid causes you to lose a life
//the red asteroid gives you a point
//the blue asteroid gives you a life
//the green asteroid gives you energy to form a blackhole when it's at 3, the blackholes help with the other asteroids
//the yellow star gives fuel to the spaceship
//the sun gives fuel to the spaceship
//if  the spaceship loses all its fuel the controls are reversed



import ddf.minim.* ;  ///this is where I declare variables for sound in the game
Minim minim;
Minim minim2;
AudioPlayer au_player1;
AudioPlayer au_player2;
AudioPlayer au_player3;
AudioPlayer au_player4;
Catcher catcher; //  catcher object for the spaceship of the game
Catcher catcher3;//  catcher object  for the cannons
Catcher catcher4;// catcher object for the planet
Timer timer;        // timer object for the asteroids which add the asteroids


Asteroid[] squares;   //this is for the asteroid that gets rid of a life
Asteroid[] squares2;  //this is for the asteroid that gets
Asteroid[] squares3;  //this is for the asteroid that gets
Asteroid[] squares4;  //this is for the asteroid that gets
Asteroid[] squares5;  //this is for the asteroid that gets
Asteroid asteroid;// this is where we declare all the alien squares that are falling
Sun sun;


int totalSquares = 0; 
int lives;
float stage;
float bx, by, bx2, by2, bx3, by3, bx4,by4; //this is the variables for the menu boxes
float w, h;
int power;
boolean lost=false;  // this boolean asks if you lost
int boxSize = 75;
PFont title;
PImage img, img2,img3,img4,img5,img6,img7,img8,img9,img10,img11,img12,img13,img14,img15,img16,img17,img18,img19,img20,img21,img22,img23,img24,img25,img26,img27,img28,img29,img30,img31,img32,img33,img34,img35; //this is where we declare
int score;
boolean overBox = false;
boolean locked = false;// makes sure the box is locked when starting
float xOffset = 0.0; // this sets the offset of the mouse
float yOffset = 0.0; // this sets the offset of the mouse
float gameover=0;
color c=255;
int timer2=2000; //timer for the fuel
float i;
int[] data;
float fill=0;
float fill2=255;
float widdth=100;
float widddth=0;
  boolean devMode = false;
boolean sketchFullScreen() {
  return ! devMode;
}


void setup() {


  if (devMode)
  {
    size(800, 600);
  }
  else
  {
    size(displayWidth, displayHeight);
  }
  
  size(900,600);// it is 600 width size * 600 height size of the screen

   minim = new Minim(this) ;// this is where the sound files are loaded


au_player1 = minim.loadFile(  "sc.wav")  ;
au_player2 = minim.loadFile(  "Laser_Shoot4.wav")  ;
au_player3 = minim.loadFile(  "sound1.wav")  ;
au_player4 = minim.loadFile("spacemusic.mp3")  ;

img =loadImage("earth1.png"); img2 =loadImage("earth2.png"); img6=loadImage("Space2.jpg"); img7=loadImage("start4.png"); img10=loadImage("main.png"); img13=loadImage("Space2.jpg"); img14=loadImage("bullet.png"); 
img16=loadImage("s.png"); img17=loadImage("asteroid5.png");  img18 =loadImage("meteor3.png");img9 =loadImage("earth3.png");img19= loadImage("earth4.png");img20= loadImage("earth5.png");img21= loadImage("earth6.png");img22= loadImage("earth7.png"); img23= loadImage("earth8.png");
img24=loadImage("meteor.png");img25=loadImage("meteor4.png");img26=loadImage("meteor5.png");img27=loadImage("blackholef.png");img28=loadImage("meteorb.png"); img29=loadImage("meteorb2.png");
img30=loadImage("meteorgs.png");img31=loadImage("meteorgs3.png");img32=loadImage("earthdeath.png");img33=loadImage("bullet2.png");img34=loadImage("starf2.png");   img35=loadImage("starf3.png"); 

catcher = new Catcher(50); // diameter of 50 for the spaceship
catcher3 = new Catcher(50);// diameter of 50 for the cannons
catcher4= new Catcher(90);// diameter og 100 for the earth


squares = new Asteroid[1000]; // there will be an array of 100 asteroid that take away lives
squares2 = new Asteroid[1000];// there will be an array of 100 asteroid that take away lives
squares3 = new Asteroid[1000];// there will be an array of 100 asteroid that take away lives
squares4 = new Asteroid[1000];// there will be an array of 100 asteroid that take away lives
squares5 = new Asteroid[1000];// there will be an array of 100 asteroid that take away lives



sun= new Sun(700,200,50,5);//this is the sun location

//this is the opening of the a text file
 String[] stuff = loadStrings("okay.txt");
   data = int(split(stuff[0], ',' ));


  timer = new Timer(500);   // this is a timer we will use to declare a new array after the the given time 
  timer.start();      // This starts the timer


lives=10; stage=1;  score=0; 
  
  title=createFont("font",500,true);
  
   bx = 100; by = 220;  bx2 = 580; by2 = 370;  bx3 = 500; by3 = 20; bx4 = 100; by4 = 370;  h=200;  w=100;
  
}


void draw() {
   
  // this is the screen that will display if the stage =1
  if (stage==1){
    image(img6,0,0); // we use this image in our splash screen
    textAlign(CENTER,BOTTOM);// this is where the text is aligned
    textSize(52);// the size of the text
    text("8-BIT ASTEROIDS",450,80);
    textSize(32);// the size of text
    text("SAVE THE EARTH",450,130);
    text("Normal",250,260);
    text("Mode",250, 300);
      text("Difficult",250,390);
    text("Mode",250,430);
    
     text("How To Play", 600, 345);    
    image(img7,bx, by, boxSize, boxSize);// this is where we use images to make the buttons look nicer
    image(img7,bx2,by2,boxSize, boxSize);
     image(img7,bx4,by4,boxSize, boxSize);// this is where we use images to make the buttons look nicer
    
    
    //this displays the ints from the files
         for (int i = 0; i < data.length; i ++ ) {
    // The array of ints is used to set the color and height of each rectangle.
     
    rect(i*40,500,20,data[i],c);
  }
    
      //stage 2    normal mode
    // this is where we use the mousefunction to declare what stage we want to go to
    if (mousePressed== mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize)
      {  overBox = true;  //this is used to make sure the mouse clicks into the stage you selected
    if(!locked) {  
      stroke(255);  } 
   else {
    stroke(153);
      stage=2;// with this button pressed it declares to go stage two
       au_player1.play() ;
      catcher.setLocation(280,500);   catcher3.setLocation2(750,20);   catcher4.setLocation(300,300);
          overBox = false;    }
      }
      
      
          //stage 2++  hard mode
     //this is where the other button is placed and if the mouse presses it goes to that stage
     if (mousePressed== mouseX > bx4-boxSize && mouseX < bx4+boxSize && 
      mouseY > by4-boxSize && mouseY < by4+boxSize)
         { overBox = true;  
    if(!locked) { 
      stroke(255);  } 
   else {
    stroke(153);
      stage=2;
      au_player1.play() ;
      catcher.setLocation(280,500);   catcher3.setLocation2(750,20);   catcher4.setLocation(300,300); 
     
        widdth=50;
        timer2=1000;
        lives=5; //this will be used to add the additional mechanics that aren't in normal mode (stage 2) 
        overBox = false; }
         } 
      
      
      
         //stage3   the rules of the game
      //with this button pressed,it will bring you to the rules of the game
     if (mousePressed== mouseX > bx2-boxSize && mouseX < bx2+boxSize && 
      mouseY > by2-boxSize && mouseY < by2+boxSize)
   {   overBox = true;  
    if(!locked) { 
      stroke(255);  } 
   else {
    stroke(153);
  
      stage=3;//this brings you to stage 3
        overBox = false;}   }
}
      
   
      
      
      // if stage 2 was selected it brings you here
   if (stage==2){
    au_player4.play() ;
     tint(255,255,255);// this change the rate of the colours strength in the image
     background(0);
    image(img6,0,0);// this is the image that will be used in the main game
   noSmooth(); stroke(255); fill(255);  // these change the colours and sharpness in the game
  text("Lives:",150,50);
  text(lives, 150, 80);

 text("Score:",750,50);
 text(score, 750, 80);
 text("Energy",850, 50);
 
 //text("Level:",750,80);
if(widddth<=20)
 {
   widddth++;
 }
     fill(255,0,125);
    ellipse(850,80,20+widddth,20+widddth);
  fill(255);
 text(power, 850, 90);// this is the variable for the power level
  // textSize(24);
  

 fill(255);
  text("Fuel left",50,50);
   text(timer2, 50,80);
  fill(fill,fill2,0);
  rect(10,80,widdth,20);

  
  if (timer2>i)
  {
   timer2-=2 ;
   fill+=0.5;
   fill2-=0.5;
   widdth-=0.1;
   if(widdth==0)
   {
     widdth+=0;
   }
  }
  
  textSize(20);
    fill(255,0,0);
     text("Press 'space'",100,550);
  text("key to shoot", 100, 580); 
   text("Press'p' key",800,550);
  text("to pause", 800, 580); 
 
    // Set catcher location  Display the catcher
  catcher.display();// display the ship
  catcher.move();//control the ship movementd
  sun.move();//control ths sun movements
  sun.display();//display the sun
  catcher4.display4(0);//display the sun
 
  
  
  //using the cannons
   if(power>=3 && power<=5 || power>=6 && power<=8)
  {
  catcher3.mousePressed();
  catcher3.display2();
  text("You had enough energy to", 450,50);
  text("help make blackholes to help you",450,80);
  }
  
  
 
      
      
      
    // Check the timer
  if (timer.isFinished()) {
    // Deals with the falling Aliens rate at they appear
    // Initialize one Alien after the totalsquares is greater than the squares lenght which then restarts the totalsquares
    squares[totalSquares] = new Asteroid();
    squares2[totalSquares] = new Asteroid();
     squares3[totalSquares] = new Asteroid();
     squares4[totalSquares] = new Asteroid();
     squares5[totalSquares] = new Asteroid();
    // Increment totalsquares
    totalSquares ++ ;
    // If we hit the end of the array
    if (totalSquares >= squares.length) {
      totalSquares = 0; // Start over
    }
    timer.start(); //starts the timer
     if (totalSquares >= squares2.length) {
      totalSquares = 0; // Start over  
    }
    timer.start(); //starts the timer
      if (totalSquares >= squares3.length) {
      totalSquares = 0; // Start over
    }
    timer.start();
      if (totalSquares >= squares4.length) {
      totalSquares = 0; // Start over
    }
     timer.start();
      if (totalSquares >= squares5.length) {
      totalSquares = 0; // Start over
    }
    timer.start();
  }
  
  
  
   if(lives>10)
  {
    lives=10;
  }
 
 
 
 //-----------------------this is for the star----------------------------------------------------------///
      for (int i = 0; i < totalSquares; i+=18 ) {

        if (frameCount %100 >=0 && frameCount %100 <=40) {
       
          squares5[i].display17();
        
      }
      else
      {
      squares5[i].display18();
      }
       
  
        
   if (catcher.intersect19(squares5[i])) {
      squares5[i].caught();  
      timer2+=300;
         fill-=74.0;
   fill2+=74.0;
   widdth+=14.8;
  }  
      //this is the spaceship bullet interaction with the asteroid
    if (catcher.intersect20(squares5[i])) {
      squares5[i].caught();       
     timer2+=300;
            fill-=74.0;
   fill2+=74.0;
   widdth+=14.8;
      }
      }

  
  //---------------------------------------these are the grey asteroids-----------//
    for (int i = 0; i < totalSquares; i+=2 ) {
    squares[i].update(3); //this declare the initial speed of the aliens/squares
   // this displays the alien
   if(frameCount %20000 ==0)
   {
     squares[i].update(1);
   }
   
      if (frameCount %100 >=0 && frameCount %100 <=40) {
       
          squares[i].display7();
        
      }
      else
      {
      squares[i].display();
      }
    //this is the spaceship interaction with the asteroid
    if (catcher.intersect(squares[i])) {
      squares[i].caught();  
      lives--; 
    totalSquares--;
  }  
      //this is the spaceship bullet interaction with the asteroid
    if (catcher.intersect16(squares[i])) {
      squares[i].caught();       }
      //this is the earth interaction with the asteroids 
         if (catcher4.intersect9(squares[i])) {
      squares[i].caught();  
      // catcher.caught2(); 
      lives--;
      catcher4.display4(1); //here is where you change the image of the earth when hit
             }         
             
   //these are the cannon interactions           
   if(power>=3 && power<=5 || power>=6 && power<=8){   
    if (catcher3.intersect17(squares[i])) {
      squares[i].caught();  }
    if (catcher3.intersect18(squares[i])) {
      squares[i].caught();  }  }}       
             
 
 //if the spaceship is near the sun it gains fuel             
   if(catcher.intersect10(sun)){
   // sun.caught();
    timer2+=8;
  
   fill-=2.0;
   fill2+=2.0;
   widdth+=0.4;
   if(widdth>=100)
   {
     widdth=100;
   }
    if(timer2>2000)
    { timer2=2000; 
  }  }
  
  //if the fuel hits zero it changes the ship movements
    if(timer2==0)
  { catcher.move2(); 
 text("The controls are now reversed",450,560);
 text("go to the star to recover fuel",450,580);
}
  
  
  
  //------------------------------------------------//
   // Move and display all red asteroids
   for (int i = 0; i < totalSquares; i+=4 ) {
    squares2[i].update(2);//this declare the initial speed of the asteroid/squares
 
   
      if (frameCount %100 >=0 && frameCount %100 <=40) {
       
          squares2[i].display8();
        
      }
      else
      {
      squares2[i].display2();
      }
    
    
     
    if (catcher.intersect12(squares2[i])) {
      squares2[i].caught(); // if the catcher interact with the red asteroid, it causes you to gain a point
      score++;
      }
      if (catcher.intersect13(squares2[i])) {
      squares2[i].caught();  // if the catcher interact with the asteroid , it moves the alien and causes you to lose alife
      score++;}
      if (catcher4.intersect12(squares2[i])) {
      squares2[i].caught();  
      score++;
             } 
      
        //if you get this score it causes the canon to goes off and get a point  
     if(power>=3 && power<=5 || power>=6 && power<=8)
     {
    if (catcher3.intersect14(squares2[i])) {
      squares2[i].caught();
      score++;}
    if (catcher3.intersect15(squares2[i])) {
      squares2[i].caught();
      score++;} 
   
    } 
  } 
  
  
  //-------------------------------------------------//
    // Move and display all blue asteroid
  for (int i = 0; i < totalSquares; i+=3 ) {
     squares3[i].update(2);// this is the initial speed of the blue asteroids
       
   
      if (frameCount %100 >=0 && frameCount %100 <=40) {
       
          squares3[i].display9();
        
      }
      else
      {
      squares3[i].display3();
      }
    
     
     

    if (catcher.intersect(squares3[i])) {
      squares3[i].caught();
       catcher4.display4(-1);
      lives++; }
      if (catcher.intersect5(squares3[i])) {
      squares3[i].caught();  // if the catcher interact with the asteroid
      catcher4.display4(-1); 
       lives++;  }
       if (catcher4.intersect11(squares3[i])) {
      squares3[i].caught();  
       catcher4.display4(-1);
      lives++;
             }         
       
                //if you get this score it causes the canon to goes off and get a point  
     if(power>=3 && power<=5 || power>=6 && power<=8){
     
    if (catcher3.intersect3(squares3[i])) {
      squares3[i].caught();
       catcher4.display4(-1);
      lives++;}
    if (catcher3.intersect4(squares3[i])) {
      squares3[i].caught();
       catcher4.display4(-1);
      lives++;}    }      
  } 
   
   
   
  //----------------------------------------------------------//
       // Move and display all green asteroids
    for (int i = 0; i < totalSquares; i+=18 ) {
 
    
    
        squares4[i].update(2);// this is the initial speed of the blue asteroids
       
   
      if (frameCount %100 >=0 && frameCount %100 <=40) {
       
          squares4[i].display10();
        
      }
      else
      {
      squares4[i].display4();
      }
    
    
    
    
    
    if (catcher.intersect2(squares4[i])) {
      squares4[i].caught();// if the catcher interacts with the blue alien it puts up the power 
      power++;   }
    if (catcher.intersect6(squares4[i])) {
      squares4[i].caught();  // if the catcher interact with the alien , it moves the alien and causes you to lose alife
      power++;       }
      if (catcher4.intersect2(squares4[i])) {
      squares4[i].caught();  // if the catcher interact with the alien , it moves the alien and causes you to lose alife
      power++;       }
      
      
        //if you get this score it causes the canon to goes off and get a point  
    if(power>=3 && power<=5 || power>=6 && power<=8){
     
    if (catcher3.intersect7(squares4[i])) {
      squares4[i].caught();
      power++;}
    if (catcher3.intersect8(squares4[i])) {
      squares4[i].caught();
      power++;}  } 
}
   }
   
   // if stage 3 was selected it brings you here
 if (stage==3){
    image(img6,0,0);// this displays all the text for the rules and controls of the game
    textAlign(CENTER,BOTTOM);
    textSize(32);
    text("How To Play",140,80);
    text("____________",140,95);
    textSize(20);
    text("(1)Colliding with the grey asteroid loses a life", 350, 130);
    image(img24,620,90,50,50);
    text("(2).Colliding with the red asteroid gives a point", 350,190);
        image(img26,620,150,50,50);
    text("(3).Colliding with the blue asteroid gains a life",350,250);
        image(img28,650,220,40,40);
    text("(4).Colliding with the green asteroid gives energy to make blackholes",340,310);
        image(img30,680,270,40,40);
         text("(5).Colliding with a mini star gives you fuel",340,370);
         image(img34,680,340,40,40);
    text("(6)If you run out of fuel, your controls are in reverse",400,430);
    text("You need to go to the sun to get more fuel",400,450);
    text("(7)You control the spaceship using w,a,s,d",400,510);
    text("and shoot using the space key",400,530);
    
    text("You can pause the game by pressing 'p'",400,560);
    text("and restart the game by pressing 'r'",400,580);
        
 
   
  
    
    image(img10,bx3,by3,boxSize,boxSize);
   // rect(w-80,h+320,50,50);
    
 // if this button is pressed it will bring you back to the main screen
    if (mousePressed== mouseX > bx3-boxSize && mouseX < bx3+boxSize && 
      mouseY > by3-boxSize && mouseY < by3+boxSize)
   {  stage=1; }
 }
   
   

 
 // this will bring you to the game over screen when you have 0 lives
if (lives==0)
{
       minim.stop() ;
    textSize(40);
    fill(255);
    text("You failed",20,20);


 
  image(img6,0,0);
    image(img32,650,130,220,220);
     text("Unfortunately the earth was destroyed",450,80);
   
    text("but you got a score of",450,120);
    fill(0,255,0);
    text(score, 450,210);
    fill(255);
    if(score<=20){
      text("Better luck ", 450,300);//this displays a different message depending on what score you get
       text("Next Time", 450,360);
         text("Click to begin where you left off  ", 450,440);
    text("with one more life  ", 450,480);
    fill(255,204,0);
    text("or",450,530);
    fill(255);
       text("Press 'r'  to restart", 450, 580);
    }
     if(score>20){
      text("Nice ",450,300);
     text("score", 450,360);
    text("Click to begin where you left off  ", 450,440);
    text("with one more life  ", 450,480);
    fill(255,204,0);
    text("or",450,530);
    fill(255);
    text("Press 'r'  to restart", 450, 580);
    }
    noLoop();             //Stop looping at the end of the draw function
    lost=true;
    textSize(13);
    gameover++;
}}
   
   
   //this is used to make sure the mouse can't drag and the mouse can go outside the required area it in
void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
    bx2 = mouseX-xOffset; 
    by2 = mouseY-yOffset;
  }
}


void mousePressed()                              //Runs whenever the mouse is pressed
{
 if(overBox) { 
    locked = true;                                //this makes sure it is locked
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 
xOffset = mouseX-bx2; 
  yOffset = mouseY-by2; 


if (lost==true)                                //If we lost the game, reset now and start over 
  {
   au_player2.play(10) ; 
   au_player4.play();
      //Reset all variables to initial conditions
    textSize(28);
    lives=2;
    score=0;
    power=0;
     catcher.setLocation(280,500);
     catcher4.display4(-1);
    lost=false;
    loop();     
        //Begin looping draw function again
  }
}

void keyPressed()
{
  if(key=='r')
  {
     minim.stop() ;
    setup();
  //  draw();

     totalSquares = 0; 
    timer2=2000;
     fill(255);
     widdth=100;
     score=0;
     power=0;
    loop();
  }
   if(key=='p')
  {
       au_player3.play(10) ; 
    noLoop();
       image(img6,0,0);
   
    text("Game is Paused",450,60);
    text("Press 'l' key to resume the game",450,80);
    fill(255);
    text("(1)Colliding with the grey asteroid loses a life", 380, 120);   
    text("(2).Colliding with the red asteroid gives a point", 380,175);
    text("(3).Colliding with the blue asteroid gains a life",380,230);
    text("(4).Colliding with the green asteroid gives ",380,285);
    text("you energy to create black holes",330,315);
    text("(5).Colliding with a mini star gives you fuel",340,370);
    text("(6)If you run out of fuel, your controls are in reverse",350,425);
    text("You need to go to the sun to get more fuel",380,455);
    text("(7)You control the spaceship using w,a,s,d",380,510);
    text("and shoot using the space key",450,540);
    fill(255,0,0);
    textSize(30);
    text("Press 'r' to restart",450,580);
       
    image(img24,620,90,40,40);
    image(img26,620,145,40,40);  
    image(img28,620,200,40,40);
     image(img30,620,255,40,40);
    image(img34,620,340,40,40);
    
    
    
    
    
    
  }
    if(key=='l')
    {
      loop();
    }


}
