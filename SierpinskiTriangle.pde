float rot = 0;
int s = (int)(Math.random()*5+3);
int c = color((int)(Math.random()*50+100), (int)(Math.random()*50+100), (int)(Math.random()*50+100));
public void setup() {
  size(800, 800);
}
public void draw() {
  background(0, 0, 0);
  fill(c);
  translate(width/2, height/2);
  rotate(rot);
  sierpinski(s, 0, 0, height/4);
  rotate(-1*rot);
  translate(-1*width/2, -1*height/2);
  
  translate(width, height);
  rotate(-1*rot);
  sierpinski(s, 0, 0, height/6);
  rotate(rot);
  translate(-1*width, -1*height);
  
  translate(0, height);
  rotate(-1*rot);
  sierpinski(s, 0, 0, height/6);
  rotate(rot);
  translate(0, -1*height);
  
  translate(width, 0);
  rotate(-1*rot);
  sierpinski(s, 0, 0, height/6);
  rotate(rot);
  translate(-1*width, 0);
  
  rotate(-1*rot);
  sierpinski(s, 0, 0, height/6);
  rotate(rot);
  
  rot+= 0.005;
}
public void mouseClicked() {
  int temp = (int)(Math.random()*5+3);
  while(temp == s){
    temp = (int)(Math.random()*5+3);
  }
  s = temp;
  c = color((int)(Math.random()*100+155), (int)(Math.random()*100+155), (int)(Math.random()*100+155));
}
public void sierpinski(int sides, float x, float y, float siz) {
  if (siz < height/4/sides/sides) {
    beginShape();
    for (int i = 0; i < sides; i++) {
      vertex((float)(x+siz*Math.sin(i*TWO_PI/sides)), (float)(y+siz*Math.cos(i*TWO_PI/sides)));
    }
    endShape();
  } else {
    float adjustment = 1;
    if (sides == 4) {
      adjustment = 0.75;
    }else if(sides == 5){
      adjustment = 0.85;
    }
    for (int i = 0; i < sides; i++) {
      if (sides == 3) {
        sierpinski(sides, (float)(x+siz*Math.sin((i+0.5)*TWO_PI/sides)), (float)(y+siz*Math.cos((i+0.5)*TWO_PI/sides)), siz/2);
      } else {
        sierpinski(sides, (float)(x+siz*Math.sin((i+0.5)*TWO_PI/sides)), (float)(y+siz*Math.cos((i+0.5)*TWO_PI/sides)), adjustment*siz/(sides/2));
      }
    }
  }
}



