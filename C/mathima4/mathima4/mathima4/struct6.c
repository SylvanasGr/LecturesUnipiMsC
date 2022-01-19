#include <stdio.h>
#include <stdlib.h>

struct student{
    int am;
    char name[20];
    char surname[20];
};

int main6() {
    int i;
    struct student *pts;
    pts = (struct student*)malloc(2*sizeof(struct student));
    for(i=0;i<2;i++){
        printf("Student%d\n",i+1);
        printf("Enter am:");
        scanf("%d",&(pts+i)->am);
        printf("Enter name:");
        scanf("%s",(pts+i)->name);
        printf("Enter surname:");
        scanf("%s",(pts+i)->surname);
    }
    printf("*****************************************************\n");
    for(i=0;i<2;i++) {
        printf("Student%d: %s %s, with am:%d\n", i+1, (pts + i)->name, (pts + i)->surname, (pts + i)->am);
    }
    printf("*****************************************************\n");
    return 0;
}



