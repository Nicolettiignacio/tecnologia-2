import fisica.*; //importo la libreria de fisica 
import TUIO.*; //Declaramos un objeto de tipo TuioProcessing
TuioProcessing tuioClient;


PImage fondo;
FWorld mundo;

personaje p;
base Base;
Arco a;                
Enemigo enemigo;
BolaDeFuego bola; 
Limite limiteCabeza;
Tuio tuio;

int vidasP = 5;
int vidaC1=4, vidaC2=4, vidaC3=4;
int tiempoDisparar = 5000;
int tiempoOcurridoDisparar;



void setup() {
  size(1200, 700);

  tiempoOcurridoDisparar = millis();

  tuio= new Tuio();
  tuioClient  = new TuioProcessing(this);

  Fisica.init(this);

  fondo=loadImage("castillo2.png");


  mundo=new FWorld();
  mundo.setEdges();

  p= new personaje(80, 100); 
  p.dibujarPersonaje(mundo);

  Base = new base(115, 260, 90, 570); 
  Base.dibujarBase();

  a = new Arco(50, 450); 


  enemigo = new Enemigo(200, 200, mundo, bola);
  enemigo.cuerpo();
  enemigo.dibujarCabeza1();
  enemigo.dibujarCabeza2();
  enemigo.dibujarCabeza3();
  enemigo.cadenaCabezas();
  limiteCabeza = new Limite();
  limiteCabeza.dibujarRects();
  bola = new BolaDeFuego(50, 50, mundo, enemigo);
}






void draw() {

  image(fondo, 0, 0, width, height);
  mundo.step();
  mundo.draw();

  a.movimientoArco();
  a.dibujar();  
  a.eliminarBala();

  pushStyle();
  fill(255, 0, 0); 
  textSize(20);
  textAlign(CENTER);
  text("VIDAS PERSONAJE: " + vidasP, 140, 50);
  popStyle();




  if (frameCount %500 == 0 ) { 
    if (millis()  > tiempoDisparar) { 
      bola.dibujarB1();
    }
  }
  if (frameCount %970 == 0 ) { 
    if (millis()  > tiempoDisparar) { 
      bola.dibujarB2();
    }
  }
  if (frameCount %850 == 0 ) { 
    if (millis()  > tiempoDisparar) { 
      bola.dibujarB3();
    }
  }


  fill(255, 0, 0); 
  textSize(20);
  textAlign(CENTER);
  text("VidaC1: " + vidaC1, width/2+200, 50);
  text("VidaC2: " + vidaC2, width/2+350, 50);
  text("VidaC3: " + vidaC3, width/2+500, 50);
  bola.eliminarBola();
  enemigo.movimientoCabezas();
  enemigo.movimientoCabeza2();
  enemigo.movimientoCabeza3();
  //println(p.estado);

  tuio.ejecutarTuio();
  p.acciones( );

  
  
  if ( tuio.estadoPj==3) {   
    a.disparar( mundo );
  }
}









void contactStarted(FContact colision) {

  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza1")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();     
    vidaC1 = vidaC1 - 1;
    if (vidaC1==0) {
      mundo.remove(dos);
      enemigo.estadoC1 = 0;
      //println(enemigo.estadoC1);
    }
  }

  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza2")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();     
    vidaC2 = vidaC2 - 1;
    if (vidaC2==0) {
      mundo.remove(dos);
      enemigo.estadoC2 = 0;
      //  println(enemigo.estadoC2);
    }
  }
  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza3")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();   
    vidaC3 = vidaC3 - 1;
    if (vidaC3==0) {
      mundo.remove(dos);
      enemigo.estadoC3 = 0;
      //  println(enemigo.estadoC3);
    }
  }

  //colision de bolas de enemigo y personaje
  if (enemigo.hayColisionEntre(colision, "bola1", "personaje") || enemigo.hayColisionEntre(colision, "bola2", "personaje") || enemigo.hayColisionEntre(colision, "bola3", "personaje")) {
    vidasP = vidasP - 1;
  }
  if (enemigo.hayColisionEntre(colision, "bola1", "salto") || enemigo.hayColisionEntre(colision, "bola2", "salto") || enemigo.hayColisionEntre(colision, "bola3", "salto")) {
    vidasP = vidasP - 1;
  }
  if (enemigo.hayColisionEntre(colision, "bola1", "normal") || enemigo.hayColisionEntre(colision, "bola2", "normal") || enemigo.hayColisionEntre(colision, "bola3", "normal")) {
    vidasP = vidasP - 1;
  }
}
