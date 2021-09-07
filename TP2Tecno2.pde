import processing.sound.*;

import fisica.*; //importo la libreria de fisica 
import TUIO.*; //Declaramos un objeto de tipo TuioProcessing
TuioProcessing tuioClient;



SoundFile fondoMusica;
SoundFile FlechaMusica;
SoundFile HidraMusica;
SoundFile FescudoMusica;
SoundFile FlamaMusica;




PImage fondo;
FWorld mundo;

personaje p;
base Base;
Arco a;                
Enemigo enemigo;
BolaDeFuego bola; 
Limite limiteCabeza;
Tuio tuio;

int vidaC1=3, vidaC2=3, vidaC3=3;//VIDA DE LAS CABEZAS
float restarVida = 585;

int tiempoDisparar = 5000;
int tiempoOcurridoDisparar=5000;

float restarVidaPersonaje = -585;//VIDA DEL PERSONAJE
int vidaPersonaje=3;

int pantalla=1;
PImage inicio, perder, ganar;


void setup() {
  size(1200, 700);

  fondoMusica = new SoundFile(this, "Fondo.wav");

  fondoMusica.play();
  fondoMusica.amp(0.08);
  fondoMusica.loop();

  FlechaMusica = new SoundFile(this, "flecha.mp3");

  FlamaMusica =new SoundFile(this, "flama1.mp3");

  FescudoMusica = new SoundFile(this, "Fescudo.mp3");

  HidraMusica = new SoundFile(this, "Hidra.wav");






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


  inicio=loadImage("inicio.png");
  perder=loadImage("perder.png");
  ganar=loadImage("ganar.png");
}


void draw() {



  if (pantalla==0) {

    image(inicio, 0, 0, 1200, 700);



    vidaC1=3;
    vidaC2=3; 
    vidaC3=3;
    vidaPersonaje=3;
    restarVida = 585;//vida de la hidra
    restarVidaPersonaje = -585;//vida personaje
    enemigo.estadoC1 = 1;
    enemigo.estadoC2 = 1;
    enemigo.estadoC3 = 1;
  }

  if (pantalla==2) {

    image(perder, 0, 0, 1200, 700);

    vidaC1=3;
    vidaC2=3; 
    vidaC3=3;
    vidaPersonaje=3;
    restarVida = 585;//vida de la hidra
    restarVidaPersonaje = -585;//vida personaje
    enemigo.estadoC1 = 1;
    enemigo.estadoC2 = 1;
    enemigo.estadoC3 = 1;
  }




  if (pantalla==3) {

    image(ganar, 0, 0, 1200, 700);
    
    vidaC1=3;
    vidaC2=3; 
    vidaC3=3;
    vidaPersonaje=3;
    restarVida = 585;//vida de la hidra
    restarVidaPersonaje = -585;//vida personaje
    enemigo.estadoC1 = 1;
    enemigo.estadoC2 = 1;
    enemigo.estadoC3 = 1;
  }




  if (pantalla==1) {


    image(fondo, 0, 0, width, height);
    mundo.step();
    mundo.draw();

    a.movimientoArco();
    a.dibujar();  
    a.eliminarBala();


    if (frameCount %350 == 0 ) { 
      if (millis()  > tiempoDisparar) { 
        bola.dibujarB1();
      }
    }
    if (frameCount %700 == 0 ) { 
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


    //pushStyle();
    fill(0, 255, 0);
    stroke(2);
    rect(width/2, 40, restarVida, 20);
    // popStyle();


    //pushStyle();
    fill(255, 0, 0, 0);
    stroke(2);
    rect(15, 40, width-30, 20);
    // popStyle();


    //pushStyle();
    stroke(2);
    fill(255, 0, 0);
    rect(width/2, 40, restarVidaPersonaje, 20);
    //popStyle();




    bola.eliminarBola();
    enemigo.movimientoCabezas();
    enemigo.movimientoCabeza2();
    enemigo.movimientoCabeza3();
    //println(p.estado);


    p.acciones( );



    //EVALUA LAS VIDAS Y PIERDE
    if (vidaPersonaje<1) {
      pantalla=2;
    }
    //EVALUA LAS VIDAS DE LAS CABEZAS Y GANAS
    if ((vidaC1<1)&&(vidaC2<1)&&(vidaC3<1)) {
      pantalla=3;
    }


    if ( (tuio.estadoPj==3) ) {
      a.disparar( mundo );
    }
  }
  tuio.ejecutarTuio();
}



void keyPressed() {
  if (key==' ') {
    a.disparar( mundo );
  }
}


void contactStarted(FContact colision) {

  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza1")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();     
    restarVida = restarVida-65;
    vidaC1=vidaC1-1;
    mundo.remove(uno);
    if (vidaC1==0) {
      mundo.remove(dos);
      enemigo.estadoC1 = 0;
      //println(enemigo.estadoC1);
    }
  }

  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza2")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();     
    restarVida = restarVida-65;
    vidaC2=vidaC2-1;
    mundo.remove(uno);
    if (vidaC2==0) {
      mundo.remove(dos);
      enemigo.estadoC2 = 0;
      //  println(enemigo.estadoC2);
    }
  }
  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza3")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();   
    restarVida = restarVida-65;
    vidaC3=vidaC3-1;
    mundo.remove(uno);
    if (vidaC3==0) {
      mundo.remove(dos);
      enemigo.estadoC3 = 0;
    }
  }

  //colision de bolas de enemigo y personaje
  if (enemigo.hayColisionEntre(colision, "bola1", "personaje") || enemigo.hayColisionEntre(colision, "bola2", "personaje") || enemigo.hayColisionEntre(colision, "bola3", "personaje")) {
    //restarVidaPersonaje = restarVidaPersonaje+195;
   // vidaPersonaje=vidaPersonaje-1;
  }
  if (enemigo.hayColisionEntre(colision, "bola1", "salto") || enemigo.hayColisionEntre(colision, "bola2", "salto") || enemigo.hayColisionEntre(colision, "bola3", "salto")) {
    restarVidaPersonaje = restarVidaPersonaje+195;
    vidaPersonaje=vidaPersonaje-1;
  }
  if (enemigo.hayColisionEntre(colision, "bola1", "normal") || enemigo.hayColisionEntre(colision, "bola2", "normal") || enemigo.hayColisionEntre(colision, "bola3", "normal")) {
    restarVidaPersonaje = restarVidaPersonaje+195;
    vidaPersonaje=vidaPersonaje-1;
  }
}
