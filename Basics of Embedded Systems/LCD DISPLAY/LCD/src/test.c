#include <Arduino.h>
#include <avr/io.h>
#include <util/delay.h>

#define LCD_PIND7 PD7
#define LCD_PIND6 PB0
#define LCD_PIND5 PB1
#define LCD_PIND4 PB2
#define ENABLE PB3
#define DATA_RS PB4   


void LCD_Command(unsigned char cmnd) {
  // Send upper nibble
  PORTB = (PORTB & 0x0F) | (cmnd & 0xF0); 
  PORTB &= ~ (1 << DATA_RS); 
  PORTB |= (1 << ENABLE); 
  _delay_us(1);
  PORTB &= ~ (1 << ENABLE); 

  _delay_us(200);

  // Send lower nibble
  PORTB = (PORTB & 0x0F) | (cmnd << 4); 
  PORTB |= (1 << ENABLE); 
  _delay_us(1);
  PORTB &= ~ (1 << ENABLE); 

  _delay_ms(2);
}

void LCD_Char(unsigned char data) {
  // Send upper nibble
  PORTB = (PORTB & 0x0F) | (data & 0xF0); 
  PORTB |= (1 << DATA_RS);
  PORTB |= (1 << ENABLE);
  _delay_us(1);
  PORTB &= ~ (1 << ENABLE); 

  _delay_us(200);

  // Send lower nibble
  PORTB = (PORTB & 0x0F) | (data << 4);
  PORTB |= (1 << ENABLE);
  _delay_us(1);
  PORTB &= ~ (1 << ENABLE); 

  _delay_ms(2);
}