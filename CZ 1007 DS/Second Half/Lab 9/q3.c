#include <stdlib.h>
#include <stdio.h>
typedef struct node{
    int item;
    struct node *next;
} ListNode;
int searchList(ListNode *head, int value);
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
    printf("%d\n",temp->item);
    printf("Enter value to search for: ");
    int value;
    scanf("%d",&value);
    int index=searchList(head,value);
    if(index==-1)
        printf("Value not found!\n");
    else
        printf("Value %d found at index %d\n",value,index);
    return 0;
}
int searchList(ListNode *head, int value){
    ListNode *temp;
    temp=head;
    int i=0;
    while(temp->next!=NULL){
        if(temp->item==value)
            return i;
        temp=temp->next;
        i++;
    }
    if(temp->item==value)
        return i;
    return -1;
}
