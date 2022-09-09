#include <stdio.h>
#define INIT_VALUE 0
int extOddDigits1(int num);
void extOddDigits2(int num, int *result);
int main()
{
     int number, result = INIT_VALUE;

     printf("Enter a number: \n");
     scanf("%d", &number);
     printf("extOddDigits1(): %d\n", extOddDigits1(number));
     extOddDigits2(number, &result);
     printf("extOddDigits2(): %d\n", result);
     return 0;
}
int extOddDigits1(int num)
{
    int mult=1;
    int result=0;
    while(num>0){
        int digit=num%10;
        if(digit%2==1){
            result+=digit*mult;
            mult*=10;
        }
        num/=10;
    }
    if(result==0){
        return -1;
    }
    return result;

}
void extOddDigits2(int num, int *result)
{
    int mult=1;
    *result=0;
    while(num>0){
        int digit=num%10;
        if(digit%2==1){
            *result+=digit*mult;
            mult*=10;
        }
        num/=10;
    }
    if(*result==0){
        *result= -1;
    }
}
