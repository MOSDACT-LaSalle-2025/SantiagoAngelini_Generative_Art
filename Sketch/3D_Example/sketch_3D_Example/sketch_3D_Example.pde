float xrot, yrot = 0;
int i=0;
int val=1;
float x,y,z;

void setup(){
  size(1280,720,P3D);
  background(0);
  x=width/2;
  y=height/2;
  z=0;
  Room();
}

void draw(){
  //background(0);
  if(i>=200||i<=-1){
    val=val*-1;
    background(0);
    Room();
  }
  translate(width/2,height/2,i);
  xrot+=PI/180;
  yrot+=PI/180;
  if(xrot>=TWO_PI){
    xrot=0;
  }
  if(yrot>=TWO_PI){
    yrot=0;
  }
  rotateY(xrot);
  rotateX(yrot);
  box(240);
  i+=val;
}

void Room(){
  beginShape();
  wall(0,0,0,0,height,height,0,0,0,-500,-500,0);
  endShape(CLOSE);
  beginShape();
  wall(width,width,width,width,height,height,0,0,0,-500,-500,0);
  endShape(CLOSE);
  beginShape();
  wall(0,0,width,width,0,0,0,0,0,-500,-500,0);
  endShape(CLOSE);
  beginShape();
  wall(0,0,width,width,height,height,height,height,0,-500,-500,0);
  endShape(CLOSE);
  
}

void wall(float x1, float x2,float x3, float x4, float y1, float y2, float y3, float y4, float z1, float z2, float z3, float z4){
  vertex(x1,y1,z1);
  vertex(x2,y2,z2);
  vertex(x3,y3,z3);
  vertex(x4,y4,z4);
}
