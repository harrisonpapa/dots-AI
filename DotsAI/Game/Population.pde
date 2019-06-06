class Population {
  Dot[] dots;
  float totalFitness = 0;
  int fittestDot;
  PVector[] bestMoves;

  Population(int size) {
    dots = new Dot[size];
    for (int i = 0; i < dots.length; i++) {
      dots[i] = new Dot();
    }
  }

  // --------------------------------------------------------------------------------

  void update() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].update();
    }
  }

  // --------------------------------------------------------------------------------

  void render() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].render();
    }
    if (fittestDot >= 0) {
      dots[fittestDot].render();
    }
  }

  // --------------------------------------------------------------------------------

  boolean areAllDead() {
    for (int i = 0; i < dots.length; i++) {
      if (!dots[i].dead && !dots[i].atGoal) {
        return false;
      }
    }

    return true;
  }

  // --------------------------------------------------------------------------------

  void calculateFittest() {
    for (int i = 0; i < dots.length; i++) {
      totalFitness += dots[i].calculateDotFitness();
    }


    int fittestSofar = 0;
    float fittestSofarVal = 0;
    
    for (int i = 0; i < dots.length; i++) {
      if (dots[i].fitness > fittestSofarVal) {
        fittestSofar = i;
        fittestSofarVal = dots[i].fitness;
      }
    }

    fittestDot = fittestSofar;
    bestMoves = dots[fittestDot].brain.moves;
    
    println(fittestDot);
    println(dots[fittestDot].brain.step);
    println();
  }

  // --------------------------------------------------------------------------------

  void mutateBabies() {
    for (int i = 0; i < dots.length; i++) {
      dots[i] = new Dot();
    }

    dots[fittestDot].fittest = true;
    float mutationChance = 0.005;
    for (int i = 0; i < dots.length; i++) {
      for (int b = 0; b < dots[i].brain.moves.length; b++) {
        float rand = random(1);
        if (rand < mutationChance) {
          dots[i].brain.moves[b] = PVector.fromAngle(random(2*PI));
        } else {
          dots[i].brain.moves[b] = bestMoves[b];
        }
      }
    }
    dots[fittestDot].brain.moves = bestMoves;
  }
}
