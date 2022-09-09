#include <stdio.h>
#define INIT_VALUE -1
int allEvenDigits1(int num);
void allEvenDigits2(int num, int *result);
int main()
{
     int number, result = INIT_VALUE;
     printf("Enter a number: \n");
     scanf("%d", &number);
     printf("allEvenDigits1(): ");
     result = allEvenDigits1(number);
     if (result == 1)
        printf("All Even\n");
     else if (result == 0)
        printf("Not All Even\n");
     else
        printf("Error\n");
     allEvenDigits2(number, &result);
     printf("allEvenDigits2(): ");
     if (result == 1)
        printf("All Even\n");
     else if (result == 0)
        printf("Not All Even\n");
     else
        printf("Error\n");
     return 0;
}
int allEvenDigits1(int num)
{
    while(num>0){
        if((num%10)%2==1){
            return 0;
        }
        num/=10;
    }
    return 1;
}
void allEvenDigits2(int num, int *result)
{
    *result=1;
    while(num>0){
        if((num%10)%2==1){
            *result=0;
        }
        num/=10;
    }
}
