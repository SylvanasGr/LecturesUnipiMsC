#include <stdio.h>

//Εξάσκηση στα Arrays:
//
//One Array Tasks:
//- Ποιο ειναι το max στοιχειο πίνακα;
//- Ποιο ειναι το δεύτερο μεγαλύτερο max του πίνακα;
//- Το max στοιχείο ενός πίνακα σε ποιες θέσεις υπάρχει;
//- Ποιο ειναι το min στοιχείο πίνακα;
//- Ποιο είναι το δεύτερο min στοιχείο του πίνακα;
//- Το min στοιχειο ενός πίνακα σε ποιες θέσεις υπάρχει;
//- Εύρεση στοιχείου στον πίνακα (αν υπάρχει).
//- Πόσες φορές υπάρχει ένα στοιχείο στον πίνακα;
//
//Two Array Tasks:
//- Μεταξυ 2 πινάκων ποιο είναι το max στοιχείο;
//- Μεταξυ 2 πινάκων ποιο είναι το min στοιχείο;
//- Ποια στοιχεία του ενός πίνακα υπάρχουν στον άλλον;
//- Πόσα στοιχεία του ενός πίνακα υπάρχουν στον άλλον;
typedef int max;
int findMax(int *a,int max,int len);
int findMaxSecondBigger(int *a,int max,int firstMax,int len);
int findMaxThirdBigger(int *a,int max,int firstMax,int secondMax,int len);
int findMaxOfTwoArray(int *a,int *b,int max,int len);
void findEqualsDataOfBothArrays(int *a,int *b,int len);
int main() {
    int position1,position2,position3;
    int count =0;
    int a[] = {1, 65, 100, 123, 343, 58,1500,458};
    int b[] = {1000, 25, 35, 1, 67, 58,50,100};
    int max = a[0];
    int len = sizeof(a)/sizeof(a[0]);
    int maxFirst = findMax(a,max,len);
    int maxSecond = findMaxSecondBigger(a,max,maxFirst,len);
    int maxThird = findMaxThirdBigger(a,max,maxFirst,maxSecond,len);
    int maxOfTwoArrays = findMaxOfTwoArray(a,b,max,len);

    for (int i =0;i<len;i++){
        if(a[i]==100){
            count++;
        }
        if(a[i]==maxFirst){
            position1=i;
        }
        if(a[i]==maxSecond){
            position2=i;
        }
        if(a[i]==maxThird){
            position3=i;
        }
    }
    printf("The first max is %d %d\n",maxFirst,position1);
    printf("The second max is %d %d\n",maxSecond,position2);
    printf("The third max is %d %d\n",maxThird,position3);
    printf("count for 100 is total of %d\n",count);
    printf("max of both array's  %d\n",maxOfTwoArrays);
    findEqualsDataOfBothArrays(a,b,len);

    return 0;
}

int findMax(int *a,int max,int len){
    for (int i =0;i<len;i++){
        if(a[i]>max){
            max = a[i];
        }
    }
    return max;
}

int findMaxSecondBigger(int *a,int max,int firstMax,int len){
    for (int i =0;i<len;i++){
        if(a[i]==firstMax){
            continue;
        }
        if(max < a[i]){
            max = a[i];
        }
    }
    return max;
}

int findMaxThirdBigger(int *a,int max,int firstMax,int secondMax,int len){
    for (int i =0;i<len;i++){
        if(a[i]==firstMax || a[i]==secondMax){
            continue;
        }
        if(max < a[i]){
            max = a[i];
        }
    }
    return max;
}

int findMaxOfTwoArray(int *a,int *b,int max,int len){
    for(int i =0;i<len;i++){
        if (a[i]>max){
            max = a[i];
        }
    }
    for(int i =0;i<len;i++){
        if (b[i]>max){
            max = b[i];
        }
    }
    return max;
};

void findEqualsDataOfBothArrays(int *a,int *b,int len){
    for(int i =0;i<len;i++) {
        for(int j =0;j<len;j++)
            if (a[i] == b[j]) {
                printf("equal data: %d\n",a[i]);
            }
    }
};