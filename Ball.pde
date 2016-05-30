// Team Pablo: Richard Wang, Manish Saha, Jack Schluger
// APCS2 pd05
// HW47 -- All That Bouncin'
// 2016-05-27

class Ball {
  
  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;
      
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
    
    x = random( (width - rad) + rad/2 );
    y = random( (height - rad) + rad/2 );

    dx = random(10) - 5;
    while (dx == 0)
      dx = random(10) - 5;
    dy = random(10) - 5;
    while (dy == 0)
      dx = random(10) - 5;
      
    state = MOVING;
  }

  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }
  
  void bounce() {
    if (x > width - rad || x < rad) {
      dx = -dx;
    }
    if (y > height - rad || y < rad) {
      dy = -dy;
    }
  }
  
  void process() {
    if (state == MOVING) {
      move();
    }
    if (state == GROWING) {
      rad += 0.2;
      draw();
      if (rad >= 50) {
        state = SHRINKING;
      }
    }
    if (state == SHRINKING) {
      rad -= 0.2;
      draw();
      if (rad <= 0) {
        rad = 0;
        draw(); // to remove the centers ( sometimes they stay as dots )
        state = DEAD;
      }
    }
    else { // state = DEAD
      rad = 0;
      draw();
    }
  }
  
  void draw() {
    fill(c);
    noStroke();
    ellipse(x,y,2*rad,2*rad);
  }
 
 boolean isTouching( Ball other ) {
   //distance formula
   if (state == MOVING && (other.state == GROWING || other.state == SHRINKING)) { // only works if other ball is growing/shrinking
     return ((rad + other.rad) > (sqrt(pow((x - other.x),2) + pow((y - other.y),2)))); 
   }
   else {
     return false;
   }
 }
 
}//end class Ball
