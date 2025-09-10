#include <Arduino.h>
#include <avr/io.h>
#include <util/delay.h>

void lcd_command(unsigned char cmd)
void lcd_data(unsigned char data)
void lcd_init()
void lcd_print(char *str)


#define DATA_PIN7 PD7
#define DATA_PIN6 PB0
#define DATA_PIN5 PB1
#define DATA_PIN4 PB2
#define ENABLE PB3
#define DATA_RS PB4

void lcd_command(unsigned char cmd)
{
    PORTB&=~(1<<DATA_RS); //set RS=0 for command

    PORTB= (PORTB & 0xF0) | ((cmd>>4) & 0x0F);   //send higher nibble

    if(cmd & 0x10)
    {
        PORTB |=(1<<DATA_PIN4);
    }
    else 
    {
        PORTB &= ~(1<<DATA_PIN4);
    }
    if(cmd & 0x20)PORTB |=(1<<DATA_PIN5); else PORTB &=`(1<<DATA_PIN5);
    if(cmd & 0x40)PORTB |=(1<<DATA_PIN6); else PORTB &=`(1<<DATA_PIN6);
    if(cmd & 0x80)PORTB |=(1<<DATA_PIN7); else PORTB &=`(1<<DATA_PIN7);
    lcd_data();
     
    if(cmd & 0x01)PORTB |=(1<<DATA_PIN4); else PORTB &=`(1<<DATA_PIN4);
    if(cmd & 0x02)PORTB |=(1<<DATA_PIN5); else PORTB &=`(1<<DATA_PIN5);
    if(cmd & 0x04)PORTB |=(1<<DATA_PIN6); else PORTB &=`(1<<DATA_PIN6);
    if(cmd & 0x08)PORTB |=(1<<DATA_PIN7); else PORTB &=`(1<<DATA_PIN7);
    lcd_data();
}
void lcd_data(unsigned char data)
{

}
void lcd_init()
{
    _delay_ms(200);       //wait for LCD power on
    lcd_command(0x02);    //4-bit mode
    lcd_command(0x28);    //2 line 5x7
    lcd_command(0x0C);    //display on,cursor off
    lcd_command(0x06);    //Increment cursor
    lcd_command(0x01);    //clear screen
    _delay_ms(200);
}
void lcd_print(char *str)
{

}

void main()
{
     DDRB=(0xFF);
     DDRD|=(1<<DATA_PIN7);

     lcd_init();

}