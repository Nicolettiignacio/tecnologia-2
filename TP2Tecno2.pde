import fisica.*; //importo la libreria de fisica 
//import TUIO.*; //Declaramos un objeto de tipo TuioProcessing
//TuioProcessing tuioClient;


PImage fondo;
FWorld mundo;//objeto mundo de fisica

personaje p;
base Base;
Arco a;                 //clases
Enemigo enemigo;
BolaDeFuego bola; 




int vidasP = 3;
int vidaC1=2, vidaC2=2, vidaC3=2;


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

  //incio  base//
  Base = new base(115, 260, 90, 570); //ancho,alto,posX,posY
  Base.dibujarBase();

  //inicio clase arco
  a = new Arco(50, 450); //posicion del arco

  //inicio al enemigo
  enemigo = new Enemigo(200, 200, mundo, bola);
  enemigo.cuerpo();
  enemigo.dibujarCabeza1();
  enemigo.dibujarCabeza2();
  enemigo.dibujarCabeza3();

  //inicio bolas de fuego
  bola = new BolaDeFuego(50, 50, mundo, enemigo);
}


void draw() {

  image(fondo, 0, 0, width, height);
  mundo.step();
  mundo.draw();


  a.movimientoArco();
  a.dibujar();  
  a.eliminarBala();


  fill(255, 0, 0); 
  textSize(20);
  textAlign(CENTER);
  text("VidaC1: " + vidaC1, width/2+200, 50);
  text("VidaC2: " + vidaC2, width/2+350, 50);
  text("VidaC3: " + vidaC3, width/2+500, 50);

  bola.eliminarBola();
}

void keyPressed() {
  if ( key==' ' ) {
    a.disparar( mundo );
    bola.dibujarB1();
    bola.dibujarB2();
    bola.dibujarB3();
  } 
  p.acciones( );
}


void contactStarted(FContact colision) {

  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza1")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();     
    vidaC1 = vidaC1 - 1;
    if (vidaC1==0) {
      mundo.remove(dos);
    }
  }

  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza2")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();     
    vidaC2 = vidaC2 - 1;
    if (vidaC2==0) {
      mundo.remove(dos);
    }
  }
  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza3")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();   
    vidaC3 = vidaC3 - 1;
    if (vidaC3==0) {
      mundo.remove(dos);
    }
  }
}
