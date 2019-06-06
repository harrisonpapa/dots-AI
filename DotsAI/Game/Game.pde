Population pop;
Goal goal;
Obstacle ob1;
Obstacle ob2;
Checkpoint cp1;
Checkpoint cp2;

int generation = 0;

void setup() {
  size(600, 600);
  frameRate(200);
  pop = new Population(1000);
  goal = new Goal(new PVector(300, 10));
  ob1 = new Obstacle(0, 380, 450, 20);
  ob2 = new Obstacle(width, 320, -450, 20);
  cp1 = new Checkpoint(450, 380, 600, 20);
  cp2 = new Checkpoint(150, 340, 20, 40);
}

// --------------------------------------------------------------------------------

void draw() {
  if (pop.areAllDead()) {
    pop.calculateFittest();
    pop.mutateBabies();
    generation++;
  } else {
    background(255);
    ob1.render();
    ob2.render();
    
    cp1.render();
    cp2.render();
    
    goal.render();
    pop.update();
    pop.render();
    
    fill(0);
    text(generation, 10, 20);
  }
}
