class BolaDeFuego {

  FWorld mundo;
  Enemigo Enemigo;

  int ancho, alto;
  PImage bola1;

  int tiempo = 2250;
  int tiempoOcurrido;

  BolaDeFuego(int ancho_, int alto_, FWorld mundo, Enemigo Enemigo) {

    ancho=ancho_;
    alto=alto_;
    this.mundo=mundo;
    this.Enemigo=Enemigo;
  }



  void dibujarB1() {

    FCircle bola = new FCircle (50);
    bola.setName("bola1"); 
    bola.setPosition(750, 400 );
    bola1=loadImage("bola.png");
    bola.attachImage(bola1);  //imagen de la flecha
    bola.setGrabbable(true);
    bola.setVelocity(-1000, -100);
    bola1=loadImage("bola.png");
    tiempoOcurrido = millis();
    mundo.add(bola);
  }

  void dibujarB2() {
    FCircle bola2 = new FCircle (50);
    bola2.setName("bola2"); 
    bola2.setPosition(750+150, 200 );
    bola2.attachImage(bola1);  //imagen de la flecha
    bola2.setGrabbable(true);
    bola2.setVelocity(-1000, -100);
    tiempoOcurrido = millis();

    mundo.add(bola2);
  }
  void dibujarB3() {
    FCircle bola3 = new FCircle (50);
    bola3.setName("bola3"); 
    bola3.setPosition(750+300, 200 );
    bola3.attachImage(bola1);  //imagen de la flecha
    bola3.setGrabbable(true);
    bola3.setVelocity(-1000, -100);
    tiempoOcurrido = millis();
    mundo.add(bola3);
  }

  void obtenerPosX() {
  }

  void eliminarBola() {    
    ArrayList <FBody> cuerpos = mundo.getBodies();

    for ( FBody este : cuerpos ) {
      String nombre = este.getName();
      if ( nombre != null ) {  
        if (nombre.equals("bola1")) { 
          if (millis() - tiempoOcurrido > tiempo) {
            mundo.remove(este);
          }
        }
        if (nombre.equals("bola2")) { 
          if (millis() - tiempoOcurrido > tiempo) {
            mundo.remove(este);
          }
        }
        if (nombre.equals("bola3")) { 
          if (millis() - tiempoOcurrido > tiempo) {
            mundo.remove(este);
          }
        }
      }
    }
  }
}
