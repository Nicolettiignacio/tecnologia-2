class Enemigo {
  PImage hidra;
  float tamX;
  float tamY;
  float tamC1 = 70;
  float angulo=90;
  float px=750;


  Enemigo(float tam_X, float tam_Y) {
    tamX = tam_X;
    tamY = tam_Y;
  }

  void cuerpo() {

    FBox enemigo = new FBox(tamX, tamY);
    enemigo.setPosition(950, 500);
    enemigo.setStatic(true);
    enemigo.setName("enemigoCuerpo");
    enemigo.setFill(255, 0, 0);
    enemigo.setGrabbable(false);
    hidra=loadImage("hidra2n.png");
    enemigo.attachImage(hidra);
    mundo.add(enemigo);
  }

  void dibujarCabeza1() {

    FCircle enemigoCabeza1 = new FCircle(tamC1);
    enemigoCabeza1.setPosition(px, 400);
    
    enemigoCabeza1.setName("enemigoCabeza1");
    enemigoCabeza1.setFill(255, 0, 0);
    // enemigoCabeza1.setGrabbable(false);
    hidra=loadImage("cabeza.png");
    enemigoCabeza1.attachImage(hidra);
     
   
    mundo.add(enemigoCabeza1);
  }
  
  
  
  
  
  void MoverCabeza() {
    ArrayList <FBody> cuerpos = mundo.getBodies();
    for ( FBody este : cuerpos ) {
      String nombre = este.getName();
      if ( nombre != null ) {
        if ( nombre.equals("enemigoCabeza1") ) {
          rotate(angulo);

          angulo = angulo -0.01;
          angulo = constrain( angulo, 
          radians(-30), radians(50) );

          if (angulo == radians(-30)) {
            angulo = radians(50);
          }
        }
      }
    }





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
