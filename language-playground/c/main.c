#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main() { srand(time(NULL));
  int size = 8;
  float array[size];
  for (int i = 0; i < size; i++) {
    array[i] = (float)rand() / RAND_MAX;
  }
  printf("Array of random floats between 0 and 1:\n");
  for (int i = 0; i < size; i++) {
    printf("%f, ", array[i]);
  }
  printf("\n");

  return 0;
}
