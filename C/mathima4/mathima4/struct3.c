#include <stdio.h>

struct student{
    int am;
    char name[20];
    char surname[20];
};

int main3() {
    struct student s1, s2;
    struct student *pts1,*pts2;
    pts1 = &s1;
    pts2 = &s2;
    /* (*pts1)    taftizetai me to s1*/
    /* (*pts1). taftizetai me to pts1->*/
    printf("1st Student\n");
    printf("Enter am:");
    scanf("%d",&pts1->am);
    printf("Enter name:");
    scanf("%s",pts1->name);
    printf("Enter surname:");
    scanf("%s",pts1->surname);
    printf("2nd Student\n");
    printf("Enter am:");
    scanf("%d",&pts2->am);
    printf("Enter name:");
    scanf("%s",pts2->name);
    printf("Enter surname:");
    scanf("%s",pts2->surname);
    printf("*****************************************************\n");
    printf("First Student: %s %s, with am:%d\n",pts1->name,pts1->surname,pts1->am);
    printf("Second Student: %s %s, with am:%d\n",pts2->name,pts2->surname,pts2->am);
    printf("*****************************************************\n");
    return 0;
}



