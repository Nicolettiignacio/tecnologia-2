class Limite {


  FBox rectangulo1, rectangulo2, rectangulo3, rectangulo4;
  FBox rectangulo5, rectangulo6, rectangulo7, rectangulo8;

  float posRect1X = 680;
  float posRect1Y = 450;
  float posRect2X = 800;
  float posRect2Y = 400;
  float posRect3X = 750;
  float posRect3Y = 550;
  float posRect4X = 850;
  float posRect4Y = 480;

  void dibujarRects() {

    rectangulo1 = new FBox(20, 150);
    rectangulo1.setPosition(posRect1X, posRect1Y);
    rectangulo1.setDrawable(false);
    rectangulo1.setStatic(true);
    rectangulo1.setGrabbable(false);
    rectangulo1.setGroupIndex(-1);
    mundo.add(rectangulo1); 

    rectangulo2 = new FBox(400, 20);
    rectangulo2.setPosition(posRect2X, posRect2Y);
    rectangulo2.setDrawable(false);
    rectangulo2.setStatic(true);
    rectangulo2.setGrabbable(false);
    rectangulo2.setGroupIndex(-1);
    mundo.add(rectangulo2); 

    rectangulo3 = new FBox(350, 20);
    rectangulo3.setPosition(posRect3X, posRect3Y);
    rectangulo3.setDrawable(false);
    rectangulo3.setStatic(true);
    rectangulo3.setGrabbable(false);
    rectangulo3.setGroupIndex(-1);
    mundo.add(rectangulo3); 

    rectangulo4 = new FBox(20, 150);
    rectangulo4.setPosition(posRect4X, posRect4Y);
    rectangulo4.setDrawable(false);
    rectangulo4.setStatic(true);
    rectangulo4.setGrabbable(false);
    rectangulo4.setGroupIndex(-1);
    mundo.add(rectangulo4);


    rectangulo5 = new FBox(20, 150);
    rectangulo5.setPosition(750, 300);
    rectangulo5.setDrawable(false);
    rectangulo5.setStatic(true);
    rectangulo5.setGrabbable(false);
    rectangulo5.setGroupIndex(-1);
    mundo.add(rectangulo5); 

    rectangulo6 = new FBox(440, 20);
    rectangulo6.setPosition(950, 240);
    rectangulo6.setDrawable(false);
    rectangulo6.setStatic(true);
    rectangulo6.setGrabbable(false);
    rectangulo6.setGroupIndex(-1);
    mundo.add(rectangulo6); 

    rectangulo7 = new FBox(20, 350);
    rectangulo7.setPosition(1000, 200);
    rectangulo7.setDrawable(false);
    rectangulo7.setStatic(true);
    rectangulo7.setGrabbable(false);
    rectangulo7.setGroupIndex(-1);
    mundo.add(rectangulo7);

    rectangulo8 = new FBox(20, 350);
    rectangulo8.setPosition(1150, 200);
    rectangulo8.setDrawable(false);
    rectangulo8.setStatic(true);
    rectangulo8.setGrabbable(false);
    rectangulo8.setGroupIndex(-1);
    mundo.add(rectangulo8);
  }
}
