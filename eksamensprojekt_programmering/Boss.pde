class Boss extends Enemy {
  int jumps=1;
  Boss(float m, float xin, float yin) {
    super(m, xin, yin);
    size=30;
    mass=3;
  }
  void jump(Player P) {
    if (P.position.y<position.y && jumps==1 && velocity.y>-1) {
      velocity.y-=2;
      jumps--;
    }
  }
  void collision(GameObject GO){
    super.collision(GO);
    if (GO.position.x+GO.size>=position.x && GO.position.x<=position.x+size && GO.position.y+GO.size>=position.y && GO.position.y<=position.y+size){
    jumps=1;
    }
  }
}
