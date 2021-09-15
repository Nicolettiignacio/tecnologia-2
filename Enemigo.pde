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
  int estadoC1=1;
  ;
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
    hidra=loadImage("hidra2.png");
    cuerpoEnemigo.attachImage(hidra);
    mundo.add(cuerpoEnemigo);
    if (pantalla==1) {
      HidraMusica.play();
    }
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
    // estadoC1 = 1;
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

    enemigoCabeza2.addImpulse(random(impulso1, impulso2-300), random(impulso3, impulso4-600));
  }
  void movimientoCabeza3() {
    enemigoCabeza3.addImpulse(random(impulso1, impulso2), random(impulso3, impulso4));
  }

  void DibujarvidasCabezas() {
    //cabeza1
    float PX = enemigo.enemigoCabeza1.getX();
    float PY= enemigo.enemigoCabeza1.getY();

    float PosicionMarco=PX-50;
    stroke(2);
    fill(255, 0, 0);
    rect(PX-50, PY-75, restarVidaC1, 10);

    fill(255, 0, 0, 0);
    stroke(2);
    rect(PosicionMarco, PY-75, MarcoVidaC1, 10);
    if (restarVidaC1==0) {
      MarcoVidaC1=0;
      // PosicionMarco=-1000;
    }
    //cabeza1
    //cabeza 2
    float PX2 = enemigo.enemigoCabeza2.getX();
    float PY2= enemigo.enemigoCabeza2.getY();

    float PosicionMarco2=PX2-50;
    stroke(2);
    fill(255, 0, 0);
    rect(PX2-50, PY2-75, restarVidaC2, 10);

    fill(255, 0, 0, 0);
    stroke(2);
    rect(PosicionMarco2, PY2-75, MarcoVidaC2, 10);
    if (restarVidaC2==0) {
      MarcoVidaC2=0;
      // PosicionMarco=-1000;
    }
    //cabeza2
    //cabeza 3
    float PX3 = enemigoCabeza3.getX();
    float PY3 = enemigoCabeza3.getY();

    float PosicionMarco3=PX3-50;
    stroke(2);
    fill(255, 0, 0);
    rect(PX3-50, PY3-75, restarVidaC3, 10);

    fill(255, 0, 0, 0);
    stroke(2);
    rect(PosicionMarco3, PY3-75, MarcoVidaC3, 10);
    if (restarVidaC3==0) {
      MarcoVidaC3=0;
      // PosicionMarco=-1000;
    }
    //cabeza 3
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

  void dibujarCuello() {
    float PCX3 = enemigo.enemigoCabeza2.getX();
    float PCY3= enemigo.enemigoCabeza2.getY();


    float frequency = 25;
    float damping = 1500;
    float puenteY=350;
    FBody[] steps = new FBody[1]; //cantidad de barras

    int boxWidth = 300/(steps.length) - 2;



    for (int i=0; i<steps.length; i++) {
      steps[i] = new FBox(boxWidth, 15);
      steps[i].setPosition(1100, puenteY); //barras unidas map(i, 0, steps.length-1, boxWidth, width-boxWidth), puenteY
      steps[i].setNoStroke();
      steps[i].setFill(120, 200, 190);
      mundo.add(steps[i]);
    }

    for (int i=1; i<steps.length; i++) {
      FDistanceJoint junta = new FDistanceJoint(steps[i-1], steps[i]);
      junta.setAnchor1(50, 0);//boxWidth/2, 0
      junta.setAnchor2(-boxWidth/2, 0);//-boxWidth/2, 0
      junta.setFrequency(frequency);
      junta.setDamping(damping);      //Uniones del medio
      junta.setFill(0, 0, 255);
      junta.calculateLength();
      mundo.add(junta);
    }

    FCircle left = new FCircle(10);
    left.setStatic(true);
    left.setPosition(800/*0 200*/, 400/*puenteY*/);        //punta Izquierda punta verde
    left.setDrawable(false);
    left.setGrabbable(true);
    mundo.add(left);

    FCircle right = new FCircle(10);
    right.setStatic(true);
    right.setPosition(1025, 500);   //Punta derecha 250+100/*width*/, puenteY+50 punta roja
    right.setDrawable(false);
    mundo.add(right);

    FDistanceJoint juntaPrincipio = new FDistanceJoint(steps[0], left);
    juntaPrincipio.setAnchor1(-boxWidth/2, 0);
    juntaPrincipio.setAnchor2(0, 100);//0,0
    juntaPrincipio.setFrequency(frequency);
    juntaPrincipio.setDamping(damping);
    juntaPrincipio.calculateLength();
    juntaPrincipio.setFill(0, 255, 0);   //linea que se va mover
    mundo.add(juntaPrincipio);

    FDistanceJoint juntaFinal = new FDistanceJoint(steps[steps.length-1], right);
    juntaFinal.setAnchor1(boxWidth/2, 0);
    juntaFinal.setAnchor2(0, 0);
    juntaFinal.setFrequency(frequency);
    juntaFinal.setDamping(damping);
    juntaFinal.calculateLength();         //linea del cuello estatica
    //juntaFinal.setDrawable(false);
    juntaFinal.setFill(255, 0, 0);
    mundo.add(juntaFinal);
  }
}
