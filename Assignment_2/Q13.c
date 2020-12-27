#include <stdio.h>

struct Node {
    char *str[255];
    struct Node* next;
};
struct Node *head = NULL;
int main()
{
   char input[1000000] = "";
   char word[255] = "";
   int previ = 0;
   int i = 0;
   int j = 0;
   int k = 0;
   printf("Enter new strings:\n");
   gets(input);
   while(strcmp(input, ".") != 0)
    {
        while(i < strlen(input))
        {
            if(strlen(input == 1)){
                //strcat(input, " ");
            }
            if(isspace(input[i]) || iscntrl(input[i]))
            {
                j = previ;
                k = 0;
                memset(word,0,strlen(word));
                while(j < i){
                    word[k] = input[j];
                    k++;
                    j++;
			    }
                previ = i + 1;
                insert_dictionary_order(word);
		    }
            i++;
	    }
	    j = previ;
        k = 0;
        memset(word,0,strlen(word));
        while(j < i){
            word[k] = input[j];
            k++;
            j++;
	    }
	    insert_dictionary_order(word);
        i = 0;
        previ = 0;
        gets(input);
    };
   print_list();
   return 0;
}


void insert_dictionary_order(char *word)
{ 
    struct Node *new = (struct Node*) malloc(sizeof(struct Node));
    struct Node *current = head;
    struct Node *prev = NULL;
    strcpy(new->str, word);
    new->next = NULL;

    if(current == NULL){
        head = new;
    }
    else 
    {
        while(current != NULL){
            if(strcmp(current->str, word) > 0){
                break;
            }
            prev = current;
            current = current -> next;
            
        }
        if(prev == NULL){
            new->next = head;
            head = new;
        }
        else {
            new->next = prev -> next; 
            prev->next = new;
        }
    }
}


void print_list()
{
    struct Node *current = head;
    while(current != NULL){
        printf(strcat(current->str, " "));
        current = current -> next;
    }
}