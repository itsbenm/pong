float batY = 0;
int deltaX = 5;
int deltaY = 5;
float ballX = 400;
float ballY = 300;
int score = 0;
boolean[] keys = {false,false};
 

void setup() {
  size(800,600);
  smooth(2);
  frameRate(60);
}

void draw() {
  background(0);
  rect(10,batY,10,80);
  ball();
  textScore();
  textSpeed();
  if(keys[0] && batY>0) batY -= 10;
  if(keys[1] && batY<height-80) batY += 10;
  if(ballX>=width) {
    deltaX *= -1;
  }
  if(ballY>=height || ballY<=0) {
    deltaY *= -1;
  }
  if(ballX<=20) {
    if(ballY>=batY && ballY<=batY+80) {
      deltaX *= -1;
      score += 1;
      deltaX += 1;
      deltaY += 1;
    }
    else if(ballX<0) {
      println("Score: " + score);
      score = 0;
      ballX = 400;
      ballY = 300;
      deltaX = 5;
      int[] ySpeed = {-5,-4,-3,-2,2,3,4,5};
      deltaY = ySpeed[(int)random(ySpeed.length)];
    }
  }
}

void ball() {
  ellipse(ballX,ballY,10,10);
  ballX += deltaX;
  ballY += deltaY;
}

void textScore() {
    textSize(24);
    text("Score: " + score,width/6,50);
}

void textSpeed() {
    textSize(24);
    text("Ball Speed: " + abs(deltaX),5*width/8,50);
}

void keyPressed() {
  if(keyCode == UP) keys[0] = true;
  if(keyCode == DOWN) keys[1] = true;
}

void keyReleased() {
  if(keyCode == UP) keys[0] = false;
  if(keyCode == DOWN) keys[1] = false;
}
