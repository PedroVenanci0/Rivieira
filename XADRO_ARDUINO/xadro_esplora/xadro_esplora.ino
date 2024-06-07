#include <Esplora.h>

void setup() {
  Serial.begin(9600);

}

void loop() {
  int tiltx = -(Esplora.readAccelerometer(X_AXIS)-8);
  int tilty = Esplora.readAccelerometer(Y_AXIS)-132;
  int b1 = -Esplora.readButton(SWITCH_1) +1;
  int b4 = -Esplora.readButton(SWITCH_4) +1;

  Serial.print("tx");
  Serial.print(":");
  Serial.print(tiltx);
  Serial.print("#");
  Serial.print("ty");
  Serial.print(":");
  Serial.print(tilty);
  Serial.print("#");
  Serial.print("b1");
  Serial.print(":");
  Serial.print(b1);
  Serial.print("#");
  Serial.print("b4");
  Serial.print(":");
  Serial.print(b4);
  Serial.print("]");

  delay(200);
}
