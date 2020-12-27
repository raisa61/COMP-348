#ifndef SELECTIONSORT_H_
#define SELECTIONSORT_H_

#define SIZE_ARRAY 5

void selectionsort_q10(int* arr, int size);

void selectionsort_q11(int* arr, int size, int (*find)(int*, int, int));

int *findmin(int* arr, int size, int bound);

#endif // !SELECTIONSORT_H_