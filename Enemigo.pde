class Enemigo {

  FWorld mundo;
  BolaDeFuego bola; 
  FDistanceJoint joint;
  FDistanceJoint joint2;
  FDistanceJoint joint3;
  FDistanceJoint joint4;

  FCircle enemigoCabeza1;
  FCircle enemigoCabeza2;
  FCircle enemigoCabeza3;
  
  
  FBox cuerpoEnemigo;

  float PYCuello ;
  float PXCuello ;
  PImage hidra, cabeza1, cabeza2, cabeza3, cuello1, cuello2, cuello3, cuello4, cuello5;
  float tamX;
  float tamY;
  float tamC1 = 70;
  float px=750;
  float py = 400;
  float px2=910;
  float py2 = 300; //330
  float px3=1050;
  float py3 = 150;

  float angulo;
  float anguloVel = 1;
  float tiempo, cool, cool2;
  float impulso1 = -500;
  float impulso2 = 500;
  float impulso3 = -500;
  float impulso4 = 500;


  int estadoC1=1;
  int estadoC2=1;
  int estadoC3=1;



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
    hidra=loadImage("hidra3.png");
    cuerpoEnemigo.attachImage(hidra);
    cuerpoEnemigo.setGroupIndex(-1);
    mundo.add(cuerpoEnemigo);
    if (pantalla==1) {
      HidraMusica.play();
    }

    cuello1=loadImage("cuelloA.png");
    cuello2=loadImage("cuelloB.png");
    cuello3=loadImage("cuelloC.png");
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
    estadoC1 = 1;
    mundo.add(enemigoCabeza1);
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
    estadoC2 = 1;
    mundo.add(enemigoCabeza2);
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




  void movimientoCabezas() {
    if (millis()>tiempo+cool) {
      enemigoCabeza1.addImpulse(random(impulso1, impulso2), random(impulso3, impulso4));
      tiempo = millis();
    }
  }

  void movimientoCabeza2() {  

    enemigoCabeza2.addImpulse(random(impulso1, impulso2-300), random(impulso3, -1000));
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
    }
    //cabeza 3
  }

  void cadenaCabezas() {      
    joint = new FDistanceJoint(cuerpoEnemigo, enemigoCabeza1);
    joint.setStroke(0, 0, 255);
    joint.setFill(0, 0, 255);
    joint.setLength(45);   //Distancia máxima que va a tratar de mantener el joint entre los 2 objetos
    joint.setDamping(600); //Fuerza con la que va a tirar del objeto
    joint.setFrequency(.00005); //Frecuencia con la que el joint va a tirar del objeto (creoq ue está en segundos)
    joint.setDrawable(false);
    mundo.add(joint);
    cool=200;   //Variables para ajustar los tirones del cuello
    tiempo = 0;

    joint2 = new FDistanceJoint(cuerpoEnemigo, enemigoCabeza2);
    joint2.setStroke(0, 0, 255);
    joint2.setFill(0, 0, 255);
    joint2.setLength(45);  
    joint2.setDamping(600); 
    joint2.setDrawable(false);
    joint.setFrequency(0.05); 
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

    float frequency = 5;
    float damping = 1;
    //float puenteY;
    // puenteY = 100/*height/3*/; //altura de las puntas

    FBody[] steps  = new FBody[5]; //CUELLO 1
    FBody[] steps2 = new FBody[4]; //CUELLO 2
    FBody[] steps3 = new FBody[4]; //CUELLO 3

    int boxWidth = 200/(steps.length); // 200:6
    int boxHeight=50;

    int posCuelloX= 1020;
    int posCuelloY= 500;

    int posCuelloX2= 975;
    int posCuelloY2= 500;

    int posCuelloX3= 975;
    int posCuelloY3= 500;
    int boxWidth3 = 200/(steps.length); //x dividido la cantidad de bloques
    int boxHeight3=15;


    for (int i=0; i<steps.length; i++) {
      steps[i] = new FBox(boxWidth, boxHeight);
      steps[i].setPosition(posCuelloX+i*+10, posCuelloY-i*55); //barras unidas
      steps[i].setNoStroke();
      steps[i].setFill(120, 200, 190);      //CUELLO CABEZA 3
      steps[i].setGroupIndex(-1);
      steps[i].attachImage(cuello1);
      if (i==0) {
        steps[i].setStatic(true);
        steps[i].setDrawable(true);
      }

      mundo.add(steps[i]);
    }


    for (int i=0; i<steps2.length; i++) {
      steps2[i] = new FBox(boxWidth, boxHeight+10);
      steps2[i].setPosition(posCuelloX2, posCuelloY2-i*55); //CUELLO CABEZA 2
      steps2[i].setNoStroke();
      steps2[i].setFill(120, 200, 190);
      steps2[i].setGroupIndex(-1);
      steps2[i].attachImage(cuello2);
      if (i==0) {
        steps2[i].setStatic(true);
      }

      mundo.add(steps2[i]);
    }


    for (int i=0; i<steps3.length; i++) {
      steps3[i] = new FBox(boxWidth3, boxHeight3+10);
      steps3[i].setPosition(posCuelloX3-i*25, posCuelloY3); //CUELLO CABEZA 1
      steps3[i].setNoStroke();
      steps3[i].setFill(120, 200, 190);
      steps3[i].setGroupIndex(-1);
      steps3[i].attachImage(cuello3);
      if (i==0) {
        steps3[i].setStatic(true);
      }

      mundo.add(steps3[i]);
    }
    //cuello1
    for (int i=1; i<steps.length; i++) {
      FDistanceJoint junta = new FDistanceJoint(steps[i-1], steps[i]);
      junta.setAnchor1(0, -15 );//height-20-(i-1)*50
      junta.setAnchor2(0, 15);// height-20-i*50
      junta.setFrequency(frequency);
      junta.setDamping(damping);      //Uniones
      junta.setFill(255, 0, 0);
      junta.calculateLength();
      
      junta.setDrawable(false);

      mundo.add(junta);

      FDistanceJoint junta2 = new FDistanceJoint(steps[4], enemigoCabeza3);
      junta2.setFrequency(frequency);
      junta2.setDamping(1.5); 
      junta2.setLength(50);
      //junta2.calculateLength();
      junta2.setAnchor1(10, -25 );//height-20-(i-1)*50
      junta2.setAnchor2(30, 25);// height-20-i*50
      junta2.setFill(0, 255, 0);
      junta2.setDrawable(false);
      mundo.add(junta2);
    }
    //cuello2
    for (int i=1; i<steps2.length; i++) {
      FDistanceJoint junta3 = new FDistanceJoint(steps2[i-1], steps2[i]);
      junta3.setAnchor1(0, -10 );//height-20-(i-1)*50
      junta3.setAnchor2(0, 15);// height-20-i*50
      junta3.setFrequency(frequency);
      junta3.setDamping(damping);      //Uniones
      junta3.setFill(255, 0, 0);
      //junta3.calculateLength();
      junta3.setLength(10);
      junta3.setDrawable(false);
      mundo.add(junta3);

      FDistanceJoint junta4 = new FDistanceJoint(steps2[3], enemigoCabeza2);
      junta4.setFrequency(frequency);
      junta4.setDamping(1.5); 
      junta4.setLength(20);
      //junta4.calculateLength();
      junta4.setAnchor1(0, -10 );//height-20-(i-1)*50
      junta4.setAnchor2(30, 15);// height-20-i*50
      junta4.setFill(0, 255, 0);
      junta4.setDrawable(false);
      mundo.add(junta4);
    }
    //CUELLO 3

    for (int i=1; i<steps3.length; i++) {
      FDistanceJoint junta5 = new FDistanceJoint(steps3[i-1], steps3[i]);
      junta5.setAnchor1(-15, 0 );//height-20-(i-1)*50
      junta5.setAnchor2(15, 0);// height-20-i*50
      junta5.setFrequency(frequency);
      junta5.setDamping(damping);      //Uniones
      junta5.setFill(255, 0, 0);
      junta5.setLength(10);
       junta5.setDrawable(false);
      
      mundo.add(junta5);

      FDistanceJoint junta6 = new FDistanceJoint(steps3[3], enemigoCabeza1);
      junta6.setFrequency(frequency);
      junta6.setDamping(1); 
      junta6.setLength(30);
      junta6.setAnchor1(-15, 0 );//height-20-(i-1)*50
      junta6.setAnchor2(20, 0 );// height-20-i*50
      junta6.setFill(0, 255, 0);
       junta6.setDrawable(false);
      mundo.add(junta6);
    }

  }
}
