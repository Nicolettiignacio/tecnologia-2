class Enemigo {

  FWorld mundo;
  BolaDeFuego bola; 
  FDistanceJoint joint;
  FDistanceJoint joint2;
  FDistanceJoint joint3;

  FCircle enemigoCabeza1;
  FCircle enemigoCabeza2;
  FCircle enemigoCabeza3;
  FBox cuerpoEnemigo;


  PImage hidra, cabeza1, cabeza2, cabeza3;
  float tamX;
  float tamY;
  float tamC1 = 70;
  float px=750;
  float py = 400;
  float px2=910;
  float py2 = 300; //330
  float px3=1050;
  float py3 = 150;
  float posCuelloX1 = 800;
  float posCuelloY1 = 425;
  float angulo;
  float anguloVel = 1;
  float tiempo, cool, cool2;
  float impulso1 = -500;
  float impulso2 = 500;
  float impulso3 = -500;
  float impulso4 = 500;
  int estadoC1;
  int estadoC2;
  int estadoC3;

  Enemigo(float tam_X, float tam_Y, FWorld mundo, BolaDeFuego bola) {

    this.mundo = mundo;
    this.bola = bola;
    tamX = tam_X;
    tamY = tam_Y;

    angulo = 0;
  }

  void cuerpo() {

    cuerpoEnemigo = new FBox(tamX, tamY);
    cuerpoEnemigo.setName("enemigoCuerpo");
    cuerpoEnemigo.setPosition(950, 500);
    cuerpoEnemigo.setStatic(true);
    cuerpoEnemigo.setGrabbable(false);
    hidra=loadImage("hidra2n.png");
    cuerpoEnemigo.attachImage(hidra);
    mundo.add(cuerpoEnemigo);
  }


  void dibujarCabeza1() {
    enemigoCabeza1 = new FCircle(tamC1);
    enemigoCabeza1.setPosition(px, py);
    enemigoCabeza1.setName("enemigoCabeza1");
    cabeza1=loadImage("cabeza.png");
    enemigoCabeza1.setDensity(0.3);
    enemigoCabeza1.attachImage(cabeza1);
    enemigoCabeza1.setStatic(false);
    enemigoCabeza1.setGrabbable(false);
    enemigoCabeza1.setRotatable(false);
    enemigoCabeza1.setGroupIndex(-2);
    mundo.add(enemigoCabeza1);
    estadoC1 = 1;
  }




  void dibujarCabeza2() {
    enemigoCabeza2 = new FCircle(tamC1);
    enemigoCabeza2.setName("enemigoCabeza2");
    enemigoCabeza2.setPosition(px2, py2);
    cabeza2=loadImage("cabeza2.png");
    enemigoCabeza2.setDensity(0.3); 
    enemigoCabeza2.attachImage(cabeza2);
    enemigoCabeza2.setGrabbable(false);
    enemigoCabeza2.setRotatable(false);
    enemigoCabeza2.setGroupIndex(-2);
    mundo.add(enemigoCabeza2);
    estadoC2 = 1;
  }


  void dibujarCabeza3() {
    enemigoCabeza3 = new FCircle(tamC1+15);
    enemigoCabeza3.setName("enemigoCabeza3");
    enemigoCabeza3.setPosition(px3, py3);
    cabeza3=loadImage("cabeza3.png");
    enemigoCabeza3.attachImage(cabeza3);
    enemigoCabeza3.setRotatable(false);
    enemigoCabeza3.setGroupIndex(-2);
    enemigoCabeza3.setGrabbable(false);
    mundo.add(enemigoCabeza3);
    estadoC3 = 1;
  }


  void cadenaCabezas() {      
    joint = new FDistanceJoint(cuerpoEnemigo, enemigoCabeza1);
    joint.setStroke(0, 0, 255);
    joint.setFill(0, 0, 255);
    joint.setLength(10);   //Distancia máxima que va a tratar de mantener el joint entre los 2 objetos
    joint.setDamping(600); //Fuerza con la que va a tirar del objeto
    joint.setFrequency(.00005); //Frecuencia con la que el joint va a tirar del objeto (creoq ue está en segundos)
    joint.setDrawable(false);
    mundo.add(joint);
    cool=200;   //Variables para ajustar los tirones del cuello
    tiempo = 0;

    joint2 = new FDistanceJoint(cuerpoEnemigo, enemigoCabeza2);
    joint2.setStroke(0, 0, 255);
    joint2.setFill(0, 0, 255);
    joint2.setLength(10);  
    joint2.setDamping(600); 
    joint2.setDrawable(false);
    joint.setFrequency(.05); 
    mundo.add(joint2);
    cool=200;   
    tiempo = 0; 

    joint3 = new FDistanceJoint(cuerpoEnemigo, enemigoCabeza3);
    joint3.setStroke(0, 0, 255);
    joint3.setFill(0, 0, 255);
    joint3.setLength(400);  
    joint3.setDamping(600); 
    joint3.setDrawable(false);
    joint.setFrequency(.05);
    mundo.add(joint3);
    cool=200;   
    tiempo = 0;
  }




  void movimientoCabezas() {
    if (millis()>tiempo+cool) {
      enemigoCabeza1.addImpulse(random(impulso1, impulso2), random(impulso3, impulso4));
      tiempo = millis();
    }
  }

  void movimientoCabeza2() {  
    enemigoCabeza2.addImpulse(random(impulso1, impulso2), random(impulso3, impulso4));
  }

  void movimientoCabeza3() {
    enemigoCabeza3.addImpulse(random(impulso1, impulso2), random(impulso3, impulso4));
  }




  boolean hayColisionEntre( FContact contact, String nombreUno, String nombreDos ) {
    boolean resultado = false;
    FBody uno = contact.getBody1();
    FBody dos = contact.getBody2();
    String etiquetaUno = uno.getName();
    String etiquetaDos = dos.getName();

    if ( etiquetaUno != null && etiquetaDos != null ) {
      if ( 
        ( nombreUno.equals( etiquetaUno ) && nombreDos.equals( etiquetaDos ) ) ||
        ( nombreDos.equals( etiquetaUno ) && nombreUno.equals( etiquetaDos ) )
        ) {
        resultado = true;
      }
    }
    return resultado;
  }
}
