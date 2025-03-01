#include <iostream>
#include <memory>
#include <vector>

int main() {

  std::cout << "Hello, World!" << std::endl;
  auto data = std::make_unique<std::vector<double>>();
	data->push_back(1.0);
	data->push_back(2.0);
	data->push_back(3.0);
	data->push_back(4.0);
	for (auto& d : *data) {
		std::cout << d << std::endl;
	}
  return 0;
}
