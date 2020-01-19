#include <string.h>

//#define INT

int pin, time, D_out, N_B;
float S, T_C, T_K, V_out, V_FR;

void setup() {
	Serial.begin(9600);	// setup Serial
	pin = A0;	// set the pin to read data
	time = 1000;	// set how much time the sensor must execute the measurement of the temperature
	S = 10 * pow(10, -3);
	N_B = 10;
	#ifdef INT
		V_FR = 1.1;
		analogReference(INTERNAL);	// set the type of alimentation
	#else
		V_FR = 5;
	#endif
}
void loop(){
	D_out = analogRead(pin);	// read data from the pin
	T_K = D_out * V_FR / pow(2, N_B) * 1 / S;
	T_C = T_K - 273.15;
	V_out = D_out * V_FR / pow(2, N_B);
	Serial.println("D_out: " + String(D_out) + " -- V_out: " + String(V_out) + " V -- T: " + String(T_K) + " K -- T: " + String(T_C) + " %*\color{red} \textdegree*)C");
	delay(time);
}
