//Daniel Cui
//1.10.2022
//2D -> 3D

float rotx, roty;
PImage diamond, dirt;
PImage top_, bottom_, side_;

void setup() {
  size(800, 800, P3D);
  textureMode(NORMAL);
  
  diamond = loadImage("diamond.png");
  dirt = loadImage("Bottom.png");
  top_ = loadImage("Top.png");
  bottom_ = loadImage("Bottom.png");
  side_ = loadImage("Side.png");

  rotx = radians(45);
  roty = radians(45);
}

void draw() {
  background(255);

  texturedCube(width/2, height/2, 0, diamond, 100);
  texturedCube(100, height/2, 0, dirt, 100);
  texturedCube(width/2, 100, 0, top_, side_, bottom_, 100);

  //cube(width/2, height/2, 0, #ff0000, 200);
  //cube(0, 0, 0, #0000ff, 200);
}

void texturedCube(float x, float y , float z, PImage texture, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  
  noStroke();
  
  beginShape(QUADS);
  texture(texture);
  
  //top
  //     x, y, z, tx, ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  
  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  
  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  
  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  
  endShape();
  
  
  popMatrix();
}

void texturedCube(float x, float y , float z, PImage top, PImage side, PImage bottom, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);
  
  noStroke();
  
  beginShape(QUADS);
  texture(top);
  
  //top
  //     x, y, z, tx, ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  
  endShape();
  
  beginShape(QUADS);
  texture(bottom);
  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  endShape();
  
  beginShape(QUADS);
  texture(side);
  
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);
  
  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);
  
  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);
  
  endShape();
  
  
  popMatrix();
}

void cube(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);

  rotateX(rotx);
  rotateY(roty);

  fill(c);
  strokeWeight(5);
  stroke(0);
  box(size, size, size); //W, H, D
  popMatrix();
}

void ball(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z);

  rotateX(rotx);
  rotateY(roty);
  
  fill(c);
  strokeWeight(3);
  stroke(c);
  sphere(size);
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY) * 0.01;
  roty = roty + (pmouseX - mouseX) * -0.01;
}
