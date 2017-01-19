class Ball
{
  PVector position;    // Position of the ball.
  PVector velocity;    // Amount it moves on each redraw.
  float diameter;      // Size of ball.
  color colour;        // Colour of ball.
 
  // Initialises the ball's state.
  Ball()
  {
    position = new PVector(width/2, height/2);
    velocity = new PVector(random(-12,12),random(-12,12));
    diameter = 30;
    colour   = color(214, 93, 69);
  }
 
  // Draws the ball at its current position.
  void draw()
  {
    noStroke();
    fill(colour);
    ellipse(position.x, position.y, diameter, diameter);
  }
 
  // Moves the ball according to its current velocity.
  void move()
  {
    position.x = position.x + velocity.x;
    position.y = position.y + velocity.y;
 
    if (position.x < 0)
    {
      velocity.x = -1 * velocity.x; // If we are left of sketch move ball right.
    }
    else if (position.x > width)
    {
      velocity.x = -1 * velocity.x; // If we are right of sketch move ball left.
    }
 
    if (position.y < 0)
    {
      velocity.y = -1 * velocity.y; // If we are at top of sketch move ball down.
    }
    else if (position.y > height)
    {
      velocity.y = -1 * velocity.y; // If we are ar bottom of sketch move ball up.
    }
  }
}
void maze(){
// maze code//
  fill(0, 0, 0);
  stroke(100);
  line(Mx-450, My, Mx+1000, My); // bottom line
  line(Mx-450, My, Mx-450, My-900); //   most left line
  line(Mx-450, My-900, width-50, My-900); //  top line
  line(Mx+1390, My-900, Mx+1400, My-100); // most right line
  line(Mx+1400, My-100, Mx-350, My-100); //  bottom line 2
  line(Mx-350, My-100, Mx-350, My-800); //  left line 2
  line(Mx-350, My-800, width-150, My-800); //  top line 2
  line(width-150, My-800, Mx+1300, My-200); //  right line 2
  line(width-140, My-200, Mx-250, My-200 ); //  bottom line 3
  line(Mx-250, My-200, Mx-250, My-700); //   left line 3
  line(Mx-250, My-700, width-250, My-700); //  top line 3
  line(width-250, My-700, Mx+1200, My-300); // right line 3
  line(Mx+1200, My-300, Mx-150, My-300); //  bottom line 4
  line(Mx-150, My-300, Mx-150, My-600); // left line 4
  line(Mx-150, My-600, Mx+1100, My-600); //  top line 4
  line(Mx+1100, My-600, Mx+1100, My-400); // right line 4
  line(Mx+1100, My-400, Mx-50, My-400); //  bottom line 5
  line(Mx-50, My-400, Mx-50,  My-500); // left line 5 
  line(Mx-50, My-500, Mx+1000, My-500); //  top line 5
  line(Mx+1000, My-500, Mx+1000,  My-460); // right line 5
  ellipse(width-1450, height-550, 50, 50);
  // end of the maze//
}