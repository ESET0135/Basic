#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN     PB0
#define BUTTON_PIN  PB1

typedef enum { MODE1, MODE2, MODE3 } Mode;

int main(void) {
    // Set LED_PIN as output, BUTTON_PIN as input
    DDRB |= (1 << LED_PIN);
    DDRB &= ~(1 << BUTTON_PIN);
    PORTB |= (1 << BUTTON_PIN); // Enable pull-up resistor

    Mode mode = MODE1;
    uint8_t lastButtonState = 1;
    uint8_t debounceDelay = 50;

    while (1) {
        // Button press detection (active low)
        uint8_t buttonState = (PINB & (1 << BUTTON_PIN)) == 0;
        if (buttonState && lastButtonState == 0) {
            // Button released, do nothing
        } else if (buttonState && lastButtonState == 1) {
            // Button pressed
            _delay_ms(debounceDelay);
            if ((PINB & (1 << BUTTON_PIN)) == 0) {
                // Cycle mode
                mode = (Mode)((mode + 1) % 3);
                while ((PINB & (1 << BUTTON_PIN)) == 0); // Wait for release
                _delay_ms(debounceDelay);
            }
        }
        lastButtonState = buttonState;

        // LED control based on mode
        switch (mode) {
            case MODE1: // Slow blink
                PORTB ^= (1 << LED_PIN);
                _delay_ms(500);
                break;
            case MODE2: // Fast blink
                PORTB ^= (1 << LED_PIN);
                _delay_ms(100);
                break;
            /
        }
    }
}