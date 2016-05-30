Ball[] balls;

boolean reactionStarted;


void setup() {
  size(600, 600);
  reactionStarted = false;
  balls = new Ball[25];
  for (int i=0; i < balls.length; i++ )
    balls[i] = new Ball();
  balls[0].state = Ball.DEAD;
}


void draw() {
  background(0);


  for (int i=0; i < balls.length; i++ ) { // for loop to test if they collide
     for (int c = 0; c < i ; c++) {
       if (balls[i].isTouching(balls[c]) && balls[i].state == Ball.MOVING) {
         balls[i].state = Ball.GROWING;
       }
     }
     
     for (int c = i + 1; c < balls.length ; c++) {
       if (balls[i].isTouching(balls[c]) && balls[i].state == Ball.MOVING) {
         balls[i].state = Ball.GROWING;
       }
     }
  }

  for (int i=0; i < balls.length; i++ ) { // for loop that keeps the balls moving
    balls[i].draw(i);
    balls[i].process();
  }
}


void mouseClicked() {
  if ( !reactionStarted ) {
    balls[0].x = mouseX;
    balls[0].y = mouseY;
    balls[0].rad = 0.1;
    balls[0].state = Ball.GROWING;
    reactionStarted = true;
    }
}