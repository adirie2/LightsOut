# LightsOut
LightsOut Implementation in VHDL

## Implementation Specifics

I thought it was very inefficient and decided to switch the 9 bit individual inputs into
full fledge vectors. This allowed me to find patterns and use the generate function to utilize less
LUTS and FF’s and make my code very trivial. In addition, I redesigned the ROM, instead of
four separate rom modules I designed a more efficient ROM that took in the 4 bits and output 16
bits. Then by using the generate function knowing which decoders as well as which 4 bits to map
out, I can use a simple pattern utilizing the for loop to slice my data. I show that line of code
here. I utilized an array of 4 long to hold the decoder outputs that are 9 bits each. To help
algorithmize

## Resource Utilization

For the resource utilization, I made sure to implement very efficient code. So the number of
LUT’s I used was 58 and the number of FF’s I used was 90
