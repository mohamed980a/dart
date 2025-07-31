import 'section4.dart';

main(){

  Dog dog = Dog('Labrador', 'Buddy', 3, 'Brown');
  dog.MakeSound();
  dog.display();
  print('-------------------');
  bird bird1 = bird(true, 'Tweety', 2, 'Yellow');
  bird1.MakeSound();
  bird1.display();
  print('-------------------');
}