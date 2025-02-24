
#include <iostream>
#include <memory>
#include <vector>
#include <chrono>

int main() {
  std::cout << "Hello, World!" << std::endl;
  auto data = std::make_unique<std::vector<double>>(10);
  return 0;
}
