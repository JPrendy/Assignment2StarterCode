class Asteroid {
  float x,x4,y,y2,x3,y3;   // Variables for the aliens
//  float  y4=100;
   
  color c;     // color of the alien
 float speed; //speed of the aliens
 float x7=random(50,550);
float y7=random(20,880); 


  Asteroid() {
                 
    x = random(0,750);     // Start with a random x location
    x4 = random(0,750);
    y = -20;
    y2= 640;
    x3= -20;
    y3=random(0,550);
    // Start a little above the window
   
     // Color
  }

//this is an animation for the star
void display17()
{
  image(img34,x7,y7,20,20);
} 
//this is an animation for the star
void display18()
{
  image(img35,x7,y7,20,20);
} 

//this what happens when they interact
  void update(float tempx){
    speed=tempx;
  
    // Increment the speed of the aliens
    y += speed; 
    x -=speed;
    x4+=speed;
    y2 -=speed;
    x3 +=speed;
    
    if (x<0)
    {
      x=+780;
    }
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (y > height) { 
      return true; //if turns true it returns a height offscreen
      
    } else {
      return false;
    }
  }
  
   boolean reachedBottom2() {
     // If we go a little beyond the bottom
    if (y2 > height) { 
      return true;//if turns true it returns a height offscreen
    } else {
      return false;
    }
  }
    boolean reachedBottom3() {
      // If we go a little beyond the bottom
    if (x3 > width) { 
      return true;//if turns true it returns a height offscreen
    } else {
      return false;
    }
  }

  // Display the grey asteroids
  void display() {
    fill(255);
    noStroke();
    for (int i = 2; i < 8; i++ ) {
      image(img24,x,y ,50,50);
    }
  }
  //displays an animation for the grey asteroid
    void display7() {
    fill(255,0,0);
    noStroke();
    for (int i = 2; i < 8; i++ ) {
      image(img18,x,y ,50,50);
    }
  }

  void display2() {
    // Display the red asteroids
    fill(255,0,0);
    stroke(255);
    for (int i = 2; i < 8; i++ ) {
      
    image(img25,x,y2,40,40);

    }
  }
  
  
   void display8() {
    // Display the red asteroids
    fill(255,0,0);
    stroke(255);
    for (int i = 2; i < 8; i++ ) {
      
    image(img26,x,y2,40,40);

    }
  }
  
    void display3() {
    // Display the blue asteroids
    fill(0,0,255);
    noStroke();
    for (int i = 2; i < 4; i++ ) {
      image(img28,x4,y ,40,40);
    }
  }
  
    void display9() {
    // Display the blue asteroids
    fill(0,0,255);
    noStroke();
    for (int i = 2; i < 4; i++ ) {
      image(img29,x4,y ,40,40);
    }
  }
  
     void display4() {
    // Display the green asteroids
    fill(0,255,0);
    noStroke();
    for (int i = 2; i < 4; i++ ) {
      image(img30,x3,y3 ,40,40);
    }
     }  
    
       void display10() {
    // Display the green asteroids
    fill(0,255,0);
    noStroke();
    for (int i = 2; i < 4; i++ ) {
      image(img31,x3,y3 ,40,40);
    }
   
  }
  // If the alien is caught
  void caught() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
   
   y = - 200000000;//  might change to x
    y2= -200600000; 
    x3= -300000000;
    x7= -2000000000;
// alien.remove()  ; 
        
}



}
