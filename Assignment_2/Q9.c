#include <stdio.h>

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
    int array[5] = {4, 3, 1, 7, 11};

    int min = findmin(array, 5, 0);

    printf("Address of min is %p", &min);
    printf("\n");
    printf("Value of min is %d", min);
}
