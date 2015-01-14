class Player extends GameObject
{
  float w, h;
  
  float timeDelta=10.0f/60.f;
  float firerate=2.0f;
  float ellapsed=0;
  float toPass=1.0f/firerate;
  
  
  Player(float x, float y, float w, float h)
  {
    position.x=x;
    position.y=y;
    this.w = w;
    this.h = h;
    colour = color(255);
    theta = 0;
    frameRate(60);
  }

  Player(float x, float y)
  {
    position.x = x;
    position.y = y;
    h = 20;
    w = 20;
    colour = color(255);
    theta = 0;
  }
  
  Player()
  {
    x = width / 2;
    y = height/ 2;
    w = 20;
    h = 20;
    colour = color(255);
    theta = 0;
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y);   
    rotate(theta);
    
    stroke(colour);
    float halfWidth = w / 2;
    float  halfHeight = h / 2;
    
    line(-halfWidth, halfHeight, 0, - halfHeight);
    line(0, - halfHeight, halfWidth, halfWidth);
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
  }
  
  void move()
  {
    ellapsed+=timeDelta;
    float lx, ly;
    lx = sin(theta);
    ly = -cos(theta);
    if (keyPressed)
    {
      switch (key)
      {
        case 'w':
          x = x + lx;
          y = y + ly;
          break;
        case 's':
          y = y - ly;
          break;
        case 'a':
          theta -= 0.1f;
          break;
        case 'd':
          theta += 0.1f;
          break;  
        case ' ':
          if (ellapsed>toPass)
       {   
          Bullet bullet = new Bullet();
          bullet.x = x;
          bullet.y = y;
          bullet.theta = theta;
          objects.add(bullet);
          ellapsed=0.0f;
      }
      }
    }
  }
}
