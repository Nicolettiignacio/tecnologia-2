float pos_X;
float pos_Y;
float tamX, tamY;
PImage arco;
PImage flecha;
float angulo;
float anguloVel = 0.5;
float tamXBala = 70;
float tamYBala = 30;
float velocidad = 800; //VELOCIDAD DE LA BALA
int tiempo = 2250;
int tiempoOcurrido;
float dir = 0.01;

int disparoFlecha=0;

int tiempoDisparo=0;
boolean Taprobado=true;


class Arco {


  FBox bala;

  Arco(float posX, float posY) {
    pos_X = posX; //50
    pos_Y = posY; //450
    arco = loadImage("arco2.png");
    flecha = loadImage("flecha4.png");
    tamX = 80; //tamaño del arco
    tamY = 80;
    angulo = radians(90);
  }


  void dibujar() {
    pushMatrix();
    translate(pos_X, pos_Y);
    rotate(angulo);

    if(p.estadoP==0){
    image(arco, -25, -30, tamX, tamY);
    }
    strokeWeight(5);
    //line(0, 0, 50, 0);
    strokeWeight(1);
    popMatrix();
  }

  void movimientoArco() {

    angulo = angulo -dir;
    angulo = constrain( angulo, 
      radians(-40), radians(30) ); 
    if (angulo == radians(-40)) {
      dir = dir * -1;
    }
    if (angulo == radians(30)) {
      dir = dir * -1;
    }
  }


  void disparar(FWorld mundo) {
    if (Taprobado==true) {

      bala = new FBox (tamXBala, tamYBala );         

      bala.setPosition(pos_X, pos_Y);
      bala.setRotation(angulo);

      bala.attachImage(flecha);  
      float vx = velocidad * cos( angulo );
      float vy = velocidad * sin( angulo );
      bala.setGrabbable(false);
      bala.setVelocity( vx, vy );
      bala.setRestitution(0.5);
      bala.setName("bala1"); 
      tiempoOcurrido = millis();
      bala.setGroupIndex(-1);
      mundo.add(bala);
      Taprobado=false;

      FlechaMusica.play();
    }

    if (tiempoDisparo==0)/*180)*/ {//3 Segundos
      Taprobado=true;
      tiempoDisparo=0;
    } else {  
      tiempoDisparo=tiempoDisparo+1;
    }
  }

  void eliminarBala() {    
    ArrayList <FBody> cuerpos = mundo.getBodies();

    for ( FBody este : cuerpos ) {
      String nombre = este.getName();
      if ( nombre != null ) {  
        if (nombre.equals("bala1")) { 
          if (millis() - tiempoOcurrido > tiempo) {
            mundo.remove(este);
          }
        }
      }
    }
  }
}
