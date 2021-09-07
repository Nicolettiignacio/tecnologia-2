class BolaDeFuego {

  FWorld mundo;
  Enemigo Enemigo;
  FBox rectangulo1;

  int ancho, alto;
  PImage bola1;
  float posRect1X = 680;
  float posRect1Y = 450;
  int tiempo = 1350;
  int tiempoOcurrido;

  BolaDeFuego(int ancho_, int alto_, FWorld mundo, Enemigo Enemigo) {

    ancho=ancho_;
    alto=alto_;
    this.mundo=mundo;
    this.Enemigo=Enemigo;
  }



  void dibujarB1() {

    if (enemigo.estadoC1 == 1) {
      FCircle bola = new FCircle (50);
      bola.setName("bola1"); 
      bola.setPosition(enemigo.px, enemigo.py);
      bola1=loadImage("bola.png");
      bola.attachImage(bola1);  
      bola.setGrabbable(true);
      bola.setVelocity(-1000, -100);
      bola1=loadImage("bola.png");
      tiempoOcurrido = millis();
      bola.setGrabbable(false);
      bola.setGroupIndex(-1);
      mundo.add(bola);

      FlamaMusica.play();
    }
  }

  void dibujarB2() {
    if (enemigo.estadoC2 == 1) {
      FCircle bola2 = new FCircle (50);
      bola2.setName("bola2"); 
      bola2.setPosition(enemigo.px2, enemigo.py2 );
      bola2.attachImage(bola1);  //imagen de la flecha
      bola2.setGrabbable(true);
      bola2.setVelocity(-1000, -100);
      tiempoOcurrido = millis();
      bola2.setGrabbable(false);
      bola2.setGroupIndex(-1);
      mundo.add(bola2);
      FlamaMusica.play();
    }
  }

  void dibujarB3() {
    if (enemigo.estadoC3 == 1) {
      FCircle bola3 = new FCircle (50);
      bola3.setName("bola3"); 
      bola3.setPosition(enemigo.px3, enemigo.py3);
      bola3.attachImage(bola1);  //imagen de la flecha
      bola3.setGrabbable(true);
      bola3.setVelocity(-1000, random(50, 150));
      tiempoOcurrido = millis();
      bola3.setGrabbable(false);
      bola3.setGroupIndex(-1);
      mundo.add(bola3);
      FlamaMusica.play();
    }
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
