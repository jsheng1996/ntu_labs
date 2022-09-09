#include <stdio.h>
int main()
{
    float I,R,P;
    printf("Enter the current: \n");
    scanf("%f",&I);
    printf("Enter the resistance: \n");
    scanf("%f",&R);
    P=I*I*R;
    printf("Power loss in watts: %.2f",P);
    return 0;
}
