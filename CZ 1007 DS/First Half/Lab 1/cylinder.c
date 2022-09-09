#include <stdio.h>
#define pi 3.1416
int main()
{
    float r,h,sa,v;
    printf("Input radius:");
    scanf("%f",&r);
    printf("Input height:");
    scanf("%f",&h);
    v=pi*r*r*h;
    sa=2*pi*r*h+2*pi*r*r;
    printf("Volume of cylinder is %.2f \nSurface area of cylinder is %.2f",v,sa);
    return 0;
}
