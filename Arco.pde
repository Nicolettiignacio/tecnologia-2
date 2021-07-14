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


class Arco{
  
  FBox bala;
  
  Arco(float posX, float posY){
  pos_X = posX;
  pos_Y = posY;
  arco = loadImage("arco.png");
  flecha = loadImage("flecha2.png");
  tamX = 80; //tamaño del arco
  tamY = 80;
  angulo = radians(90);
  }
  
  
  void dibujar(){
  pushMatrix();
  translate(pos_X,pos_Y);
  rotate(angulo);
  image(arco,pos_X / 2, -pos_Y / 2,tamX,tamY);
  popMatrix();
  
  }
  
  void movimientoArco(){
    
      angulo = angulo -0.01;
      angulo = constrain( angulo , 
      radians(-30) , radians(50) );
    
      if(angulo == radians(-30)){
      angulo = radians(50);
      } 
  }
  
  void disparar(FWorld mundo){
    bala = new FBox (tamXBala,tamYBala );
    bala.setPosition(pos_X + 100 , pos_Y - 100 );
    bala.attachImage(flecha);  //imagen de la flecha
    float vx = velocidad * cos( angulo );
    float vy = velocidad * sin( angulo );
    bala.setGrabbable(false);
    bala.setVelocity( vx , vy );
    bala.setRestitution(1.5);
    bala.setName("bala1"); 
    tiempoOcurrido = millis();
 
    mundo.add(bala);
  }
  
  void eliminarBala(){    
 ArrayList <FBody> cuerpos = mundo.getBodies();

 for ( FBody este : cuerpos ) {
    String nombre = este.getName();
    if ( nombre != null ) {  
      if(nombre.equals("bala1")){ 
 if(millis() - tiempoOcurrido > tiempo){
 mundo.remove(este); 
 }
      }
    }
  }
  
}
  
  
}
