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
    pos_X = posX;
    pos_Y = posY;
    arco = loadImage("arco.png");
    flecha = loadImage("flecha4.png");
    tamX = 80; //tamaño del arco
    tamY = 80;
    angulo = radians(90);
  }


  void dibujar() {
    pushMatrix();
    translate(pos_X, pos_Y);
    rotate(angulo);
    image(arco, pos_X / 2, -pos_Y / 2, tamX, tamY);
    popMatrix();
  }

  void movimientoArco() {

    angulo = angulo -dir;
    angulo = constrain( angulo, 
      radians(-30), radians(50) );
    if (angulo == radians(-30)) {
      dir = dir * -1;
    }
    if (angulo == radians(50)) {
      dir = dir * -1;
    }
  }


  void disparar(FWorld mundo) {
    if (Taprobado==true) {
     //  float flecha1 = angulo.get(angulo);
      
      bala = new FBox (tamXBala, tamYBala );
      bala.setPosition(pos_X + 150, pos_Y-200   );
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
