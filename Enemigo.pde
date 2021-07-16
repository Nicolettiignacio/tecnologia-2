class Enemigo {

  FWorld mundo;
  BolaDeFuego bola; 

  PImage hidra, cabeza1, cabeza2, cabeza3;
  float tamX;
  float tamY;
  float tamC1 = 70;
  float px=750;


  Enemigo(float tam_X, float tam_Y, FWorld mundo, BolaDeFuego bola) {

    this.mundo = mundo;
    this.bola = bola;

    tamX = tam_X;
    tamY = tam_Y;
  }

  void cuerpo() {

    FBox cuerpoEnemigo = new FBox(tamX, tamY);
    cuerpoEnemigo.setName("enemigoCuerpo");
    
    cuerpoEnemigo.setPosition(950, 500);
    cuerpoEnemigo.setStatic(true);
    cuerpoEnemigo.setGrabbable(false);
    hidra=loadImage("hidra2n.png");
    cuerpoEnemigo.attachImage(hidra);
    mundo.add(cuerpoEnemigo);
  }

  void dibujarCabeza1() {

    FCircle enemigoCabeza1 = new FCircle(tamC1);
    enemigoCabeza1.setPosition(px, 400);
    enemigoCabeza1.setName("enemigoCabeza1");
    cabeza1=loadImage("cabeza.png");
    enemigoCabeza1.attachImage(cabeza1);
    enemigoCabeza1.setStatic(true);

    mundo.add(enemigoCabeza1);
  }


  void dibujarCabeza2() {

    FCircle enemigoCabeza2 = new FCircle(tamC1);
     enemigoCabeza2.setName("enemigoCabeza2");
    enemigoCabeza2.setPosition(px+150, 200);
    cabeza2=loadImage("cabeza2.png");
    enemigoCabeza2.attachImage(cabeza2);
    enemigoCabeza2.setStatic(true);
  
    mundo.add(enemigoCabeza2);
  }


  void dibujarCabeza3() {

    FCircle enemigoCabeza3 = new FCircle(tamC1);
    enemigoCabeza3.setName("enemigoCabeza3");
    enemigoCabeza3.setPosition(px+300, 200);
    cabeza3=loadImage("cabeza3.png");
    enemigoCabeza3.attachImage(cabeza3);
    enemigoCabeza3.setStatic(true);
    mundo.add(enemigoCabeza3);
  }









  /*void MoverCabeza() {
   
   ArrayList <FBody> cuerpos = mundo.getBodies();
   for ( FBody este : cuerpos ) {
   String nombre = este.getName();
   if ( nombre != null ) {
   if ( nombre.equals("enemigoCabeza1") ) {
   enemigoCabeza1.setRotation(radians(angulo));
   
   angulo = angulo -0.01;
   angulo = constrain( angulo, 
   radians(-30), radians(50) );
   
   if (angulo == radians(-30)) {
   angulo = radians(50);
   }
   }
   }
   }
   }*/





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
