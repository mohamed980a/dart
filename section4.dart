class Wood{
  String? type;
  double? density; // in g/cm^3
  double? moistureContent; // in percentage

  Wood._inter();
  static Wood wood = Wood._inter();

  factory Wood() {
    return wood;
  }


}

class Animal {
  String? name;
  int? age;
  String? Color;
  String? sound;

  Animal(this.name, this.age,this.Color, this.sound);

  void MakeSound() {
    print('$name makes a sound: $sound') ;

  }

  void display() {
    print('Animal Name: $name, Age: $age');
  }
}

class Dog extends Animal {
  String? type;
  Dog(this.type,String name, int age, String Color) : super(name, age, Color, "Woof!");



  @override
  void display() {
    print("This is a Dog of type $type");
    super.display();
  }
}

class bird extends Animal {
  bool? canFly;
  bird(this.canFly, String name, int age, String Color) : super(name, age, Color, "Chirp!");


  @override
  void display() {
    print("This is a Bird of species $canFly");
    super.display();
  }
}