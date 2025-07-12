import 'dart:io';

void main() {
  int age = 15;
  int x = 20;
  int y = 5;
  int salary = 1000;
  double round = 5.6;
  double make = 5.9;
  double make2 = 5.2;
  String name = "Jhon";
  print("My name is $name $age years old \n");
  print("The total of $x and $y is ${x + y} \n");
  print("The total of $x * $y is ${x * y} \n");
  print("The total of $x / $y is ${x / y} \n");
  print("Salary is $salary\$ \n");
  print("Round of ${round.round()} \n");
  print("Make $make of ${make.floor()} \n");
  print("Make $make2 of ${make2.ceil()} \n");
  print("conver $y to double ${y.toDouble()} \n");

/////// Even OR Odd //////////

  int e = 8;
  if (e % 2 == 0)
    print("Even");
  else
    print("Odd");

/////// postive OR negative //////////

  int num = 6;
  if (num > 0)
    print("postive");
  else if (num == 0)
    print("zero");
  else
    print("negative");

/////// Grade //////////
  int grade = 85;
  if (grade > 90)
    print("A");
  else if (grade > 80)
    print("B");
  else if (grade > 70)
    print("C");
  else if (grade > 60)
    print("D");
  else
    print("F");

/////// Calcs //////////

  print("Please Enter Num 1");
  int w = int.parse(stdin.readLineSync()!);
  print("Please Enter Num 2");
  double r = double.parse(stdin.readLineSync()!);
  print("Please Enter Opeartor");
  String oper = stdin.readLineSync()!;
  double result = 0;

  if (oper == '+')
    result = w + r;
  // print("${w + r}");
  else if (oper == '-')
    result = w - r;
  // print("${w - r}");
  else if (oper == '/')
    result = w / r;
  // print("${w / r}");
  else if (oper == '*')
    result = w * r;
  // print("${w + r}");
  else
    result = w % r;
  // print("${w % r}");

  print(result);
}

// int calc(int x, int y) {
//   return x + y;
// }
