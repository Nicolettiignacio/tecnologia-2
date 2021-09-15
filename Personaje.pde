class personaje {

  PImage salto, normal, cubierto;
  int W, H, posX, posY, estadoP, cant;
  int H2;
  int posSalto;

  personaje( int W_, int H_) {

    W=W_;
    H=H_;
    posX = 110;
    posY = 428;
    posSalto = 228;
    estadoP = 0;
  }

  void dibujarPersonaje(FWorld mundo) {

    FBox personaje = new FBox(W, H);
    personaje.setPosition(posX, posY);
    personaje.setName("personaje");
    normal =loadImage("normal1.png");
    personaje.setStatic(true);
    personaje.setGrabbable(false);
    personaje.attachImage(normal);
    mundo.add(personaje);
    estadoP=0;
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

    
    
     if (tuio.estadoPj==1){
   
      FBox personaje2 = new FBox(W, H);
      salto =loadImage("salto.png");
      personaje2.setPosition(posX, posSalto);
      personaje2.attachImage(salto);
      personaje2.setName("salto");
      personaje2.setGrabbable(false);
      personaje2.setRotatable(false);
      personaje2.setDensity(60);
      mundo.add(personaje2);
      eliminarNormal();
      eliminarCubrir();
      eliminarNormal1(); 
      eliminarSalto();
      estadoP=1;
    }

    if ( tuio.estadoPj==2) {
      FBox personaje3 = new FBox(W, H);
      cubierto =loadImage("cubrirse.png");
      personaje3.setPosition(posX, posY);
      personaje3.attachImage(cubierto);
      personaje3.setStatic(true);   
      personaje3.setName("cubierto");
      personaje3.setGrabbable(false);
      mundo.add(personaje3);
      eliminarNormal();
      eliminarSalto();
      eliminarNormal1();
      eliminarCubrir();
      estadoP=2;
    }


    if (tuio.estadoPj==0) {
      FBox personaje4 = new FBox(W, H);
      cubierto =loadImage("normal1.png");
      personaje4.setPosition(posX, posY);
      personaje4.attachImage(normal);
      personaje4.setStatic(true);   
      personaje4.setName("normal");
      personaje4.setGrabbable(false);
      mundo.add(personaje4);
      eliminarCubrir();
      eliminarSalto();
      eliminarNormal1();
      estadoP=0;
    }
  }
  
  void DibujarVidaPJ(){
   stroke(2);
    fill(255, 0, 0);
    rect(45, Yvida, restarVidaPersonaje, 10);

    fill(255, 0, 0, 0);
    stroke(2);
    rect(45, Yvida, 99, 10);

    if (p.estadoP==2) {
      Yvida=350;
    }
    if (p.estadoP==1) {
      Yvida=125;
    }

    if (p.estadoP==0) {
      Yvida=320;
    }
  
  
  }
  
}
