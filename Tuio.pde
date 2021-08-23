class Tuio {

  int estadoPj=0;

  Tuio() {

    //inicializamos la libreria

    noStroke();
    fill(255);
    ellipseMode(CENTER);
    //creamos una fuente
    //font = createFont("Arial", 20);
    //textFont(font);
  }

  void ejecutarTuio() {

    //creamos un arraylit de objetos Tuio y con el método .getTuioObjectList()
    // le cargamos los objetos que esté mandando reactivision 
    ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
    //recorremos el arreglo a traves de un for, cuyo tamaño depende del 
    //largo del arreglo empleando tuioObjectList.size()
    for (int i=0; i<tuioObjectList.size (); i++) {
      //en cada ciclo del for creamos un objeto auxiliar de tipo TuioObject y 
      //con get(i) el cargamos el objeto del arreglo
      TuioObject patron = tuioObjectList.get(i);
      stroke(0);
      fill(255);
      pushMatrix();
      //hacemos un translate segun la ubicacion el objeto
      translate(patron.getScreenX(width), patron.getScreenY(height));
      ellipse(0, 0, 50, 50);
      popMatrix();
      fill(255, 0, 0);
      //dibujamos el texto segun las coordenadas del patron
      text(""+patron.getSymbolID(), patron.getScreenX(width), patron.getScreenY(height));

      println(estadoPj);

      //SALTO

      if (patron.getScreenY(height)<200) {
        estadoPj=1;
      } 
      //Cubrirse
      if (patron.getScreenY(height)>500) {
        estadoPj=2;
      }
      if ((patron.getScreenY(height)<500) && (patron.getScreenY(height)>200)) {
        estadoPj=0;
      }
      if ((patron.getScreenX(width)<200)) {
        estadoPj=3;
      }






      /* if (patron.getScreenY(height)<200) {
       estadoPj="salto";
       if (patron.getScreenY(height)>500) {
       estadoPj="cubrirse";
       } }else {
       estadoPj="normal";
       }*/
    }
  }
}
