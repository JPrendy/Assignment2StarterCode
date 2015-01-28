class Sun extends GameObject
{
  float radius;
  float points;
  
  //this is the suns positons
  Sun(float x, float y, float radius, float points)
  {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.points = points;
    this.theta = 0;
  }
  
  //this is what we use th specify the location
  Sun()
  {
    this(width / 2, height / 2, 100, 5);
  }
  //this is used for the rotation
  void move()
  {
    theta += 0.01;
  }
  //this displays the sun and cause it to continually to rotate
  void display()
  {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    
    float px, py;
    float  lastx = 0, lasty = -radius;
    float theta1 = 0;
    float thetaInc = TWO_PI / (points * 2);
    //we are using the rotation of the star
    for(int i = 0 ; i < (points * 2) ; i ++)
    {
      theta1 += thetaInc;
      if (i % 2 == 1)
      {
        px = sin(theta1) * radius;
        py = -cos(theta1) * radius;
      }
      else
      {
        px = sin(theta1) * (radius * 0.5f);
        py = -cos(theta1) * (radius * 0.5f);
      }
      line(lastx, lasty, px, py);
      lastx = px;
      lasty = py;
      
    }
    
    popMatrix();
    
  }
  
}
