

class personaje {

  PImage salto, normal, cubierto;
  int W, H, posX, posY, estado, cant;
  int H2;

  personaje( int W_, int H_) {

    W=W_;
    H=H_;
    posX = 110;
    posY = 428;
    estado = 0;
  }

  void dibujarPersonaje(FWorld mundo) {

    FBox personaje = new FBox(W, H);
    personaje.setPosition(posX, posY);
    personaje.setName("personaje");
    normal =loadImage("normal1.png");
    personaje.setStatic(true);
    personaje.attachImage(normal);
    mundo.add(personaje);
  }
  
  


  void eliminarNormal() {
    ArrayList <FBody> cuerpos = mundo.getBodies();
    for ( FBody este : cuerpos ) {
      String nombre = este.getName();
      if ( nombre != null ) {
        if ( nombre.equals("personaje") ) {
          mundo.remove( este );
        }
      }
    }
  }
  void eliminarSalto() {
    ArrayList <FBody> cuerpos = mundo.getBodies();
    for ( FBody este : cuerpos ) {
      String nombre = este.getName();
      if ( nombre != null ) {
        if ( nombre.equals("salto") ) {
          mundo.remove( este );
        }
      }
    }
  }
  void eliminarCubrir() {
    ArrayList <FBody> cuerpos = mundo.getBodies();
    for ( FBody este : cuerpos ) {
      String nombre = este.getName();
      if ( nombre != null ) {
        if ( nombre.equals("cubierto") ) {
          mundo.remove( este );
        }
      }
    }
  }
  
    void eliminarNormal1() {
    ArrayList <FBody> cuerpos = mundo.getBodies();
    for ( FBody este : cuerpos ) {
      String nombre = este.getName();
      if ( nombre != null ) {
        if ( nombre.equals("normal") ) {
          mundo.remove( este );
        }
      }
    }
  }


  void acciones() {
    
    if ( key=='w') {
      FBox personaje2 = new FBox(W, H);
      salto =loadImage("salto.png");
      personaje2.setPosition(posX, posY-200);
      personaje2.attachImage(salto);
      personaje2.setName("salto");
      mundo.add(personaje2);
      eliminarNormal();
      eliminarCubrir();
      eliminarNormal1(); 
      eliminarSalto();
    }

    if ( key=='s') {
      FBox personaje3 = new FBox(W, H);
      cubierto =loadImage("cubrirse.png");
      personaje3.setPosition(posX, posY);
      personaje3.attachImage(cubierto);
      personaje3.setStatic(true);   
      personaje3.setName("cubierto");
      mundo.add(personaje3);
      eliminarNormal();
      eliminarSalto();
      eliminarNormal1();
      eliminarCubrir();
    }
  

  if ( key=='d') {
    FBox personaje4 = new FBox(W, H);
    cubierto =loadImage("normal1.png");
    personaje4.setPosition(posX, posY);
    personaje4.attachImage(normal);
    personaje4.setStatic(true);   
    personaje4.setName("normal");
    mundo.add(personaje4);
    eliminarCubrir();
    eliminarSalto();
    eliminarNormal1();
  }


  }
}
