/*
  Author: Christopher Luft - christopher.luft@gmail.com
  Date: April 12, 2013
  Comment: The following program is a verbosely commented program that was used as an example during the
           first Processing101 workshop held on March 28, 2012. You can learn more here: processing101.wordpress.com
           Please feel free to email me if you have any questions.
*/

//declaring the x & y coordinates that will represent the position our shape at any given time
int x;
int y;
int frameCount;

//declaring the variables that will represent the height & width of our shape
int cWidth;
int cHeight;

//declaring variabls that will determien the direction of our shape at any given time
int yDirection;
int xDirection;

//declaring the variable that will determine the speed at which our shape moves
int velocity;

//declaring the variables that will hold the red, green and blue (rgb) values of our shape at any given time 
int r;
int g;
int b;

//declaring the variables that will hold the rate of change for the colour of our rgb variables
int rVelocity;
int gVelocity;
int bVelocity;

/*
  this is one of the two methods that the processing framework expects in order to run animations. it is where
  we initialize all of the variables that we have already declared. this method runs once at the beginning of the 
  program
*/
void setup()
{
  //this is a system method where we can setup the screen size (or canvas) that our program (or sketch) will run in
  size(1200,800);
  
  /*
    the following are the initializations of our variables... we are giving them their starting values
  */
  x = 0;
  y = 0;
 
  velocity = 4;
  
  cHeight = 20;
  cWidth = 20;
  
  yDirection = 0;
  xDirection = 0;
  
  frameNumber = 0;
  
  r = 0;
  g = 0;
  b = 0;
  
  rVelocity = 1;
  gVelocity = 2;
  bVelocity = 3;
}

/*
  the draw method is the other system method that processing expects if you are going to run an animation. after the start method runs once
  this method is called over and over again and it is where we manipulate our variables to move things forward in a stepwise manner
*/
void draw()
{
   /*
     the background method is another sytem method that lets us set the background colour. if i was going to uncomment this
     then the background would be re-drawn every cycle and there would be no line created by the shape. try uncommenting it
     and running the program to see what happens
   */
   //background(255);
  
   //the framerate is another system method that determines how many times a second this draw method is called
   frameRate(30);

   /*
     the following chunks of if/else statements are the logical control we are using in our program to determine what 
     actions should be taken (what & how to manipulate variables). i am not going to comment too much on these and leave 
     trying to understand them as an exercise. i go into detail on how the if/else statements work on the blog at 
     processing101.wordpress.com
   */
   if(r < 0)
   {
      r = 0;
      rVelocity = rVelocity * -1;
   }
   else if(r > 255)
   {
     r = 255;
     rVelocity = rVelocity * -1;
   }
   else
   {
      r = r + rVelocity;
   }
   
   if(g < 0)
   {
      g = 0;
      gVelocity = gVelocity * -1;
   }
   else if(g > 255)
   {
     g = 255;
     gVelocity = gVelocity * -1;
   }
   else
   {
      g = g + gVelocity;
   }
   
   if(b < 0)
   {
      b = 0;
      bVelocity = bVelocity * -1;
   }
   else if(b > 255)
   {
     b = 255;
     bVelocity = bVelocity * -1;
   }
   else
   {
      b = b + bVelocity;
   }
   //this method is used to set the internal colour of any shapes being used after it is called
   fill(r, g, b);
   
   //this method is used to set the outline colour of any shapes being used after it is called
   stroke(r,g,b);
   
   /*
     after all the previous logic takes place i am taking the results and calculating the next ppositiion that
     our shape is going to be drawn in
   */ 
   y = y + yDirection;
   x = x + xDirection;
   
   /*
     the ellipse method creates our shape and draws it to the screen. to learn how it works you should visit this page: http://processing.org/reference/ellipse_.html
     and while you are there you should look around at some of the other documentation around shapes and whatever else catches yoru interest.
     it is really important to get in the habbit of accessing documentation to learn how things work
   */
   ellipse(x, y, cWidth, cHeight);  
}

/*
  this is another system method that processing provides and allows us to take input from teh keyboard to manipulate our program.
  this method is not required to make an animated program but gives us a convenient way to interact with the code. i explain some
  of the control statements in this method but am leaving the logic and variable manipulation for you to examine as an exercise.
*/
void keyPressed() 
{
  /*
    this if statement will take whatever action we tell it to when the 's' key is pressed. we can put pretty much any 
    key we want in here as long as it is a key that when types would show up in a word processor
  */  
  if(key == 's')
  {
     xDirection = 0;
     yDirection = 0; 
  } 
  /*
    this nested series of if statements allows us to take an action when a key is pressed that does not have a symbol that 
    would show up on the screen when pressed in a word processor. because these keys do not have a symbol like others processing
    provides key-words that we can use in our conditional statement to represent them. you can read more about this here:http://processing.org/reference/keyCode.html
  */
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      /*
        the print command lets us print things to the console (the little black region at the the bottom of our integrated development environemnt)
        these printed statements are a really good to tool to send yourself messages that you can use to debug yoru program
      */
      print("UP ");
      if(yDirection == 0)
      {
         yDirection = velocity * -1;
      }
      else if(yDirection > 0)
      {
         yDirection = yDirection * -1; 
      }
      else if(yDirection < 0 && yDirection != 0)
      {
         xDirection = 0;
      }
    } 
    else if (keyCode == DOWN) 
    {
      print("DOWN ");
      if(yDirection == 0)
      {
        yDirection = velocity;
      }
      else if(yDirection < 0)
      {
         yDirection = yDirection * -1; 
      }
      else if(yDirection > 0 && yDirection != 0)
      {
         xDirection = 0;
      }
    } 
    else if (keyCode == LEFT) 
    {
      print("LEFT ");
      if(xDirection == 0)
      {
         xDirection = velocity * -1; 
      }
      else if(xDirection > 0)
      {
         xDirection = xDirection * -1; 
      }
      else if(xDirection < 0 && yDirection != 0)
      {
         yDirection = 0;
      }
    }
    else if (keyCode == RIGHT) 
    {
      print("RIGHT ");
      if(xDirection ==0)
      {
        xDirection = velocity;
      }
      else if(xDirection < 0)
      {
         xDirection = xDirection * -1; 
      }
       else if(xDirection > 0 && yDirection != 0)
      {
         yDirection = 0;
      }
    }
  }
}
