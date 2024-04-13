  class Level {
  String curr;
  float tileSize=40;
  String[] loaded;
  Level(String currin) {
    curr=currin;
  }
  void load() {
    loaded=loadStrings(curr+".txt");
  }
  void /* float[][]*/ display(/*float[][] arrin*/) {
    //float[][] temp;
    for (int i = 0; i < loaded.length; i++) {
      String line = loaded[i];
      for (int j = 0; j < line.length(); j++) {
        char tile = line.charAt(j);
        float x = j * tileSize;
        float y = i * tileSize;
        if (tile == '1') {
          Platform ground = new Platform(0, x, y);
          ground.show();
          GOs.add(ground);
          /* temp=new float[j][1];
           arrin=temp;*/
        } else if (tile == '0') {
          /*temp=new float[j][0];
           arrin=temp;*/
        } else if (tile == 'e') {
          Enemy enemy = new Enemy(1, x, y);
          enemy.update();
          GOs.add(enemy);
        } else if (tile =='+') {
          powerUp oneUp = new powerUp(0, x, y);
          oneUp.update();
          GOs.add(oneUp);
        } else if (tile == 'g') {
          Goal G = new Goal(0, x, y);
          G.update();
          GOs.add(G);
        } else if (tile=='B'){
         Boss B = new Boss(3,x,y);
         GOs.add(B);
         }
      }
    }
    //return arrin;
  }
  
}
