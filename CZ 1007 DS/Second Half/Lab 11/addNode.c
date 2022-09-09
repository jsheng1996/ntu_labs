int insertNode(LinkedList *ll, int index, int value){

	ListNode *pre, *cur;

	if (ll == NULL || index < 0 || index > ll->size + 1)
		return -1;

	// If empty list or inserting first node, need to update head pointer
	if(ll->head==NULL){
        ll->head=malloc(sizeof(ListNode));
        ll->head->item=value;
        ll->head->next=NULL;
        ll->size++;
        ll->tail=ll->head;
        return 0;
	}
    else {
        if(index==0||index==ll->size){
            if (index == 0){
                cur = ll->head;
                ll->head = malloc(sizeof(ListNode));
                ll->head->item = value;
                ll->head->next = cur;
                ll->size++;
                return 0;
            }
            else {
                cur=ll->tail;
                cur->next=value;
                cur->next->next=NULL;
                ll->tail=cur->next;
                ll->size++;
                return 0;
            }
        } else {
            pre=findNode(ll,index-1);
            cur=findNode(ll,index);
            pre->next=malloc(sizeof(ListNode));
            pre->next->item=value;
            pre->next->next=cur;
            ll->size++;
            return 0;
        }
    }

	return -1;
}
