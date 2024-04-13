class Platform extends GameObject {
  float x;
  float y;
  Platform(float m, float xin, float yin) {
    super(m, xin, yin);
    x=xin;
    y=yin;
    position.y=yin;
    position.x=xin;
    size=40;
  }
  void show() {
    rect(x, y, 40, 40);
  }
  void update() {
    fill(202, 164, 114);
    super.update();
  }
}
