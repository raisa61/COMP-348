#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include "selectionsort.h"

void selectionsort_q11(int* arr, int size, int (*find)(int*, int, int))
{
    if(find == NULL)
        find = &findmin;

    for(int i = 0; i < size; i++)
    {
        int min = find(arr, size, i);

        for(int j = i+1; j < size; j++)
            if(min == *(arr+j))
            {
                *(arr+j) = *(arr+i);
                *(arr+i) = min;
            }
    }
}

int *findmin(int *arr, int size, int bound)
{
    int *currentMin = &arr[bound];

    for(int i = bound+1; i < size; i++)
        if(arr[i] < *currentMin)
            currentMin = &arr[i];

    return *currentMin;
}

int *findmax(int *arr, int size, int bound)
{
    int *currentMax = &arr[bound];

    for(int i = bound+1; i < size; i++)
        if(arr[i] > *currentMax)
            currentMax = &arr[i];

    return *currentMax;
}

float findaverage(int *arr, int size)
{
    int sum = 0;

    for(int i = 0; i < size; i++)
        sum += arr[i];

    return sum/size;
}

float findSD(int *arr, int size)
{
    float average = findaverage(arr, size);
    float sum = 0;

    for(int i = 0; i < size; i++)
        sum += (arr[i] - average)*(arr[i] - average);
    
    return sqrt(sum/size);
}

int main()
{
    int limit;
    printf("How many numbers would you like to enter? ");

    while(true)
    {
        scanf("%d", &limit);

        if(limit < 1)
        {
            printf("Please insert a number above 0");
            printf("\n");
        }
        if(limit >= 1)
            break;
    }
    
    int *array = malloc(limit*sizeof(int));

    printf("Please enter your numbers now: ");
    
    for(int i = 0; i < limit; i++)
        scanf("%d", &array[i]);

    selectionsort_q11(array, limit, NULL);

    printf("The numbers you entered sorted in ascending sequence are:");
    printf("\n");

    for(int i = 0; i < limit; i++)
    {
        printf("%d: %d ", i+1, array[i]);
        printf("\n");
    }   

    selectionsort_q11(array, limit, findmax);

    printf("The numbers you entered sorted in descending sequence are:");
    printf("\n");

    for(int i = 0; i < limit; i++)
    {
        printf("%d: %d ", i+1, array[i]);
        printf("\n");
    }   

    int min = findmin(array, limit, 0);

    printf("The minimum number you entered was: %d", min);
    printf("\n");

    int max = findmax(array, limit, 0);

    printf("The maximum number you entered was: %d", max);
    printf("\n");

    printf("The average of the numbers you entered was: %.4f", findaverage(array, limit));
    printf("\n");

    printf("The population standard deviation of the numbers you entered was: %.4f", findSD(array, limit));
    printf("\n");
    printf("Thank you good bye");
    printf("\n");
    free(array);
}