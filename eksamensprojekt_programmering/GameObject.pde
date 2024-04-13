class GameObject {
  float friction = 0.9; 
  PVector position;
  PVector velocity;
  float mass;
  float speed;
  int size = 20;

  GameObject(float m, float x, float y) {

    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
  }
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass*10);
    velocity.add(f);
  }
  void update() {
    rect(position.x, position.y, size, size);
    position.add(velocity);
    velocity.x*=friction;
  }
  void collision(GameObject GO) {
    if (GO.position.x+GO.size>position.x && GO.position.x<position.x+size && GO.position.y+GO.size>position.y && GO.position.y<position.y+size) {
       fill(0);
       circle(GO.position.x,GO.position.y,10);
       circle(position.x,position.y,10);
       //println("her er problemet");
       uncollide(GO);
    }
         
  }
  void uncollide(GameObject PF) {
    PVector result = new PVector();
    if (abs(PF.position.x-(position.x+size))<abs((position.x+PF.size)-position.x)) {
      result.x = PF.position.x-(position.x+size);
    } else {
      result.x = (PF.position.x+PF.size)-position.x;
    }
    if (abs(PF.position.y-(position.y+size))<abs((PF.position.y+PF.size)-position.y)) {
      result.y = PF.position.y-(position.y+size);
    } else {
      result.y = (PF.position.y+PF.size)-position.y;
    }
    if (abs(result.x)<abs(result.y)) {
      position.x+=result.x;
      velocity.x=0;
    } else {
      position.y+=result.y;
      velocity.y=0;
    }
  }
}
