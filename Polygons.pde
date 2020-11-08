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
