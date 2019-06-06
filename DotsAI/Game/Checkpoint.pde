class Checkpoint {
  boolean passed = false;
  float x1, x2, y1, y2;

  Checkpoint(float a, float b, float c, float d) {
    x1 = a;
    x2 = c;
    y1 = b;
    y2 = d;
  }

  void render() {
    fill(50, 50, 50);
    rect(x1, y1, x2, y2);
  }
}
