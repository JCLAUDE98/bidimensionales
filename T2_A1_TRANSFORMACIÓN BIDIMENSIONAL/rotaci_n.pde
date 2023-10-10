float angulo = 0; // Ángulo inicial de rotación
PVector[] vertices; // Arreglo de vértices del triángulo
color objetoColor;
int ultimoCambioColor = millis(); // Tiempo del último cambio de color
float anguloLocal = 0; // Ángulo de rotación local del triángulo

void setup() {
  size(400, 400);
  objetoColor = color(random(255), random(255), random(255));
  background(0);
  
  // Define los vértices del triángulo centrado en la ventana
  vertices = new PVector[3];
  float radio = 100; // Radio del triángulo
  for (int i = 0; i < 3; i++) {
    float angulo = TWO_PI / 3 * i;
    float x = cos(angulo) * radio + width / 2;
    float y = sin(angulo) * radio + height / 2;
    vertices[i] = new PVector(x, y);
  }
}

void draw() {
  background(0); // Fondo negro
  
  anguloLocal += radians(1); // Incrementa el ángulo de rotación local
  
  // Aplica la rotación local al triángulo
  for (int i = 0; i < 3; i++) {
    float x = vertices[i].x - width / 2;
    float y = vertices[i].y - height / 2;
    float xNueva = x * cos(anguloLocal) - y * sin(anguloLocal);
    float yNueva = x * sin(anguloLocal) + y * cos(anguloLocal);
    vertices[i] = new PVector(xNueva + width / 2, yNueva + height / 2);
  }
  
  fill(objetoColor); // Establece el color de relleno del objeto
  stroke(255); // Color del borde
  strokeWeight(2); // Grosor del borde
  
  // Dibuja el triángulo
  beginShape();
  for (PVector v : vertices) {
    vertex(v.x, v.y);
  }
  endShape(CLOSE);
  
  // Cambia de color cada segundo
  if (millis() - ultimoCambioColor >= 1000) {
    objetoColor = color(random(255), random(255), random(255));
    ultimoCambioColor = millis();
  }
}
