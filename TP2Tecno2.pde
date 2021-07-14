

import fisica.*; //importo la libreria de fisica 
//import TUIO.*; //Declaramos un objeto de tipo TuioProcessing
//TuioProcessing tuioClient;


PImage fondo;
FWorld mundo;//objeto mundo de fisica

personaje p;
base Base;
Arco a;
Enemigo e;

int vidas = 3;

void setup() {
  size(1200, 700);
  //inicializamos la libreria
  // tuioClient  = new TuioProcessing(this);
  Fisica.init(this);//inicializamos la libreria

  fondo=loadImage("castillo2.png");//poner un array de todas las imagenes del juego

  //inicio un mundo//
  mundo=new FWorld();
  mundo.setEdges();

  //inicio al personaje y dibujo//
  p= new personaje(80, 100); //ancho,alto
  p.dibujarPersonaje(mundo);

  //incio clase base//
  Base = new base(115, 260, 90, 570); //ancho,alto,posX,posY
  Base.dibujarBase();

  //inicio clase arco
  a = new Arco(50, 450); //posicion del arco

  //inicio al enemigo
  e = new Enemigo(200, 200);
  e.cuerpo();
 e.dibujarCabeza1();
}


void draw() {

  image(fondo, 0, 0, width, height);
  a.movimientoArco();

// e.dibujarCabeza1();
   e.MoverCabeza();

  mundo.step();
  mundo.draw();



  a.dibujar();  
  a.eliminarBala();

  fill(255, 0, 0); 
  textSize(50);
  textAlign(CENTER);
  text("VIDAS: " + vidas, width/2, 100);
   
}

void keyPressed() {
  if ( key==' ' ) {
    a.disparar( mundo );
  } 

  p.acciones( );
}


void contactStarted(FContact colision) {

  if (e.hayColisionEntre(colision, "bala1", "enemigoCabeza1")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();   
    //  mundo.remove(uno);     //podemos hacer que cada vida, sea una cabeza del enemigo, y asi cada vez que colisione, va a desaparecer la cabeza
    //  mundo.remove(dos);
    vidas = vidas - 1;
  }
}
