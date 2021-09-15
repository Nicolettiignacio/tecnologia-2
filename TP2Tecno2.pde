import processing.sound.*;

import fisica.*; //importo la libreria de fisica 
import TUIO.*; //Declaramos un objeto de tipo TuioProcessing
TuioProcessing tuioClient;

SoundFile fondoMusica;
SoundFile FlechaMusica;
SoundFile HidraMusica;
SoundFile FescudoMusica;
SoundFile FlamaMusica;


FWorld mundo;
personaje p;
base Base;
Arco a;                
Enemigo enemigo;
BolaDeFuego bola; 
Limite limiteCabeza;
Tuio tuio;

int vidaC1=3, vidaC2=3, vidaC3=3;//VIDA DE LAS CABEZAS
float restarVidaC1= 99;
float restarVidaC2= 99;
float restarVidaC3= 99;
int MarcoVidaC1=99;
int MarcoVidaC2=99;
int MarcoVidaC3=99;

int tiempoDisparar = 5000;// 5 segundos para disparar bolas de fuego

float restarVidaPersonaje = 99;//VIDA DEL PERSONAJE
int vidaPersonaje=3;
int Yvida=320;

int pantalla=1;

PImage fondo, inicio, perder, ganar;


float PX;
float PY;

int PosJoystickX;
int PosJoystickY;


void setup() {
  size(1200, 700);

  //Inicio de Sonidos
  fondoMusica = new SoundFile(this, "Fondo.wav");

  fondoMusica.play();
  fondoMusica.amp(0.08);
  fondoMusica.loop();

  FlechaMusica = new SoundFile(this, "flecha.mp3");

  FlamaMusica =new SoundFile(this, "flama1.mp3");

  FescudoMusica = new SoundFile(this, "Fescudo.mp3");

  HidraMusica = new SoundFile(this, "Hidra.wav");
  //Inicio de Sonidos

  tuio= new Tuio();
  tuioClient  = new TuioProcessing(this);

  Fisica.init(this);


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

  // fondo=loadImage("castillo2.png");
  fondo=loadImage("fondo.jpeg");
  inicio=loadImage("inicio.png");
  perder=loadImage("perder.png");
  ganar=loadImage("ganar.png");
  
  enemigo.dibujarCuello();
}


void draw() {

  if (pantalla==0) {

    image(inicio, 0, 0, 1200, 700);


    vidaC1=3;
    vidaC2=3; 
    vidaC3=3;
    vidaPersonaje=3;

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

    restarVidaPersonaje = -585;//vida personaje
    enemigo.estadoC1 = 1;
    enemigo.estadoC2 = 1;
    enemigo.estadoC3 = 1;
  }

  if (pantalla==1) {


    image(fondo, 0, 0);
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




    bola.eliminarBola();
    enemigo.movimientoCabezas();
    enemigo.movimientoCabeza2();
    enemigo.movimientoCabeza3();

    p.acciones( );



    //EVALUA LAS VIDAS Y PIERDE
    if (vidaPersonaje<1) {
      pantalla=2;
    }
    //EVALUA LAS VIDAS DE LAS CABEZAS Y GANAS
    if ((vidaC1<1)&&(vidaC2<1)&&(vidaC3<1)) {
      pantalla=3;
    }

    //EVALUA SI EL PERSONAJE ESTA EN ESTADO 3=NORMAL Y DISPARA O NO
    if ( (tuio.estadoPj==3) ) {
      a.disparar( mundo );
    }


    //joystick
    fill(255, 0, 0, 0);//invisible
    rect(25, 30, 150, 85);
    rect(25, 30, 25, 85);//disparo
    rect(50, 30, 125, 25);//salto
    rect(50, 90, 125, 25);//cubierto

    fill(0);
    textSize(15);
    text("saltar", 75, 45);
    text("cubrirse", 75, 110);
    text("normal", 75, 80);
    text("t\ni\nr\no", 35, 40);
    
    fill(250,0,0);
    ellipse(PosJoystickX,PosJoystickY,25,25);
    
    //Joystick
    
    
    tuio.ejecutarTuio();
    enemigo.DibujarvidasCabezas();
    p.DibujarVidaPJ();
  }




  println("X"+PX);
  println("Y"+PY);

  //HayCabeza();
}
void HayCabeza() {    
  ArrayList <FBody> cuerpos = mundo.getBodies();

  for ( FBody este : cuerpos ) {
    String nombre = este.getName();
    if ( nombre != null ) {  
      if ((nombre.equals("enemigoCabeza1"))&&(nombre.equals("enemigoCabeza2"))&&(nombre.equals("enemigoCabeza3"))) {
      } else {
        enemigo.dibujarCabeza1();
      }
    }
  }
}


void keyPressed() {
  if (key==' ') {
    a.disparar( mundo );
  }
}







void contactStarted(FContact colision) {






  FBody cuerpo1 = colision.getBody1();
  FBody cuerpo2 = colision.getBody2();

  String nombre1 = bola.conseguirNombre(cuerpo1);
  String nombre2 = bola.conseguirNombre(cuerpo2);

  if (nombre1 == ("normal") && nombre2 == "bola1") {
    bola.dividirCirculo((FCircle)cuerpo2);
  }
  if (nombre2 == "normal" && nombre1 == "bola1") {
    bola.dividirCirculo((FCircle)cuerpo1);
  }
  if (nombre1 == ("normal") && nombre2 == "bola2") {
    bola.dividirCirculo((FCircle)cuerpo2);
  }
  if (nombre2 == "normal" && nombre1 == "bola2") {
    bola.dividirCirculo((FCircle)cuerpo1);
  }
  if (nombre1 == ("normal") && nombre2 == "bola3") {
    bola.dividirCirculo((FCircle)cuerpo2);
  }
  if (nombre2 == "normal" && nombre1 == "bola3") {
    bola.dividirCirculo((FCircle)cuerpo1);
  }







  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza1")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();     
    restarVidaC1 = restarVidaC1-33;
    vidaC1=vidaC1-1;
    mundo.remove(uno);

    if (vidaC1==0) {
      mundo.remove(dos);

      enemigo.estadoC1 = 0;
    }
  }

  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza2")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();     
    restarVidaC2 = restarVidaC2-33;
    vidaC2=vidaC2-1;
    mundo.remove(uno);

    if (vidaC2==0) {
      mundo.remove(dos);

      enemigo.estadoC2 = 0;
    }
  }
  if (enemigo.hayColisionEntre(colision, "bala1", "enemigoCabeza3")) {
    FBody uno = colision.getBody1();
    FBody dos = colision.getBody2();   
    restarVidaC3 = restarVidaC3-33;
    vidaC3=vidaC3-1;
    mundo.remove(uno);

    if (vidaC3==0) {
      mundo.remove(dos);

      enemigo.estadoC3 = 0;
    }
  }

  //colision de bolas de enemigo y personaje
  if (enemigo.hayColisionEntre(colision, "bola1", "salto") || enemigo.hayColisionEntre(colision, "bola2", "salto") || enemigo.hayColisionEntre(colision, "bola3", "salto")) {
    restarVidaPersonaje = restarVidaPersonaje-33;
    vidaPersonaje=vidaPersonaje-1;
  }
  if (enemigo.hayColisionEntre(colision, "bola1", "normal") || enemigo.hayColisionEntre(colision, "bola2", "normal") || enemigo.hayColisionEntre(colision, "bola3", "normal")) {
    restarVidaPersonaje = restarVidaPersonaje-33;
    vidaPersonaje=vidaPersonaje-1;
  }
}
