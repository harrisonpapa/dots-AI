class Goal {
  PVector pos;

  Goal(PVector xy) {
    pos = xy;
  }
  
  // --------------------------------------------------------------------------------
  
  void render() {
    fill(0, 0, 255);
    ellipse(pos.x, pos.y, 10, 10);
  }
}
