#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN PD7 // Pin 7 on PORTD
#define BUTTON_PIN PD3 // Pin 2 on PORTD

int main(void) {
    // Set LED_PIN as output
    DDRD |= (1 << LED_PIN);

    DDRD &= ~(1 << BUTTON_PIN);
    // Enable pull-up resistor on BUTTON_PIN
    PORTD |= (1 << BUTTON_PIN);


    while (1) {
        // Check if button is pressed (active low)
        if (!(PIND & (1 << BUTTON_PIN))) {
            // Turn the LED on
            PORTD |= (1 << LED_PIN);
        } else {
            // Turn the LED off
            PORTD &= ~(1 << LED_PIN);
        }
        // Small delay for debouncing
        _delay_ms(20);
    }


    return 0; // This line will never be reached
}