class Dot {
  PVector pos;
  PVector acc;
  PVector vel;
  Brain brain;

  boolean dead = false;
  boolean atGoal = false;
  boolean fittest = false;
  
  boolean passedCp1 = false;
  boolean passedCp2 = false;

  float fitness = 0;

  Dot() {
    brain = new Brain(800);

    pos = new PVector(300, 590);
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
  }

  // --------------------------------------------------------------------------------

  void render() {
    if (fittest) {
      pushMatrix();
      fill(0, 255, 0);
      ellipse(pos.x, pos.y, 8, 8);
      popMatrix();
    } else {
      fill(0);
      ellipse(pos.x, pos.y, 4, 4);
    }
  }

  // --------------------------------------------------------------------------------

  void move() {
    if (brain.moves.length > brain.step) {
      acc = brain.moves[brain.step];
      brain.step++;
    } else {
      dead = true;
    }

    vel.add(acc.x, acc.y);
    vel.limit(5);
    pos.add(vel);
  }

  // --------------------------------------------------------------------------------

  void update() {
    if (!dead && !atGoal) {
      move();

      if (pos.x < 2 || pos.x > width - 2 || pos.y < 2 || pos.y > height - 2) {
        dead = true;
      } else if (dist(pos.x, pos.y, goal.pos.x, goal.pos.y) < 5) {
        atGoal = true;
      } else if (pos.x > ob1.x && pos.x < ob1.x + ob1.a && pos.y > ob1.y && pos.y < ob1.y + ob1.b) {
        dead = true;
      } else if (pos.x < ob2.x && pos.x > ob2.x + ob2.a && pos.y > ob2.y && pos.y < ob2.y + ob2.b) {
        dead = true;
      } else if (pos.x > cp1.x1 && pos.x < cp1.x1 + cp1.x2 && pos.y > cp1.y1 && pos.y < cp1.y1 + cp1.y2) {
        passedCp1 = true;
      } else if (pos.x > cp2.x1 && pos.x < cp2.x1 + cp2.x2 && pos.y > cp2.y1 && pos.y < cp2.y1 + cp2.y2) {
        passedCp2 = true;
      }
    }
  }

  // --------------------------------------------------------------------------------

  float calculateDotFitness() {
    if (atGoal) {
      fitness =  10000 + (1 - float(brain.step));
    } else if (passedCp2) {
      fitness = 20 + (1 / dist(pos.x, pos.y, goal.pos.x, goal.pos.y));
    } else if (passedCp1) {
      fitness = 10 + (1 / dist(pos.x, pos.y, (cp2.x1 + cp2.x1 + cp2.x2)/2, (cp2.y1 + cp2.y1 + cp2.y2)/2));
    } else {
      fitness = 1 / dist(pos.x, pos.y, (cp1.x1 + cp1.x1 + cp1.x2)/2, (cp1.y1 + cp1.y1 + cp1.y2)/2);
    }
    return fitness;
  }
}
