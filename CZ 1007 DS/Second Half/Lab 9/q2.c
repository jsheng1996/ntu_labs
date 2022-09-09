#include <stdlib.h>
#include <stdio.h>
typedef struct node{
    int item;
    struct node *next;
} ListNode;
int main(){
    ListNode *head,*temp;
    head=NULL;
    printf("Enter a list of numbers, terminated by the value -1:\n");
    int n;
    scanf("%d",&n);
    while(n!=-1){
        if(head==NULL){
             head=malloc(sizeof(ListNode));
             temp=head;
        }else {
            temp->next=malloc(sizeof(ListNode));
            temp=temp->next;
        }
        temp->item=n;
        scanf("%d",&n);
    }
    temp->next=NULL;
    printf("Current list: ");
    temp=head;
    while(temp->next!=NULL){
        printf("%d ",temp->item);
        temp=temp->next;
    }
    printf("%d",temp->item);
    return 0;
}
