//sound//
import ddf.minim.*;
AudioPlayer player;
Minim minim;
//sound//
ArrayList<Ball> balls; // calling the ball class

Ball ball1;    // Declaration of a ball object from the Ball class.
float X; // x position of the moving rectangle  
float Y; // y posisiotn of the moive rectangle
int counter; // the score
float Mx; //maze X position 
float My; // maze Y position
PImage img; // the objective image
int time; //the timer

void setup()
{
  img = loadImage("food.png"); //loading the image
  image(img, 0, 0);// setting the image up

  fullScreen(); // size of the screen
  X = width-300; // player object X
  Y = height-100; // player Object Y
  time =300000;// start value

  Mx = width/4;
  My = height-100;

  counter =0;

  balls = new ArrayList();
  balls.add  (new Ball());
  minim = new Minim(this);
  player = minim.loadFile("backgroundSound.mp3"); //music was taken from this web site http://opengameart.org/content/space-boss-battle-theme
  player.play();
}

void draw()
{

  background(254, 244, 232);
  maze();// bring the maze code from the ball class
  time = time -1;
  if (time==0) {
    frameRate(0); // the time limit
    player.pause(); //pause the music
  }
  //the Player object
  fill(255, 50, 0);
  rect(X, Y, 40, 40);

  for ( Ball ball : balls)
  {
    ball.diameter =random(20, 52);
    ball.draw();
    ball.move();

    if ((dist(X+20, Y+20, ball.position.x, ball.position.y) < ball.diameter-10)) // the balls and player object
    {
      textSize(100);
      text("GAME OVER", width/2 -300, height/2);
      frameRate(0);//stops the game
      player.pause();
    }
  }
  textSize(50);
  fill(0);
  text("Sajawal Kiani",800, 60);
  fill(255, 0, 0);
  text ("Score:", 20, 50);// the word score displayed 
  text (counter, 170, 50); //the score counter
  
  text ("Time Left:", width-450, 50);// time limit
  text(time,width-200,50 ); //the timer display
  
  image(img, width-1480, height-595, 90, 90);// the food image
}


void keyPressed() {
  if (key == 'r') {
    setup(); // restart the game
  }
  if (key == 'l') // this adds more balls 
  {
    counter = counter +1;
    for (int i=0; i<1; i++ ) { //everytime its pressed, 1 more balls are added
      Ball smallBall = new Ball();
      smallBall.diameter =16;
      smallBall.colour = color(random(0, 255), random(50, 60), random(0, 255));
      balls.add (smallBall);
    }
  }
  if (key == 'w') // moves the ball up
  {
    Y = Y-20;
    X = X +0;
    if ((X >= Mx-450 && X <= Mx+1000 && Y==My) || //bottom line 
      (X >= Mx-350 && X <= Mx+1400 && Y == My-100) || // bottom line 2
      (X >= Mx-250 && X <= width-140 && Y == My-200) || // bottom line 3
      (X >= Mx-150 && X <= Mx+1200 && Y == My-300) || // bottoom line 4
      (X >= Mx-50 && X <= Mx+1100 && Y == My-400) || // bottom line 5
      (X >= Mx-450 && X <= width-50 && Y == My-900)|| // top line 1
      (X >= Mx-350 && X <= width-150 && Y == My-800)|| //top line 2
      (X >= Mx-250 && X <= width-250 && Y == My-700)|| // top line 3
      (X >= Mx-150 && X <= width-1100 && Y == My-600)|| //top line 4
      (X >= Mx-50 && X <= Mx+1000 && Y == My-500) //top line 5
      ) { // adding the stop for walls
      Y = Y+20;
      X = X+0;
    }
  }
  if (key == 's') // moves the ball down
  {
    Y = Y+20;
    X = X +0;
    if ((X >= Mx-450 && X <= Mx+1000 && Y==My) || //bottom line 
      (X >= Mx-350 && X <= Mx+1400 && Y == My-100) || // bottom line 2
      (X >= Mx-250 && X <= width-140 && Y == My-200) || // bottom line 3
      (X >= Mx-150 && X <= Mx+1200 && Y == My-300) || // bottoom line 4
      (X >= Mx-50 && X <= Mx+1100 && Y == My-400) || // bottom line 5
      (X >= Mx-450 && X <= width-50 && Y == My-900)|| // top line 1
      (X >= Mx-350 && X <= width-150 && Y == My-800)|| //top line 2
      (X >= Mx-250 && X <= width-250 && Y == My-700)|| // top line 3
      (X >= Mx-150 && X <= width-1100 && Y == My-600)|| //top line 4
      (X >= Mx-50 && X <= Mx+1000 && Y == My-500) //top line 5
      ) { // adding the stop for walls
      Y = Y-20;
      X = X+0;
    }
  }
  if (key == 'a') //moves the ball to the left
  {
    X = X-20;
    Y = Y+0;
    if ((Y >= My-900 && Y <= My && X<=Mx-450)|| //left line 1
      (Y >= My-800 && Y <= My-100 && X <= Mx-350)|| // left line 2
      (Y >= My-700 && Y <= My-200 && X<=Mx-250)|| //left line 3
      (Y >= My-600 && Y <= My-300 && X<=Mx-150)|| //left line 4
      (Y >= My-500 && Y <= My-400 && X<=Mx-50) || //left line 5
      (Y >= My-900 && Y <=My-100 && X >=Mx+1400)|| //most right line
      (Y >= My-800 && Y <=My-200 && X >=Mx+1300)|| //right line 2
      (Y >= My-700 && Y <= My-300 && X>=Mx+1200)|| //right line 3
      (Y >= My-600 && Y <= My-400 && X>=Mx+1100)|| // right line 4
      (Y >= My-500 && Y <= My-460 && X>=Mx+1000) //right line
      ) {
      X = X+20;
      Y = Y+0;
    }
  }
  if (key == 'd') // moves the ball to the right 
  {
    X = X+20;
    Y = Y+0;
    if (
      (Y >= My-900 && Y <= My && X<=Mx-450)|| //left line 1
      (Y >= My-800 && Y <= My-100 && X <= Mx-350)|| // left line 2
      (Y >= My-700 && Y <= My-200 && X<=Mx-250)|| //left line 3
      (Y >= My-600 && Y <= My-300 && X<=Mx-150)|| //left line 4
      (Y >= My-500 && Y <= My-400 && X<=Mx-50) || //left line 5
      (Y >= My-900 && Y <=My-100 && X >=Mx+1400)|| //most right line
      (Y >= My-800 && Y <=My-200 && X >=Mx+1300)|| //right line 2
      (Y >= My-700 && Y <= My-300 && X>=Mx+1200)|| //right line 3
      (Y >= My-600 && Y <= My-400 && X>=Mx+1100)|| // right line 4
      (Y >= My-500 && Y <= My-460 && X>=Mx+1000) //right line
      ) {
      X = X-20;
      Y = Y+0;
    }
  }
}