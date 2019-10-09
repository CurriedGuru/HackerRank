// Solves(with small modifications)
// https://www.hackerrank.com/challenges/insertionsort1
// https://www.hackerrank.com/challenges/insertionsort2
// https://www.hackerrank.com/challenges/correctness-invariant
// https://www.hackerrank.com/challenges/runningtime

#include<stdio.h>
#include<stdlib.h>

void print_array(int n, int *array)
{
    for (int i = 0; i < n; i++)
        printf("%d ", array[i]);
    printf("\n");
}

int insertion_sort(int n, int * array)
{
    int number_of_shifts = 0;
    for(int i = 1; i < n; i++)
    {
        int key = array[i];
        int j = i - 1;

        while (j >= 0 && array[j] > key)
        {
            array[j+1] = array[j];
            j = j - 1;
            number_of_shifts++;
            //print_array(n, array);
        }
        array[j+1] = key;
        //print_array(n, array);
    }
    return number_of_shifts;
}

int main(int argc, char * argv[])
{
    int n = 0, *array = NULL;

    scanf("%d", &n);

    array = (int*)malloc(n*sizeof(int));
 
    for (int i = 0; i < n; i++)
    {
        int temp;
        scanf("%d", &temp);
        array[i] = temp;
    }

    int number_of_shifts = insertion_sort(n, array);
    //printf("%d\n", number_of_shifts);
    print_array(n, array);
}
