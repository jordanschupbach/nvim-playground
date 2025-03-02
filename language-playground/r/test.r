# Simple test to determine if R lsp is working

print("Hello, World!")

tmc::dark_mode()
plot(runif(100, 0, 1), runif(100, 0, 1), pch = 20, xlab = "x", ylab = "y")

# myfunction function
#
# What's your malfunction function??
myfunction <- function() {
  print("Hello world")
}

myfunction()

