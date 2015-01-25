//C13446122 8-bit asteroid game
//here another update on the project



//here is where to add music



Catcher catcher; //  catcher object for the spaceship of the game
Catcher catcher3;//  catcher object  for the cannons
Catcher catcher4;// catcher object for the planet
Timer timer;        // timer object for the asteroids which add the asteroids


Asteroid[] squares;   //this is for the asteroid that gets rid of a life
Asteroid[] squares2;  //this is for the asteroid that gets
Asteroid[] squares3;  //this is for the asteroid that gets
Asteroid[] squares4;  //this is for the asteroid that gets
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
PImage img, img2,img3,img4,img5,img6,img7,img8,img9,img10,img11,img12,img13,img14,img15,img16,img17,img18,img19,img20,img21,img22; //this is where we declare
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

void setup() {
  
  
  size(800,600);// it is 600 width size * 600 height size of the screen


img =loadImage("earth1.png"); img2 =loadImage("earth2.png"); img6=loadImage("Space2.jpg"); img7=loadImage("start4.png"); img8=loadImage("arrows.png");img10=loadImage("main.png"); img12=loadImage("tower.png");img13=loadImage("Space2.jpg"); img14=loadImage("bullet.png"); img15=loadImage("gameover2.png");
img16=loadImage("s.png"); img17=loadImage("asteroid5.png");  img18 =loadImage("asteroid6.png");img9 =loadImage("earth3.png");img19= loadImage("earth4.png");img20= loadImage("earth5.png");img21= loadImage("earth6.png");img22= loadImage("earth7.png");


catcher = new Catcher(50); // diameter of 50 for the spaceship
catcher3 = new Catcher(50);// diameter of 50 for the cannons
catcher4= new Catcher(100);// diameter og 100 for the earth


squares = new Asteroid[100]; // there will be an array of 100 asteroid that take away lives
squares2 = new Asteroid[100];// there will be an array of 100 asteroid that take away lives
squares3 = new Asteroid[100];// there will be an array of 100 asteroid that take away lives
squares4 = new Asteroid[100];// there will be an array of 100 asteroid that take away lives

sun= new Sun(500,200,50,5);//this is the sun location

//this is the opening of the a text file
 String[] stuff = loadStrings("okay.txt");
   data = int(split(stuff[0], ',' ));


  timer = new Timer(500);   // this is a timer we will use to declare a new array after the the given time 
  timer.start();      // This starts the timer


lives=30; stage=1;  score=0; 
  
  title=createFont("font",500,true);
  
  bx = 100; by = 220;  bx2 = 620; by2 = 370;  bx3 = 500; by3 = 20; bx4 = 100; by4 = 370;  h=200;  w=100;
}


