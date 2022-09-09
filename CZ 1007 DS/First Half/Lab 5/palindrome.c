#include <stdio.h>
#define INIT_VALUE -1
int palindrome(char *str);
int main()
{
    char str[80];
    int result = INIT_VALUE;

    printf("Enter a string: \n");
    gets(str);
    result = palindrome(str);
    if (result == 1)
        printf("palindrome(): A palindrome\n");
    else if (result == 0)
        printf("palindrome(): Not a palindrome\n");
    else
        printf("An error\n");
    return 0;
}
int palindrome(char *str)
{
    int i=0;
    char *rev;
    while(*str!='\0'){
        str++;
        i++; //gets length of string
    }
    rev=str-1;
    str-=i;
    while(str<rev){
        if(*str!=*rev)
            return 0;
        str++;
        rev--;
    }
    return 1;
}
