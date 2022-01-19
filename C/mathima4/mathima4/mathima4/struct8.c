#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct student{
    int am;
    char name[20];
    char surname[20];
    struct student *next;
};
struct student *head;

void add(int am, char name[20], char surname[20]){
    struct student *pts;
    pts= malloc(sizeof(struct student));
    pts->am = am;
    strcpy(pts->name,name);
    strcpy(pts->surname,surname);
    if(head==NULL){
        pts->next = NULL;
        head = pts;
    } else{
        pts->next = head;
        head = pts;
    }
}

void readAll(){
    struct student *temp;
    temp=head;
    if(temp==NULL){
        return;
    }
    printf("*****************************************************\n");
    while (temp!=NULL){
        printf("Student: %s %s, with am:%d\n", temp->name, temp->surname, temp->am);
        temp=temp->next;
    }
    printf("*****************************************************\n");
}

int main(){
    int i,AM;
    char stname[20],stsurname[20];
    while(1){
        printf("1.Add Student\n");
        printf("2.Display Students\n");
        printf("3.Exit\n");
        printf("Enter your choice:");
        scanf("%d",&i);
        if(i==1){
            printf("Enter the student's AM:");
            scanf("%d",&AM);
            printf("Enter the student's name:");
            scanf("%s",stname);
            printf("Enter the student's surname:");
            scanf("%s",stsurname);
            add(AM,stname,stsurname);
        }
        else if (i==2){
            readAll();
        }
        else if (i==3){
            return 0;
        }
    }
    return 0;
}