class Obstacle {
  float x, y, a, b; 
  
  Obstacle(float q, float w, float e, float r) {
     x = q;
     y = w;
     a = e;
     b = r;
   }
   
   // --------------------------------------------------------------------------------
   
   void render() {
     fill(255, 255, 0);
     rect(x, y, a, b);
   }
}
