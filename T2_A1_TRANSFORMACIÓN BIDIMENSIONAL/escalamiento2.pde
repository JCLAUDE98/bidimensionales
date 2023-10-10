float centerX; // Posición en el centro del eje X
float centerY; // Posición en el centro del eje Y
float scaleX = 1.0; // Factor de escala en el eje X
float scaleY = 1.0; // Factor de escala en el eje Y
color rectColor; // Variable para almacenar el color del rectángulo
int startTime; // Tiempo de inicio del cambio de escala
int duration = 10000; // Duración de 10 segundos en milisegundos (10000 ms)
boolean growing = true; // Estado inicial: crecimiento

void setup() {
  size(400, 400);
  centerX = width / 2; // Calcula el centro en el eje X
  centerY = height / 2; // Calcula el centro en el eje Y
  rectColor = color(random(255), random(255), random(255)); // Color inicial aleatorio
  background(0); // Fondo oscuro
  startTime = millis(); // Registra el tiempo de inicio
}

void draw() {
  // Calcula el tiempo transcurrido desde el inicio
  int elapsedTime = millis() - startTime;

  // Cambia el color del rectángulo constantemente
  rectColor = color(random(255), random(255), random(255));

  // Determina si el rectángulo debe crecer o encojer
  if (growing) {
    // Si está creciendo
    if (elapsedTime <= duration) {
      // Dibuja el rectángulo creciendo
      float growthFactor = map(elapsedTime, 0, duration, 1, 2); // Escala de 1 a 2 en 10 segundos
      fill(rectColor);
      rect(centerX - 25 * scaleX, centerY - 15 * scaleY, 50 * scaleX * growthFactor, 30 * scaleY * growthFactor);
    } else {
      // Cambia al estado de encojimiento
      growing = false;
      startTime = millis();
    }
  } else {
    // Si está encojiendo
    if (elapsedTime <= duration) {
      // Dibuja el rectángulo encojiendo
      float shrinkFactor = map(elapsedTime, 0, duration, 2, 1); // Escala de 2 a 1 en 10 segundos
      fill(rectColor);
      rect(centerX - 25 * scaleX, centerY - 15 * scaleY, 50 * scaleX * shrinkFactor, 30 * scaleY * shrinkFactor);
    } else {
      // Cambia al estado de crecimiento
      growing = true;
      startTime = millis();
    }
  }

  // Espera un breve periodo para ralentizar el cambio de color
  delay(100);
}
