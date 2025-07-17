
import 'dart:io';

int product1Id = 1;
String product1Name = 'Keyboard';
double product1Price = 100.0;

int product2Id = 2;
String product2Name = 'Mouse';
double product2Price = 50.0;

int product3Id = 3;
String product3Name = 'Monitor';
double product3Price = 300.0;

int product4Id = 4;
String product4Name = 'USB Cable';
double product4Price = 20.0;

int product5Id = 5;
String product5Name = 'Headphones';
double product5Price = 150.0;

int cartQuantity1 = 0; // Keyboard quantity
int cartQuantity2 = 0; // Mouse quantity
int cartQuantity3 = 0; // Monitor quantity
int cartQuantity4 = 0; // USB Cable quantity
int cartQuantity5 = 0; // Headphones quantity

// Customer variables
String customerName = '';
String customerPhone = '';

void showMenu() {
  print('\nWelcome to the store!');
  print('Available products:');
  print('$product1Id. $product1Name - \$${product1Price.toStringAsFixed(0)}');
  print('$product2Id. $product2Name - \$${product2Price.toStringAsFixed(0)}');
  print('$product3Id. $product3Name - \$${product3Price.toStringAsFixed(0)}');
  print('$product4Id. $product4Name - \$${product4Price.toStringAsFixed(0)}');
  print('$product5Id. $product5Name - \$${product5Price.toStringAsFixed(0)}');
}

void addToCart() {
  while (true) {
    print('\nEnter product number to add to cart (0 to finish): ');
    String? input = stdin.readLineSync();


    int productNumber;

      productNumber = int.parse(input!);


    if (productNumber == 0) {
      break;
    }

    if (productNumber < 1 || productNumber > 5) {
      print('Invalid product number. Please choose from 1-5.');
      continue;
    }

   print('Enter quantity: ');
    String? quantityInput = stdin.readLineSync();

    if (quantityInput == null || quantityInput.isEmpty) {
      print('Invalid quantity. Please try again.');
      continue;
    }

    int quantity;

      quantity = int.parse(quantityInput);


    if (quantity <= 0) {
      print('Quantity must be greater than 0.');
      continue;
    }

    // Add to cart based on product number
    String productName = '';
    if (productNumber == 1) {
      cartQuantity1 += quantity;
      productName = product1Name;
    } else if (productNumber == 2) {
      cartQuantity2 += quantity;
      productName = product2Name;
    } else if (productNumber == 3) {
      cartQuantity3 += quantity;
      productName = product3Name;
    } else if (productNumber == 4) {
      cartQuantity4 += quantity;
      productName = product4Name;
    } else if (productNumber == 5) {
      cartQuantity5 += quantity;
      productName = product5Name;
    }

    print('Added ${quantity} $productName to cart.');
  }
}

void getCustomerInfo() {
  print('\nPlease enter your name: ');
  customerName = stdin.readLineSync() ?? '';

  print('Please enter your phone number: ');
  customerPhone = stdin.readLineSync() ?? '';
}

double calculateSubtotal() {
  double total = 0.0;

  total += product1Price * cartQuantity1;
  total += product2Price * cartQuantity2;
  total += product3Price * cartQuantity3;
  total += product4Price * cartQuantity4;
  total += product5Price * cartQuantity5;

  return total;
}

double calculateTax(double subtotal) {
  return subtotal * 0.13; // 13% tax
}

double calculateDiscount(double subtotal) {
  if (subtotal > 500) {
    return subtotal * 0.10;
  } else if (subtotal > 200) {
    return subtotal * 0.05;
  }
  return 0.0;
}

double calculateDeliveryFee(double distance) {
  if (distance <= 5) {
    return 5.0;
  } else {
    return 5.0 + (distance - 5) * 2.0;
  }
}

bool getDeliveryChoice() {
    print('\nDo you want delivery? (yes/no): ');
    String? input = stdin.readLineSync()?.toLowerCase();

    if (input == 'yes' || input == 'y') {
      return true;
    } else if (input == 'no' || input == 'n') {
      return false;
    } else {
      print('Please enter yes or no.');
    }

  return false;


}

double getDeliveryDistance() {
    print('Enter delivery distance in km: ');
    String? input = stdin.readLineSync();

      double distance = double.parse(input!);
      if (distance <= 0) {
        print('Distance must be greater than 0.');
    }
    return distance;
}

bool isCartEmpty() {
  return cartQuantity1 == 0 && cartQuantity2 == 0 && cartQuantity3 == 0 &&
      cartQuantity4 == 0 && cartQuantity5 == 0;
}

void printCartSummary() {
  print('\nYour cart:');
  if (cartQuantity1 > 0) {
    print('${cartQuantity1} $product1Name - \$${(product1Price * cartQuantity1).toStringAsFixed(2)}');
  }
  if (cartQuantity2 > 0) {
    print('${cartQuantity2} $product2Name - \$${(product2Price * cartQuantity2).toStringAsFixed(2)}');
  }
  if (cartQuantity3 > 0) {
    print('${cartQuantity3} $product3Name - \$${(product3Price * cartQuantity3).toStringAsFixed(2)}');
  }
  if (cartQuantity4 > 0) {
    print('${cartQuantity4} $product4Name - \$${(product4Price * cartQuantity4).toStringAsFixed(2)}');
  }
  if (cartQuantity5 > 0) {
    print('${cartQuantity5} $product5Name - \$${(product5Price * cartQuantity5).toStringAsFixed(2)}');
  }
}

void processCheckout() {


  printCartSummary();

  getCustomerInfo();

  double subtotal = calculateSubtotal();
  double tax = calculateTax(subtotal);
  double discount = calculateDiscount(subtotal);
  double deliveryFee = 0.0;

  print('\nSubtotal: \$${subtotal.toStringAsFixed(2)}');
  print('Tax (13%): \$${tax.toStringAsFixed(2)}');
  print('Discount: \$${discount.toStringAsFixed(2)}');

  bool wantsDelivery = getDeliveryChoice();
  if (wantsDelivery) {
    double distance = getDeliveryDistance();
    deliveryFee = calculateDeliveryFee(distance);
    print('Delivery fee: \$${deliveryFee.toStringAsFixed(2)}');
  }

  double total = subtotal + tax - discount + deliveryFee;

  print('\n----------------------------');
  print('Total amount to pay: \$${total.toStringAsFixed(2)}');
  print('\nThank you for shopping with us, $customerName!');
  print('-----------------------------------------');
}

void resetForNextCustomer() {
  cartQuantity1 = 0;
  cartQuantity2 = 0;
  cartQuantity3 = 0;
  cartQuantity4 = 0;
  cartQuantity5 = 0;
  customerName = '';
  customerPhone = '';
}



void main() {
  print('🛒 Multi-Client Checkout System');
  print('===============================');

  while (true) {
    showMenu();
    addToCart();

    if (!isCartEmpty()) {
      processCheckout();
    }

    print('\nReady for next customer...');
    print('Press Enter to continue or type "quit" to exit...');

    String? input = stdin.readLineSync()?.toLowerCase();
    if (input == 'quit' || input == 'q') {
      print('Thank you for using our checkout system!');
      break;
    }

    resetForNextCustomer();
  }
}