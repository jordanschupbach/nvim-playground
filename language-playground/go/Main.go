package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	// Seed the random number generator
	rand.Seed(time.Now().UnixNano()) // Use current time as seed

	// Define the number of random floats you want
	n := 10 // You can change the size as needed

	// Create a slice to store random float64 numbers
	randomFloats := make([]float64, n)

	// Populate the slice with random floats
	for i := 0; i < n; i++ {
		randomFloats[i] = rand.Float64() // Random float between 0.0 and 1.0
	}

	// Print the slice of random float numbers
	fmt.Println("Random Floats:", randomFloats)
}
