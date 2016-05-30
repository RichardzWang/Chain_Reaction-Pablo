// Team Pablo: Richard Wang, Manish Saha, Jack Schluger
// APCS2 pd05
// HW47 -- All That Bouncin'
// 2016-05-27

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

  for (Ball a : balls) { // for loop to test if they collide
     for (Ball b : balls) {
       if ( a != b ) {
         if (a.isTouching(b)) {
           a.state = Ball.GROWING;
         }
       }
    }
    a.draw();
    a.process();
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