void draw() {
   
  // this is the screen that will display if the stage =1
  if (stage==1){
    image(img6,0,0); // we use this image in our splash screen
    textAlign(CENTER,BOTTOM);// this is where the text is aligned
    textSize(44);// the size of the text
    text("8-bit Asteroids",390,80);
    textSize(32);// the size of text
    text("SAVE THE CITY",390,130);
    text("Normal",250,260);
    text("Mode",250, 300);
     text("Rules", 550, 405);    
    image(img7,bx, by, boxSize, boxSize);// this is where we use images to make the buttons look nicer
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
      catcher.setLocation(280,500);   catcher3.setLocation2(750,20);   catcher4.setLocation(300,300);
          overBox = false;    }
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
   //   au_player3.play() ;
     tint(255,255,255);// this change the rate of the colours strength in the image
     background(0);
    image(img6,0,0);// this is the image that will be used in the main game
   noSmooth(); stroke(255); fill(255);  // these change the colours and sharpness in the game
  text("Lives:",50,50);
  text(lives, 50, 80);
 
 
 
// image(img12,440,565,40,40);// this declare the cannons at the bottom of the screen
 //image(img12,140,565,40,40);// this declare the cannons at the bottom of the screen
 
 
 
 
 
 
 text("Score:",550,50);
 text(score, 550, 80);
 text("Power",750, 50);
 text("Level:",750,80);
 text(power, 750, 110);// this is the variable for the power level
  // textSize(24);
   text("Press'p'",400,50);
  text("to shoot", 400, 80);  
  text("Fuel left",200,50);
   text(timer2, 200,80);
  fill(fill,fill2,0);
  rect(160,80,widdth,20);

  
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
  
  
  
    // Set catcher location  Display the catcher
  catcher.display();// display the ship
  catcher.move();//control the ship movementd
  sun.move();//control ths sun movements
  sun.display();//display the sun
  catcher4.display4(0);//display the sun
  catcher3.display2();
  
  
  //using the cannons
   if(score>=10 && score<=15 || score>=25 && score<=30)
  {
  catcher3.mousePressed();
  catcher3.display2();
  }
  
    // Check the timer
  if (timer.isFinished()) {
    // Deals with the falling Aliens rate at they appear
    // Initialize one Alien after the totalsquares is greater than the squares lenght which then restarts the totalsquares
    squares[totalSquares] = new Asteroid();
    squares2[totalSquares] = new Asteroid();
     squares3[totalSquares] = new Asteroid();
     squares4[totalSquares] = new Asteroid();
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
  }
  
  
  
   if(lives>30)
  {
    lives=30;
  }
  
  
    for (int i = 0; i < totalSquares; i++ ) {
    squares[i].update(3); //this declare the initial speed of the aliens/squares
   // this displays the alien
      if (frameCount %100 ==0) {
          squares[i].display7();
      }
      else
      {
      squares[i].display();
      }
    //this is the spaceship interaction with the asteroid
    if (catcher.intersect(squares[i])) {
      squares[i].caught();  
      lives--; }  
      //this is the spaceship bullet interaction with the asteroid
    if (catcher.intersect5(squares[i])) {
      squares[i].caught();       }
      //this is the earth interaction with the asteroids 
         if (catcher4.intersect9(squares[i])) {
      squares[i].caught();  
       catcher.caught2(); 
      lives--;
      catcher4.display4(1); //here is where you change the image of the earth when hit
             }         
             
   //these are the cannon interactions           
    if(score>=10 && score<=15 || score>=25 && score<=30){   
    if (catcher3.intersect3(squares[i])) {
      squares[i].caught();  }
    if (catcher3.intersect4(squares[i])) {
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
  { catcher.move2(); }
  
  
  
  //------------------------------------------------//
   // Move and display all red asteroids
   for (int i = 0; i < totalSquares; i+=4 ) {
    squares2[i].update(3);//this declare the initial speed of the asteroid/squares
      squares2[i].display2();// this causes the red asteroid/square to move
    if (catcher.intersect(squares2[i])) {
      squares2[i].caught(); // if the catcher interact with the red asteroid, it causes you to gain a point
      score++;  }
      if (catcher.intersect5(squares2[i])) {
      squares2[i].caught();  // if the catcher interact with the asteroid , it moves the alien and causes you to lose alife
      score++;}
      
        //if you get this score it causes the canon to goes off and get a point  
     if(score>=10 && score<=15 || score>=25 && score<=30){
     
    if (catcher3.intersect3(squares2[i])) {
      squares2[i].caught();
      score++;}
    if (catcher3.intersect4(squares2[i])) {
      squares2[i].caught();
      score++;} 
   
    } 
  } 
  
  
  //-------------------------------------------------//
    // Move and display all blue asteroid
  for (int i = 0; i < totalSquares; i+=14 ) {
     squares3[i].update(3);// this is the initial speed of the blue asteroids
    squares3[i].display3();// this displays the blue asteroids/squares and make them move
    if (catcher.intersect(squares3[i])) {
      squares3[i].caught();
      lives++; }
      if (catcher.intersect5(squares3[i])) {
      squares3[i].caught();  // if the catcher interact with the asteroid 
       lives++;  }
       
                //if you get this score it causes the canon to goes off and get a point  
     if(score>=10 && score<=15 || score>=25 && score<=30){
     
    if (catcher3.intersect3(squares3[i])) {
      squares3[i].caught();
      lives++;}
    if (catcher3.intersect4(squares3[i])) {
      squares3[i].caught();
      lives++;}    }      
  } 
   
   
   
  //----------------------------------------------------------//
       // Move and display all green asteroids
    for (int i = 0; i < totalSquares; i+=18 ) {
         squares4[i].update(2);//this sets the green aliens speed
    squares4[i].display4();// this displays them and tell them where to go
    if (catcher.intersect2(squares4[i])) {
      squares4[i].caught();// if the catcher interacts with the blue alien it puts up the power 
      power++;   }
    if (catcher.intersect6(squares4[i])) {
      squares4[i].caught();  // if the catcher interact with the alien , it moves the alien and causes you to lose alife
      power++;       }
      
      
        //if you get this score it causes the canon to goes off and get a point  
     if(score>=10 && score<=15 || score>=25 && score<=30){
     
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
    text("Rule1", w+200,h-50);
    text("Rule2",w+255,h-20);
    text("Rule3", w+200,h+50);
    text("Rule4",w+200,h+150);
    text("Rule5",w+200,h+250);
    text("Rule6",w+260,h+350);
    text("Rule7",w+260,h+380);
        
  //  rect(w,h-80,50,50);
   // rect(w,h,50,50);
    //rect(w,h+100,50,50);
   // rect(w,h+200,50,50);
   // rect(w-25,h+280,100,100);
    image(img10,bx3,by3,boxSize,boxSize);
   // rect(w-80,h+320,50,50);
    
 // if this button is pressed it will bring you back to the main screen
    if (mousePressed== mouseX > bx3-boxSize && mouseX < bx3+boxSize && 
      mouseY > by3-boxSize && mouseY < by3+boxSize)
   {  stage=1; }
 }
   
   
    //if you get this score it will display the winning mode
 if (score==40)
 {
   
   image(img13,0,0);
   textSize(65);
   fill(235,0,0);
   text("Congratulations!",300,100);
   textSize(42);
   text("You Saved The Universe",300,200);
   textSize(28);
      text("final Power",120,520);//this displays the final score in the game
    text(power, 120,560);
    text("final score",300,520);//this displays the final score in the game
    text(score, 300,560);
    text("final Lives",490,520);//this displays the amount of final lives in the game
    text(lives, 480,560);
   image(img2,260,300,80,80);
   noLoop();
 }
 
 // this will bring you to the game over screen when you have 0 lives
if (lives==0)
{
   
    textSize(40);
    fill(255);
    text("You failed",20,20);
  //  image(img15, 220,-30,img15.height/1.9,img15.width/1.8);
    text("Click To Restart", 290,330);
    text("final Score",290,380);
    text(score, 290,440);
    if(score<=20){
      text("Better luck ", 300,500);//this displays a different message depending on what score you get
       text("Next Time", 300,560);
    }
     if(score>20){
      text("You Have ",300,500);
     text("The Power!", 300,560);
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
   
      //Reset all variables to initial conditions
    textSize(28);
    lives=30;
    score=0;
    power=0;
     catcher.setLocation(280,500);
     
    lost=false;
    loop();     
        //Begin looping draw function again
  }



}

void keyPressed()
{
  if(key=='p')
  {
   // squares[i].update(0);
  // timer.start();
    setup();
     totalSquares = 0; 
     timer2=2000;
     fill(255);
  }
}
