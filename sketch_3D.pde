//Daniel Cui
//1.10.2022
//2D -> 3D

float rotx, roty;

void setup() {
  size(800, 800, P3D);

  rotx = radians(45);
  roty = radians(45);
}

void draw() {
  background(255);

  cube(width/2, height/2, 0, #ff0000, 200);
  cube(0, 0, 0, #0000ff, 200);
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
