#include <string.h>

//#define INT

int D_out, N_B, pin, R_2, R_3, sleepTime;
float S, T_C, T_K, V_out, V_FR;

void setup() {
  Serial.begin(9600); // setup Serial
  pin = A0; // set the pin to read data
  sleepTime = 2000;  // set how much time the sensor must execute the measurement of the temperature
  S = 10 * pow(10, -3);
  N_B = 10;
  R_2 = 1 * pow(10, 3);
  R_3 = 3.8 * pow(10, 3);
#ifdef INT
  V_FR = 1.1;
  analogReference(INTERNAL);  // set the type of alimentation
#else
  V_FR = 4.85;
#endif
}
void loop() {
  D_out = analogRead(pin);  // read data from the pin
  T_K = D_out * V_FR / pow(2, N_B) * 1 / S;
  V_out = D_out * V_FR / pow(2, N_B);
#ifdef INT
  T_K = T_K * (1 + R_2 / R_3);
  V_out = V_out * (1 + R_2 / R_3);
#endif
  T_C = T_K - 273.15;
  Serial.println("D_out: " + String(D_out) + " -- V_out: " + String(V_out) + " V -- T: " + String(T_K) + " K -- T: " + String(T_C) + " °C");
  delay(sleepTime);
}
