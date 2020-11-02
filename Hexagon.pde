void hexagon(int x, int y, int radius){
        float sx=x+cos(5*PI/3)*radius;
        float sy=y;
        beginShape();
        vertex(sx,sy);
        for(float a=0; a<5*PI/3; a+=(TWO_PI/6)){
            sx = sx+ cos(a)*radius;
            sy = sy+ sin(a)*radius;
            vertex(sx,sy);
        }
        endShape(CLOSE);
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
