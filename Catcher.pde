class Catcher {
  float diam;//thus set up the diameter for the intersection
  float diam2=30;
  color col; // color
  float x, y,x3,y3; // location
  float speed=6;// speed
  float y2=420;// location
  float x2=300;
  float y4=100;
  float i=0;
float theta = 0;//this is for the rotations of the cannons
int radius = 80;
float speed2= .050;
//this positions the cannons radius
float  centerX=width/1.2;
 float centerY=height/1.2;


  // float    x5=0;
  // float  y5=580;

  Catcher(float tempR) {
    diam = tempR;  //temporary class
    col = color(255);
  }

//this sets the location of the spaceship
  void setLocation(float tempX, float tempY) {
    x = tempX; //this sets the location of the catcher
    y = tempY;
  }

//this sets the location of the cannon
 void setLocation2(float tempX3, float tempY3) {
    x3 = tempX3; //this sets the location of the catcher
    y3 = tempY3;
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
    line(0, 0, - halfWidth, halfHeight);
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


    if (key==' ')//if the s key is pressed the bullet will go off
    {
     
    rect(x2, y2, 20, 20);
     // rect(x2, y2-50, 20, 20);

    float ly = -cos(theta);
    float lx = sin(theta);

    // x += lx * speed;
    y2 += ly * speed;
    x2 += lx * speed;


      pushMatrix();
      translate(x, y);
      rotate(theta);

      popMatrix();
    }

    if (key!=' ')//if it's not the s key it will go to the x direction
    {
      y2=y;
      x2=x;
    }

    //  if(y2<10)// if it goes above 10 it will go to the y direction
    //  {
    // y2=y;
    // }

    if (x2<0)
    {
      x2=width;
    }
    if (x2>width)
    {
      x2=0;
    }
    if (y2>height)
    {
      y2=0;
    }
    if (y2<0)
    {
      y2=height;
    }
  }

  

  void display2()
  {
      
   noFill();
  stroke(255);
//  ellipse(width/2, height/2, 2*radius, 2*radius);
 
  x3=cos(theta)*radius*0.4 + centerX;
  y3=sin(theta)*radius*0.4+ centerY;
  noStroke();
  fill(255);
  image(img27,x3, y3, 40, 40);
  ellipse(x3-400, y3-340, 20, 20);
  theta=theta+speed2;
    
   // image(img14, x, y3, 20, 20);//these displays the cannons
   // image(img14, x-300, y3, 20, 20);
  }



  void display4(float tempi)
  {
    i+=tempi;


    fill(255, 0, 0);
    stroke(255);
    image(img, x, y, 130, 130);
    if (i>=1) {
      //fill(0, 255, 0);
      image(img2, x, y, 130, 130);
    }
     if (i>=2) {
      //fill(0, 255, 0);
      image(img9, x, y, 130, 130);
    }
      if (i>=6) {
      //fill(0, 255, 0);
      image(img19, x, y, 130, 130);
    }
      if (i>=10) {
      //fill(0, 255, 0);
      image(img20, x, y, 130, 130);
    }
   
     if (i>=14) {
      //fill(0, 255, 0);
      image(img20, x, y, 130, 130);
    }
      if (i>=18) {
      //fill(0, 255, 0);
      image(img21, x, y, 130, 130);
    }
     if (i>=20) {
      //fill(0, 255, 0);
      image(img22, x, y, 130, 130);
    }
    
  }

  void caught2() {

    fill(0);
    stroke(255);        
    rect(x, y4, 20, 20);

    stroke(255, 255, 0);
    //   noFill();
  }

  void mousePressed()
  {
    if (mousePressed==false)//if mousepressed is false the bullets will keep going
    {
      y3 -= speed; //it moves at that speed
    }

    if (y3<10)//if it goes above that height, it is returned to 570
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
        theta += 0.2f;
        break;
      case 'd':
        theta -= 0.2f;
        break;
      }
    }
  }





  // A function that returns true or false based on
  // if the catcher intersects an alien
  boolean intersect(Asteroid d) {
    // Calculate distance
    float distance = dist(x, y, d.x, d.y);//this sets up the distance between the catcher and the alien 

    // Compare distance to sum of diameters between the two and if they fit, say true
    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  }
  boolean intersect2(Asteroid d) {
    // Calculate distance
    float distance = dist(x, y, d.x3, d.y3); //this sets up the distance between the catcher and the alien 

    // Compare distance to sum of diameters between the two and if they fit, say true
    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  }
  boolean intersect3(Asteroid d) {
    // Calculate distance
    float distance = dist(x3, y3, d.x, d.y); //this sets up the distance between the catcher and the alien 

    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  }
  boolean intersect4(Asteroid d) {
    // Calculate distance
    float distance = dist(x-300, y3, d.x, d.y); //this sets up the distance between the catcher and the alien 
    // Compare distance to sum of radii
    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  }
  boolean intersect5(Asteroid d) {
    // Calculate distance
    float distance = dist(x, y2, d.x, d.y);  //this sets up the distance between the catcher and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
  }
  boolean intersect6(Asteroid d) {
    // Calculate distance
    float distance = dist(x, y2, d.x3, d.y3);  //this sets up the distance between the catcher cannon and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
  }
  boolean intersect7(Asteroid d) {
    // Calculate distance
    float distance = dist(x, y3, d.x3, d.y3);  //this sets up the distance between the catcher cannon and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
  }
  boolean intersect8(Asteroid d) {
    // Calculate distance
    float distance = dist(x-300, y3, d.x3, d.y3);  //this sets up the distance between the catcher cannon and the alien 
    // Compare distance to sum of radii
    if (distance < diam2) { 
      return true;
    } else {
      return false;
    }
  }
  boolean intersect9(Asteroid d) {
    // Calculate distance
    float distance = dist(x, y, d.x, d.y);//this sets up the distance between the catcher and the alien 

    // Compare distance to sum of diameters between the two and if they fit, say true
    if (distance < diam) { 
      return true;
    } else {
      return false;
    }
  }

  boolean intersect10(Sun d) {

    float distance =dist(x, y, d.x, d.y);

    if (distance <diam) {
      return true;
    } else {
      return false;
    }
  }
}

































  
  
  
  

