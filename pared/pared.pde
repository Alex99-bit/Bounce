
public class Wall{
  
  //public static Wall instance = new Wall();
  
  float x,y,ancho,largo;
  
  Wall(float x,float y, float ancho, float largo){
    /*if(instance == null){
      instance = this;
    }*/
    
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.largo = largo;
  }
  
  Wall(){}
  
  void Dibuja(){
    rect(x,y,ancho,largo);
  }
  
  void Dibuja(float x,float y, float ancho, float largo){
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.largo = largo;
    rect(x,y,ancho,largo);
  }
  
  void SetCoordXY(float x,float y){
    this.x = x;
    this.y = y;
  }
  
  float GetX(){
    return x;
  }
  
  float GetY(){
    return y;
  }
  
  void SetAncho(float ancho){
    this.ancho = ancho;
  }
  
  void SetLargo(float largo){
    this.largo = largo;
  }
  
  float GetAncho(){
    return ancho;
  }
  
  float GetLargo(){
    return largo;
  }
}


public class Ball{
  float velX, velY, radio, puntosVelX, puntosVelY;
  boolean chocaX, chocaY;
  float bordeX,bordeY;
  int frames;
  Wall pared = new Wall();
  
  Ball(float radio){
    this.radio = radio;
    chocaX = false;
    chocaY = false;
    puntosVelX = 2;
    puntosVelY = 2;
    frames = 0;
  }
  
  Ball(){
    chocaX = false;
    chocaY = false;
    puntosVelX = 2;
    puntosVelY = 2;
    frames = 0;
  }
  
  void AsignaVel(){
    frames++;
    pared.Dibuja(0,0/2,80,160);
    
    velX += puntosVelX;
    velY += puntosVelY;
    
    circle(velX, velY, radio);
    print("X:",velX);
    print("Y:",velY);
    
    // En caso de que choque con cualquier cosa, se desvia la pelota
    if(chocaX){
      puntosVelX = puntosVelX * (-1);
      chocaX = false;
    }
    
    if(chocaY){
      puntosVelY = puntosVelY * (-1);
      chocaY = false;
    }
    
    // Aqui se define cuando se concidera choque
    bordeX = GetRadio()/2 + velX + 1;
    bordeY = GetRadio()/2 + velY + 1;
    
    if((bordeX >= width/2 || bordeY <= 0 ) && frames >= 5){
      chocaX = true;
    }
    
    if((bordeY >= height/2 || bordeY <= 0) && frames >= 5){
      chocaY = true;
    }
    
    //para calcular si toca el borde del rectangulo puede ser con rangos
    if((bordeX > pared.GetX() && bordeX < pared.GetLargo()) && frames >= 5/*|| (bordeX >= pared.GetY() && bordeX <= pared.GetAncho())*/){
      chocaX = true;
      chocaY = true;
    }
    
    /*if((bordeY >= pared.GetY() && bordeY <= pared.GetAncho()) && frames >= 5){
      chocaY = true;
    }*/
    
    if(frames > 6){
      frames = 0;
    }
  }
  
  void SetRadio(float radio){
    this.radio = radio;
  }
  
  float GetRadio(){
    return radio;
  }
  
  void SetVel(float velX,float velY){
    this.velX = velX;
    this.velY = velY;
  }
}


Ball pelota = new Ball();

void setup(){
  size(800,800);
  translate(height/2, width/2);
  frameRate(120);
  pelota.SetRadio(45);
  pelota.SetVel(145,0);
}

void draw(){
  translate(height/2, width/2);
  background(0);
  pelota.AsignaVel();
}
