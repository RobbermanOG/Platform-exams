class Player extends GameObject {
  int jumps=1;
  boolean collisionDown = false;
  boolean collisionRight = false;
  int health=1;
  boolean left, right, up;

  boolean collisionLeft = false;
  Player(float m, float x, float y) {
    super(m, x, y);
    speed=0.5;
    size=20;
  }

  void inputHandler(char tast, boolean p) {
    if (tast == ' ' || tast == 'w') {
      up = p;
    }
    if (tast == 'a') {
      left = p;
    }
    if (tast == 'd') {
      right = p;
    }
  }

  void move() {
    if (velocity.y==0) {
      jumps=1;
    }
    //aaaaa println(jumps);
    if (up && jumps>0 && velocity.y>-1) {
      jumps = velocity.y==0 ? jumps : jumps-1;
      velocity.y = -5.1;
    }
    if (left) {
      velocity.x-=speed;
    }
    if (right) {
      velocity.x+=speed;
    }
  }


  void update() {
    fill(0, 0, 200);
    rectMode(CORNER);
    super.update();
    rectMode(CENTER);
    int which = frameCount % num;
    mx[which] = position.x+size/2;
    my[which] = position.y+size/2;
    for (int i = 0; i < num; i++) {
      int index = (which+1 + i) % num;
      rect(mx[index], my[index], i/3, i/3);
    }
    rectMode(CORNER);
  }
  void die() {
    if (health<=0) {
      exit();
    }
    if (position.y>1000) {
      exit();
    }
  } //skriv om hvordan de næste funktionerne kan refaktureres
  void takeDamage(Enemy E) {
    if (position.x+size>=E.position.x && position.x<=E.position.x+E.size && position.y+size>=E.position.y && position.y<=E.position.y+E.size) {
      health-=1;
    }
  }
  void oneUp(powerUp one) {
    if (position.x+size>=one.position.x && position.x<=one.position.x+one.size && position.y+size>=one.position.y && position.y<=one.position.y+one.size) {
      health+=20;
      one.collision(Peter);
      one.position.y=-500;
    }
  }
  void nextLevel(Goal one){
    if (position.x+size>=one.position.x && position.x<=one.position.x+one.size && position.y+size>=one.position.y && position.y<=one.position.y+one.size){
      currLevel++;
      isLoaded=false;
    }
  }
}
