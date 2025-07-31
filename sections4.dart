import 'dart:convert';

class User {
  String name;
  int age;
  String email;

  User(this.name, this.age, this.email);

  void PrintDetails() {
    print( 'User{name: $name, age: $age, email: $email}');
  }
}

class Book {
  String title;
  String? author;
  int? year;
  int price;
  double discount=0;


  Book(this.title, this.author, this.year, this.price, this.discount) {
    try{
      assert(price<100, ' Price must be greater than or equal to 100');
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  // Costructor with named parameters
  Book.namedCostructor({required this.title, this.author, this.year, required this.price}) {

    // if (price== 0)
      // Discount 100%
      // price = 0;
      discount = 100;
      price = 0;


  }

  double discountedPrice() {
      return price - (price * discount / 100);

  }


  void PrintDetailsBook() {
    print('Book{title: $title, author: $author, year: $year , price: $price, discount: ${discountedPrice()}}');
  }
}

class Student {
  int? age;
  String? name;
  String? grades;


  // //
  // Student(this.name, this._grades,this.age){
  //   // if (!RegExp(r'^[A-F]$').hasMatch(_grade)) {
  //   //   throw ArgumentError('Grade must be a letter from A to F');
  //   // }
  //   if (_grades!= 'A' && _grades != 'B' && _grades != 'C') {
  //     throw ArgumentError('Grade must be a letter from A to F');
  //   }
  // }
  // // Getter and Setter for grade
  // String get grade => _grades;
  // void set grade(String value) {
  //   // Validate the grade value
  //   _grades = value;
  // }
  void PrintDetailsStudent() {
    print('Student{name: $name, grade:}');
  }


  Student.fromJson(Map<String, dynamic> json)
  {
    name = json['name'];
    age = json['age'];
    grades = json['grades'];
    
  }




}


void main(){
  // // User user1 = User("Mohamed", 27, "dteam308@gmail.com")
  // //   ..PrintDetails();
  // Book book1=Book("Dart Programming", "Google", 2023, 50, 10)..PrintDetailsBook();
  //
  //
  //
  // try{
  //   Book book2 = Book("Flutter Development", "Google", 2023, 150, 20)
  //     ..PrintDetailsBook();
  // } catch (e) {
  //   print('Error: ${e.toString()}');
  // }

  Map<String, dynamic> packageInfo = {
    'name': 'Ali',
    'grades': 'A',
    'age': 20
  };
  // Convert the Map to a Student object
  // Student student = Student("Ali", "A", 20)..PrintDetailsStudent();

 Student student= Student.fromJson(packageInfo);
 print(student);

  // Book book3 = Book.namedCostructor(title: "title", price:100, author: "author", year: 2023)
  //   ..PrintDetailsBook();
  // Student student1 = (Student("Ali", "C")..PrintDetailsStudent());
}

