#include <stdio.h>
#include <string.h>
struct student{
 char name[20]; /* student name */
 double testScore; /* test score */
 double examScore; /* exam score */
 double total; /* total = (testScore+examScore)/2 */
};
double average();
int main()
{
 printf("average(): %.2f\n", average());
 return 0;
}

double average()
{
    struct student database[50];
    char studentName[80];
    int i=0;
    double testScore=0;
    double examScore=0;
    printf("Enter student name: \n");
    gets(studentName);
    for(i=0;strcmp(studentName,"END");i++){
        printf("Enter test score: \n");
        scanf("%lf",&testScore);
        printf("Enter exam score: \n");
        scanf("%lf",&examScore);
        strcpy(database[i].name,studentName);
        database[i].testScore=testScore;
        database[i].examScore=examScore;
        database[i].total=(database[i].testScore+database[i].examScore)/(double)2;
        printf("Student %s total = %.2lf \n",studentName,database[i].total);
        printf("Enter student name: \n");
        fflush(stdin);
        gets(studentName);
    }
    double sum=0;
    int j=0;
    for(j=0;j<i;j++){
        sum+=database[j].total;
    }
    return i!=0? sum/(double)i:0;
}
