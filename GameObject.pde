class GameObject
{
  float x=400, y=400;//where the ship starts
  PVector forward;//PVectpr
  PVector position;//PVector
  float theta;
  color colour;
  boolean alive;
  
  GameObject()
  {
   alive=true; 
   position=new PVector(width/2,height/2);
   forward= new PVector(0,-1);
  }
  void move()
  {
  }
  
  void display()
  {
    println("display getting called");
  } 
}
