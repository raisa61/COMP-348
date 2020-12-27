#include <stdio.h>
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

int main()
{
	int array[5] = {1, 5, 6, 4, -1};

	selectionsort_q11(array, 5, NULL);
	
	for(int i = 0; i < 5; i++)
		printf("%d", array[i]);
}