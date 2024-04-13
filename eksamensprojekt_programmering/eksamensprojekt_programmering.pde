ArrayList<GameObject> GOs = new ArrayList<GameObject>();
boolean isLoaded = true;
int currLevel = 1;
Level one= new Level("1");
Level two= new Level("2");
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];
Player Peter=new Player(1, 1, 1);
PVector grav=new PVector(0, 1);
void setup() {
  size(1000, 1000);
  if (currLevel==1) {
    one.load();
    one.display(/*currlevel*/);
  } else if (currLevel==2) {
    two.load();
    two.display(/*currlevel*/);
  }
}

void draw() {
  background(200);
  textSize(24);
  fill(0);
  text("Nå den gule klods for at nå næste niveau", 400,50);
  
  noStroke();

  Peter.update();
  Peter.move();
  Peter.applyForce(grav);
  for (GameObject GO : GOs) {
    if (GO instanceof Enemy) {
      Enemy E = (Enemy)GO;
      E.move(Peter);
      E.applyForce(grav);
      E.update();
      Peter.takeDamage(E);
      for (GameObject platforme : GOs) {
        if (platforme instanceof Platform) {
          Platform PF = (Platform)platforme;
          E.collision(PF);
        }
      }
    } else if (GO instanceof Platform) {
      Platform PF = (Platform)GO;
      Peter.collision(PF);

      PF.update();
    } else if (GO instanceof powerUp) {
      powerUp P = (powerUp)GO;
      P.update();
      Peter.oneUp(P);
    } else if (GO instanceof Goal) {
      Goal G = (Goal) GO;
      G.update();
      Peter.nextLevel(G);

      
    }
    if (GO instanceof Boss) {
      Boss B = (Boss)GO;
      B.move(Peter);
      B.applyForce(grav);
      B.update();
      Peter.takeDamage(B);
      for (GameObject platforme : GOs) {
        if (platforme instanceof Platform) {
          Platform PF = (Platform)platforme;
          B.collision(PF);
        }
      }
            B.jump(Peter);

    }
  }


  Peter.die();
  rectMode(CORNER);
  // println(GOs.size());
  if (!isLoaded){
      GOs.clear();
      if (currLevel==1){
        one.load();
        two.display();
        isLoaded=true;
      }
      if (currLevel==2){
        two.load();
        two.display();
        isLoaded=true;
    }
  }
}
void keyPressed() {
  Peter.inputHandler(key, true);
}

void mousePressed() {
  Peter.position = new PVector(mouseX, mouseY);
  Peter.velocity = new PVector(0, 0);
}

void keyReleased() {
  Peter.inputHandler(key, false);
}
