float stage;
float bx;
float by;
float boxSize=75;
boolean overBox = false;
boolean locked = false;

void setup()
{
  size(800, 600);
  objects.add(new Player(100, 100)); 
  objects.add(new Player(200, 200)); 
  stage=1;
  bx = 100; by = 220; 
  
}

// Better to use an array list!
ArrayList<GameObject> objects = new ArrayList<GameObject>();


void draw()
{
 // this is the screen that will display if the stage =1
  if (stage==1){
  
    textAlign(CENTER,BOTTOM);// this is where the text is aligned
    textSize(44);// the size of the text
    text("SPACE INVASION",290,80);
    textSize(32);// the size of text
    text("CAN YOU SURVIVE THE APOCALYPSE",290,130);
    text("Normal",250,260);
    text("Mode",250, 300);
    
    text("Hard",230,410);
    text("Mode",233,450);
  
    text("Rules", 420, 555);    
   rect(bx, by, boxSize, boxSize);// this is where we use images to make the buttons look nicer
   // image(img7,bx2,by2,boxSize, boxSize);// this is where we use images to make the buttons look nicer
   // image(img7,bx4,by4,boxSize, boxSize);// this is where we use images to make the buttons look nicer
    
    
    //stage 2    normal mode
    // this is where we use the mousefunction to declare what stage we want to go to
    if (mousePressed== mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize)
      {  overBox = true;  //this is used to make sure the mouse clicks into the stage you selected
    if(!locked) {  
      stroke(255);  
// else {
  //  stroke(153);
//
      stage=2;// with this button pressed it declares to go stage two
}
  }
      }

if(stage==2)
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
  
   text("lives:",150, 570);
 text("lives2:",650,570);
}
  
}

