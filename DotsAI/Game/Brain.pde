class Brain {
  PVector[] moves;
  int step = 0;
  
  Brain(int size) {
    moves = new PVector[size];
    randomizeMoves();
  }
  
  // --------------------------------------------------------------------------------
  
  void randomizeMoves() {
    for (int i = 0; i < moves.length; i++) {
      float rand = random(2*PI);
      moves[i] = PVector.fromAngle(rand);
    }
  }
}
