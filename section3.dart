void main(){
  // declare a list of numbers
  // int maximumValue = numbers[0];
  // loop through the list
  // if the number is greater than the maximum value, update the maximum value
  // print the maximum value
  // print("The maximum value is $maximumValue");
  // List <int> numbers = [1, 2, 80, 4, 5];
  // int maximumValue = numbers[0];
  // for(int i =1; i<numbers.length; i++) {
  //   if(numbers[i] > maximumValue) {
  //     maximumValue = numbers[i];
  //
  //   }
  // }
  // print("The maximum value is $maximumValue");
  //
  //
  // // reverse the list
  // // print the reversed list
  // print("----------------- Reversing the List -----------------");
  //
  // List<int> reversedNumbers = [1, 2, 80, 4, 5];
  //
  // for(int i = reversedNumbers.length - 1; i >= 0; i--) {
  //   int temp = reversedNumbers[i];
  //   reversedNumbers[i] = reversedNumbers[reversedNumbers.length - 1 - i];
  //   reversedNumbers[reversedNumbers.length - 1 - i] = temp;
  //
  // }
  // print("The reversed list is ${reversedNumbers.reversed}");

  Map<String, List<int>> M2 = {
    "Ali": [70, 90, 55],
    "Ahmed": [60, 75, 95],
    "Mohamed": [63, 87, 99]
  };
  // Average of a Map of numbers
  Map<String,double> Average = {};
  M2.forEach((String key, List<int> value) {
    double  average = (value.reduce((a, b) => a + b) / value.length);
    Average[key] = average;
    print("The average of  the $key  average ${average.toStringAsFixed(2)}");

  });

  // if value is greater than 80, add it to the average2 map

  Map<String, Map<String,dynamic>> Average2 = {};
  // Average.forEach((String key, double value) {
  //   if (value > 80) {
  //     Average2[key] = value;
  //   }
  //   print("The average of  the $key  average ${value.toStringAsFixed(2)}");
  // });




}

