class Ball {
  
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
      
  //other constants necessary?
  
  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;

  
  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b );
    
    rad = 10;
    
    x = random( (width - r) + r/2 );
    y = random( (height - r) + r/2 );

    dx = random(10) - 5;
    dy = random(10) - 5;
    
    state = MOVING;
  }
  

  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }
  
  void bounce() {
    if (x < 0) {
      dx = -dx;
    }
    if (x > width) {
      dx = -dx;
    }
    if (y < 0) {
      dy = -dy;
    }
    if (y > height) {
      dy = -dy;
    }
  }
  
  void process() {
    if (state == MOVING) {
      move();
    }
    else if (state == GROWING) {
      rad += 0.2;
      ellipse(x,y,2 * rad, 2 * rad);
      if (rad >= 50) {
        state = SHRINKING;
      }
    }
    else if (state == SHRINKING) {
      rad -= 0.2;
      ellipse(x,y,2 * rad, 2 * rad);
      if (rad <= 0) {
        rad = 0;
        ellipse(x,y, 2 *rad, 2 *rad); // to remove the centers ( sometimes they stay as dots )
        state = DEAD;
      }
    }
    else {
      //dead...
    }
  }
  
  void draw(int i) {
    fill(c);
    ellipse(x,y,2*rad,2*rad);
  }
 
 
 boolean isTouching( Ball other ) {
   //distance formula squared
   if (other.state == GROWING || other.state == SHRINKING) { // only works if other ball is growing/shrinking
     return ((rad*rad + other.rad * other.rad) > ((x - other.x) * (x - other.x) + (y - other.y) * (y - other.y))); 
   }
   else {
     return false;
   }
 }
 
 
  
}//end class Ball