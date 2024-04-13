class Enemy extends GameObject {
  Enemy(float m, float xin, float yin) {
    super(m, xin, yin);
  }
  void update() {
   fill(255,0,0);
   super.update();
  }
  void Damage(){
    if(true){
      
    }
  }
  void move(Player p){
    if (position.x>p.position.x && velocity.x>-1){
      velocity.x--;
    } 
    if (position.x<p.position.x && velocity.x<1){
      velocity.x++;
    }
  }
 
  
}
