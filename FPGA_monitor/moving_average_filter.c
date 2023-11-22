#include <stdint.h>
#include <stdio.h>

//audio avalon interface
volatile uint32_t * const AUDIO_CONTROL = (uint32_t *) 0xFF203040;
volatile uint32_t * const AUDIO_FIFOSPACE = (uint32_t *) 0xFF203044;
volatile int16_t * const AUDIO_LEFTDATA = (uint32_t *) 0xFF203048;  //audio samples are signed
volatile int16_t * const AUDIO_RIGHTDATA = (uint32_t *) 0xFF20304C;

//switch interface
volatile uint32_t * const SW = (uint32_t *) 0xFF200040;

//custom instruction
#define CONVOL_CI(input1, input2) __builtin_custom_inii(0, (input1), (input2))

int main(){
    uint16_t sample_left, sample_right;

    // Clear both Read and Write FIFOs and then remove the clear bits
    *AUDIO_CONTROL = 0x0000000C; 
    *AUDIO_CONTROL = 0x00000000; 

    while(1){

        
        uint32_t fifo_space = *AUDIO_FIFOSPACE;

        // If there's data in the right read buffer and space in the write buffer
        if((fifo_space & 0x000000FF) > 64 && ((fifo_space & 0x00FF0000) >> 16) > 64){
            if(*SW && 0x00000001){
                *AUDIO_RIGHTDATA = CONVOL_CI(*AUDIO_RIGHTDATA, 0);
            }else{
                *AUDIO_RIGHTDATA = *AUDIO_RIGHTDATA;
            }
        }

        // If there's data in the left read buffer and space in the write buffer
        if(((fifo_space & 0x0000FF00) >> 8) > 64 && ((fifo_space & 0xFF000000) >> 24) > 64){ 
            *AUDIO_LEFTDATA = *AUDIO_LEFTDATA;
            //*AUDIO_LEFTDATA = CONVOL_CI(*AUDIO_LEFTDATA, 0);
        }
    }
}
