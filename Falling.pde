class Asteroid {
  float x,y,y2,x3,y3;   // Variables for the aliens
//  float  y4=100;
   
  color c;     // color of the alien
 float speed; //speed of the aliens
  Asteroid() {
                 
    x = random(0,750);     // Start with a random x location
    y = -20;
    y2= 640;
    x3=-20;
    y3=random(0,550);
    // Start a little above the window
    
     // Color
  }

  void update(float tempx){
    speed=tempx;
  
    // Increment the speed of the aliens
    y += speed; 
    x -=speed;
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

  // Display the black aliens
  void display() {
    fill(255);
    noStroke();
    for (int i = 2; i < 8; i++ ) {
      image(img17,x,y ,50,50);
    }
  }
  
    void display7() {
    fill(255,0,0);
    noStroke();
    for (int i = 2; i < 8; i++ ) {
      image(img18,x,y ,50,50);
    }
  }

  void display2() {
    // Display the red aliens
    fill(255,0,0);
    noStroke();
    for (int i = 2; i < 8; i++ ) {
      rect(x,y2 ,30,30);
    }
  }
  
    void display3() {
    // Display the blue aliens
    fill(0,0,255);
    noStroke();
    for (int i = 2; i < 4; i++ ) {
      rect(x,y ,30,30);
    }
  }
     void display4() {
    // Display the green aliens
    fill(0,255,0);
    noStroke();
    for (int i = 2; i < 4; i++ ) {
      rect(x3,y3 ,30,30);
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
    
// alien.remove()  ; 
        
}



}
