#!/usr/bin/env dart

void main() {
  int threshold = 1000;
  int limit = 20000000;
  List<double> input = [19.0, 0.0, 1000, 1001.5, 20000, 25000000.0];
  List<double> output = compute(threshold, limit, input);
  print(output);
}

List<double> compute(int threshold, int limit, List<double> input) {
  double sum = 0;
  for (var i = 0; i < input.length; i++) {
    double cur = input[i];
    double over = cur - threshold;
    if (over <= 0) {
      input[i] = 0;
    } else {
      double over2 = sum + over - limit;
      if (over2 <= 0) {
        input[i] = over;
      } else {
        input[i] = limit - sum;
      }
    }
    sum += input[i];
  }
  return [...input, sum];
}
