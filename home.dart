import 'dart:io';

class Car{
  String? name;
  String? color;
  int? year;
  double? price;

  // Constructor
  Car({this.name, this.color, this.year, this.price});

  void displayInfo() {
    print("Car Name: $name");
    print("Car Color: $color");
    print("Car Year: $year");
    print("Car Price: \$${price?.toStringAsFixed(2)}");
  }
}

int? x1;
void main() {
  Car car1 = Car()
    ..name = "Toyota"
    ..color = "Red"
    ..year = 2020
    ..price = 20000.0
 ..displayInfo();
  print("-----------------");
  Car car2 = Car()
    ..name = "Honda"
    ..color = "Blue"
    ..year = 2021
    ..price = 22000.0
  ..displayInfo();

  x1= 20;
//   int age = 15;
//   int x = 20;
//   int y = 5;
//   int salary = 1000;
//   double round = 5.6;
//   double make = 5.9;
//   double make2 = 5.2;
//   String name = "Jhon";
//   print("My name is $name $age years old \n");
//   print("The total of $x and $y is ${x + y} \n");
//   print("The total of $x * $y is ${x * y} \n");
//   print("The total of $x / $y is ${x / y} \n");
//   print("Salary is $salary\$ \n");
//   print("Round of ${round.round()} \n");
//   print("Make $make of ${make.floor()} \n");
//   print("Make $make2 of ${make2.ceil()} \n");
//   print("conver $y to double ${y.toDouble()} \n");
//
// /////// Even OR Odd //////////
//
//   int e = 8;
//   if (e % 2 == 0)
//     print("Even");
//   else
//     print("Odd");
//
// /////// postive OR negative //////////
//
//   int num = 6;
//   if (num > 0)
//     print("postive");
//   else if (num == 0)
//     print("zero");
//   else
//     print("negative");
//
// /////// Grade //////////
//   int grade = 85;
//   if (grade > 90)
//     print("A");
//   else if (grade > 80)
//     print("B");
//   else if (grade > 70)
//     print("C");
//   else if (grade > 60)
//     print("D");
//   else
//     print("F");
//
// /////// Calcs //////////
//
//   print("Please Enter Num 1");
//   int w = int.parse(stdin.readLineSync()!);
//   print("Please Enter Num 2");
//   double r = double.parse(stdin.readLineSync()!);
//   print("Please Enter Opeartor");
//   String oper = stdin.readLineSync()!;
//   double result = 0;
//
//   if (oper == '+')
//     result = w + r;
//   // print("${w + r}");
//   else if (oper == '-')
//     result = w - r;
//   // print("${w - r}");
//   else if (oper == '/')
//     result = w / r;
//   // print("${w / r}");
//   else if (oper == '*')
//     result = w * r;
//   // print("${w + r}");
//   else
//     result = w % r;
//   // print("${w % r}");
//
//   print(result);

  // print("Please Enter the number of hours worked:");
  // int hours = int.parse(stdin.readLineSync()!);
  // int result = 0;
  // bool iswe = false;
  // const int forfirstThreeHours = 10;
  // const int forNextThreeHours = 20;
  //
  // if (hours > 2) {
  //   int chargeForFirstThreeHours = hours - 2;
  //   if (chargeForFirstThreeHours <= 3) {
  //     result = chargeForFirstThreeHours * forfirstThreeHours;
  //   }
  //   else {
  //     result = forfirstThreeHours * 3;
  //     result += (chargeForFirstThreeHours - 3) * forNextThreeHours;
  //   }
  // }
  // if (iswe) {
  //   result += 50;
  // }
  // print("The total is $result\$");
  //

// if(hours<=2){
//   result=0;
// }else if(hours<=5){
//   result=(hours-2)*10;
// }else if(hours>=6 || hours<=100)
//   result=(3*10)+(hours-5)*20;
// else{
//   result=hours*50;
// }

//
//   print("Please Enter the speed limit:");
//   int speedLimit = int.parse(stdin.readLineSync()!);
// // int speedActual=int.parse(stdin.readLineSync()!);
//   print("Do you have a license? (true/false)");
//   bool hasLicense = bool.parse(stdin.readLineSync()!);
//   int speed= 0;
// if((speedLimit>0 && speedLimit<20) && hasLicense) {
//   speed=0;
// }
// else if(speedLimit>20) {
//   speed = 1000;
// }
// else if(speedLimit>10 && speedLimit<=20){
//   speed=500;
// }
//
// else{
//   speed=0;
// }

  // if (speedLimit > 0 && speedLimit < 10)
  //   print("OK");
  // else {
  //   if (speedLimit > 20)
  //     speed = 1000;
  //   else if (speedLimit > 10 && speedLimit <= 20)
  //     speed = 500;
  //   if (hasLicense == false)
  //     speed += 500;
  // }
  // print(speed);


  // print("Please Enter the number of nights:");
  // int night=int.parse(stdin.readLineSync()!);
  // print("Is it a holiday session? (true/false)");
  // bool holidaySession = bool.parse(stdin.readLineSync()!);
  // const double base = 200.0;
  // double total = night * base;
  // if (night > 3 && holidaySession) {
  //   total *= 0.9;
  //   total *=  1.15;
  // } else if (night > 3) {
  //   total *= 0.9;
  // } else if (holidaySession) {
  //   total *= 1.25;
  // }
  // print(total);

//   for (int i = 0; i <=10; i++) {
//     print( "i is $i");
//   }
//   print("-----------------");
//   for (int i = 10; i >0; i--) {
//     print( "i is $i");
//   }
//   print("-----------------");
//   for( int i = 0; i <= 10; i+=2) {
//     print("i is $i");
//
//   }
//   print("-----------------");
//   for( int i = 1; i <= 10; i+=2) {
//     print("i is $i");
//
//   }
//   print("----------------- Counting -----------------");
//   for (int i = 0; i <= 10; i++) {
//     for(int j = 0; j <= 10; j++) {
//       print("i is $i, j is $j");
//     }
//   }
//   print("----------------- Multiplication Table -----------------");
//
//   multiplicationTable();
//
//   print("----------------- While Loop -----------------");
//   int i = 0;
//   while(i<=10) {
//     print("i is $i");
//     i++;
//   }
//   print("----------------- Do While Loop -----------------");
//   int j = 0;
//   do {
//     print("j is $j");
//     j++;
//   } while(j <= 10);
//
//   print("----------------- While Loop with Multiplication Table -----------------");
//   int h = 0,
//       k = 0;
//   while(h<12){
//     while(k<12){
//       print("h is $h,   k is $k,   h*k is  $h * $k  ${h*k}");
//       k++;
//     }
//     h++;
//     k = 0; // Reset k for the next iteration of h
//   }
//   print("----------------- Do While Loop with Multiplication Table -----------------");
//   int w = 0,
//       z = 0;
//   while(w<12) {
//     do {
//       print("w is $w,   z is $z,   w*z is  $w * $z  ${w*z}");
//       z++;
//     } while(z<12);
//     w++;
//     z = 0; // Reset z for the next iteration of w
//   }
//
//   // int cc = calc(10, 30);
//   print("The result of calc is ${calc(10, 30)}");
// }
//
// void multiplicationTable() {
//   for (int i = 0; i <= 12; i++) {
//     for(int j = 0; j <= 12; j++) {
//      print("i is $i,   j is $j,   i*j is  $j * $i  ${i*j}");
//     }
//     print("----------------- ----------------- -----------------");
//   }
}
int calc(int x, int y) => x + y;

