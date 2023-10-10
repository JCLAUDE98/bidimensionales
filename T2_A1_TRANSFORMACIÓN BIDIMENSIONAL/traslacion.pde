float x = 100; // Posición inicial en x
float y = 200; // Posición inicial en y
float diametro = 50; // Diámetro del círculo
float velocidadX = 2; // Velocidad horizontal
float velocidadY = 1.5; // Velocidad vertical
color objetoColor;

void setup() {
  size(400, 400);
  objetoColor = color(random(255), random(255), random(255));
  background(0);
}

void draw() {
  background(0); // Fondo negro
  
  // Dibuja el círculo
  fill(objetoColor);
  noStroke();
  ellipse(x, y, diametro, diametro);
  
  // Actualiza la posición
  x += velocidadX;
  y += velocidadY;
  
  // Colisión con los bordes del fondo
  if (x < 0 || x > width) {
    velocidadX *= -1; // Cambia la dirección en x
    objetoColor = color(random(255), random(255), random(255)); // Cambia el color
  }
  if (y < 0 || y > height) {
    velocidadY *= -1; // Cambia la dirección en y
    objetoColor = color(random(255), random(255), random(255)); // Cambia el color
  }
}
