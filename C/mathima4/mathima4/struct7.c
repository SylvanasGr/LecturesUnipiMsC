//
// Created by Vasiliki on 19/1/2022.
//

#include <stdio.h>
#include <stdlib.h>
struct student{
    int am;
    char name[20];
    char surname[20];
};

int main7() {
    int user_choice=0;
    int i;
    struct student *pts;
    printf("Gia posous foitites na grapsw:",user_choice);
    scanf("%d",&user_choice);
    pts = (struct student*)malloc(user_choice*sizeof(struct student));
    for(i=0;i<user_choice;i++){
        printf("Student%d\n",i+1);
        printf("Enter am:");
        scanf("%d",&(pts+i)->am);
        printf("Enter name:");
        scanf("%s",(pts+i)->name);
        printf("Enter surname:");
        scanf("%s",(pts+i)->surname);
    }
    printf("*****************************************************\n");
    for(i=0;i<user_choice;i++) {
        printf("Student%d: %s %s, with am:%d\n", i+1, (pts + i)->name, (pts + i)->surname, (pts + i)->am);
    }
    printf("*****************************************************\n");
    return 0;
}



