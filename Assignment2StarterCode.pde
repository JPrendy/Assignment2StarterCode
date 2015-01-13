void setup()
{
  size(500, 500);
  objects.add(new Player(100, 100)); 
  objects.add(new Player(200, 200)); 

}

// Better to use an array list!
ArrayList<GameObject> objects = new ArrayList<GameObject>();


void draw()
{
  background(0);
  for (int i = 0 ; i < objects.size() ; i ++)
  {
    objects.get(i).move();
    objects.get(i).display();
    if(! objects.get(i).alive)
    {
      objects.remove(i);
    }
  }  
  
   text("lives",150, 430);
 text("lives:",350,460);
}
