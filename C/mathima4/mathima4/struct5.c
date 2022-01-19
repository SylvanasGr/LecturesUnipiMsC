#include <stdio.h>
#include <stdlib.h>

struct student{
    int am;
    char name[20];
    char surname[20];
};

int main5() {
    struct student *pts;
    pts = (struct student*)malloc(2*sizeof(struct student));
    /* (*(pts+0))    taftizetai me to s1*/
    /* (*(pts+0)). taftizetai me to (pts+0)->*/
    printf("1st Student\n");
    printf("Enter am:");
    scanf("%d",&(pts+0)->am);
    printf("Enter name:");
    scanf("%s",(pts+0)->name);
    printf("Enter surname:");
    scanf("%s",(pts+0)->surname);
    printf("2nd Student\n");
    printf("Enter am:");
    scanf("%d",&(pts+1)->am);
    printf("Enter name:");
    scanf("%s",(pts+1)->name);
    printf("Enter surname:");
    scanf("%s",(pts+1)->surname);
    printf("*****************************************************\n");
    printf("First Student: %s %s, with am:%d\n",(pts+0)->name,(pts+0)->surname,(pts+0)->am);
    printf("Second Student: %s %s, with am:%d\n",(pts+1)->name,(pts+1)->surname,(pts+1)->am);
    printf("*****************************************************\n");
    return 0;
}



