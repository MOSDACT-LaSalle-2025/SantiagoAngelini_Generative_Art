float xrot, yrot = 0; //Controls the rotation of the box
int i=0;              //Counts how many boxes have been drawn
int val=1;            //Changes the direction in Z
float x,y,z;          //Marks the initial positioin of each box
float w,h,d;          //Marks the dimentions of each box
int quantity;         //Marks how many boxes are gonna be drawn before restarting

void setup(){
  size(1280,720,P3D);
  background(0);
  Lightset();
  x=width/2;
  y=height/2;
  z=0;
  Room();
  w=random(50,200);
  h=random(50,200);
  d=random(50,200);
  x=random(400,width-400);
  y=random(200,height-200);
  quantity=int(random(4,10));
  //strokeWeight(2);
  //stroke(30);
}

void draw(){
  if(z>=200||z<=-1){
    val=val*-1;
    i++;
    Lightset();
    w=random(100,200);
    h=random(50,200);
    d=random(50,200);
    x=random(400,width-400);
    y=random(200,height-200);
  }
  if(i==quantity){
    Lightset();
    background(0);
    Room();
    i=0;
    quantity=int(random(4,10));
    //println(quantity);
  }
  translate(x,y,z);
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
  box(w,h,d);
  z+=val;
}

void Lightset(){
  ambient(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  ambientLight(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  lightSpecular(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  directionalLight(int(random(0,255)),int(random(0,255)),int(random(0,255)),random(-1,1),random(-1,1),random(-1,1));
  shininess(255);
}

void Room(){
  //strokeWeight(2);
  //stroke(0);
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
