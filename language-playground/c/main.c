#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {

  // Seed the random number generator
  srand(time(NULL));

  // The size of the array
  int size = 8;

  // Initialize the array
  float array[size];

  // Fill the array with random floats between 0 and 1
  for (int i = 0; i < size; i++) {
    array[i] = (float)rand() / RAND_MAX;
  }

  // Print the array
  printf("Here's an array of random floats between 0 and 1:\n");
  for (int i = 0; i < size; i++) {
    printf("%f, ", array[i]);
  }
  printf("\n");

  return 0;
}

