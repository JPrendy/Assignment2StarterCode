  class Catcher {
  float diam;//thus set up the diameter for the intersection
  float diam2=30;
  color col; // color
  float x,y,y3; // location
  float speed=6;// speed
  float y2=420;// location
  float x2=300;
    float theta=0;
    
    
// float    x5=0;
  // float  y5=580;
  
  Catcher(float tempR) {
    diam = tempR;  //temporary class
    col = color(255);
 
  }
  
  void setLocation(float tempX, float tempY) {
    x = tempX; //this sets the location of the catcher
    y = tempY;
  }
  
    


  void display() {
     stroke(255);
    fill(col);
   pushMatrix();
    translate(x, y);   
    rotate(theta);
    
  //rect(x,y,diam,diam);
  
    float halfWidth = w / 9;
    float  halfHeight = h / 9;
    
    line(-halfWidth, halfHeight, 0, - halfHeight);
    line(0, - halfHeight, halfWidth, halfHeight);
    line(halfWidth, halfHeight, 0, 0);
    line(0,0,  - halfWidth, halfHeight);
    popMatrix();
    
    
    
      if (x > width-20 )              // if the spaceship hits the side, it will moved to the other side of the screen
  {
    x=+30;                                  //If it did reverse the direction
  }
        if (x < 20 )                //Did the spaceship hit the side?
  {
    x=+580;                                  //If it did reverse the direction
  }
     if (y > height-20 )                //Did the spaceship hit the side?
  {
   
   
    y=+30;                                  //If it did reverse the direction
  }
        if (y < 20 )                //Did the spaceship hit the side?
  {
    y=+580;                                  //If it did reverse the direction
  }
  
  rect(x2,y2,20,20);
  

    float ly = -cos(theta);
    float lx = sin(theta);
   
   // x += lx * speed;
    y2 += ly * speed;
    x2 += lx * speed;
   if(key=='p')//if the s key is pressed the bullet will go off
   {
  
   
 
    pushMatrix();
    translate(x, y);
    rotate(theta);
 
    popMatrix();
   }
     
   if(key!='p')//if it's not the s key it will go to the x direction
   {
     y2=y;
     x2=x;
   }
   
//  if(y2<10)// if it goes above 10 it will go to the y direction
  //  {
    // y2=y;
      // }
       
          if(x2<0)
   {
     x2=width;
   }
   if(x2>width)
   {
     x2=0;
   }
   if(y2>height)
   {
     y2=0;
   }
   if(y2<0)
   {
     y2=height;
   }
       
   }
  
  
  
  
    void display2()
  {
    image(img14,x,y3,20,20);//these displays the cannons
    image(img14,x-300,y3,20,20);
   
  }
  
  void display4()
  {
    fill(255,0,0);
    stroke(255);
    rect(x,y,800,30);
  }
    
  void mousePressed()
   {
    if(mousePressed==false)//if mousepressed is false the bullets will keep going
   {
    y3 -= speed; //it moves at that speed
   }
   
     if(y3<10)//if it goes above that height, it is returned to 570
    {
     y3=570;
       }
   
   } 
  
  
    void move()
  {
        float lx, ly;
    lx = sin(theta);
    ly = -cos(theta);
    if (keyPressed)
    {
      switch (key)
      {
        case 'w':
          x = x + lx*3;
          y = y + ly*3;
          break;
        case 's':
          y = y - ly*3;
          x = x - lx*3;
          break;
        case 'a':
          theta -= 0.1f;
          break;
        case 'd':
          theta += 0.1f;
          break;  
      }
    }
  }
    
    
      void move2()
  {
        float lx, ly;
    lx = sin(theta);
    ly = -cos(theta);
    if (keyPressed)
    {
      switch (key)
      {
        case 'w':
          x = x - lx*6;
          y = y - ly*6;
          break;
        case 's':
          y = y + ly*6;
          x = x + lx*6;
          break;
        case 'a':
          theta -= 0.1f;
          break;
        case 'd':
          theta += 0.1f;
          break;  
      }
    }
  }




  
  // A function that returns true or false based on
  // if the catcher intersects an alien
  boolean intersect(Alien d) {
    // Calculate distance
    float distance = dist(x,y,d.x,d.y);//this sets up the distance between the catcher and the alien 
    
    // Compare distance to sum of diameters between the two and if they fit, say true
    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  }
    boolean intersect2(Alien d) {
    // Calculate distance
    float distance = dist(x,y,d.x3,d.y3); //this sets up the distance between the catcher and the alien 
    
   // Compare distance to sum of diameters between the two and if they fit, say true
    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  }
   boolean intersect3(Alien d) {
    // Calculate distance
    float distance = dist(x,y3,d.x,d.y); //this sets up the distance between the catcher and the alien 

    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  
  }
    boolean intersect4(Alien d) {
    // Calculate distance
    float distance = dist(x-300,y3,d.x,d.y); //this sets up the distance between the catcher and the alien 
    // Compare distance to sum of radii
    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  
  }
     boolean intersect5(Alien d) {
    // Calculate distance
    float distance = dist(x2,y2,d.x,d.y);  //this sets up the distance between the catcher and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
     }
        boolean intersect6(Alien d) {
    // Calculate distance
    float distance = dist(x2,y2,d.x3,d.y3);  //this sets up the distance between the catcher cannon and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
        }
             boolean intersect7(Alien d) {
    // Calculate distance
    float distance = dist(x,y3,d.x3,d.y3);  //this sets up the distance between the catcher cannon and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
             }
                 boolean intersect8(Alien d) {
    // Calculate distance
    float distance = dist(x-300,y3,d.x3,d.y3);  //this sets up the distance between the catcher cannon and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
}
  boolean intersect9(Alien d) {
    // Calculate distance
    float distance = dist(x,y,d.x,d.y);//this sets up the distance between the catcher and the alien 
    
    // Compare distance to sum of diameters between the two and if they fit, say true
    if (distance < diam) { 
      return true;
    } else {
      return false;
    }


}

 boolean intersect10(Sun d){
   
   float distance =dist(x,y,d.x,d.y);
   
   if (distance <diam) {
     return true;
        } else {
      return false;
    }


}
}
