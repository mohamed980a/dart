import 'dart:io';

// Product structure
typedef Product = ({int id, String name, double price});

// Customer info structure
typedef CustomerInfo = ({String name, String phone});

// Individual product variables instead of list
Product product1 = (id: 1, name: 'Keyboard', price: 100.0);
Product product2 = (id: 2, name: 'Mouse', price: 50.0);
Product product3 = (id: 3, name: 'Monitor', price: 300.0);
Product product4 = (id: 4, name: 'USB Cable', price: 20.0);
Product product5 = (id: 5, name: 'Headphones', price: 150.0);

// Cart variables - individual quantities for each product
int cartQuantity1 = 0; // Keyboard quantity
int cartQuantity2 = 0; // Mouse quantity
int cartQuantity3 = 0; // Monitor quantity
int cartQuantity4 = 0; // USB Cable quantity
int cartQuantity5 = 0; // Headphones quantity

// Customer info
CustomerInfo? customerInfo;

void showMenu() {
  print('\nWelcome to the store!');
  print('Available products:');
  print('${product1.id}. ${product1.name} - \$${product1.price.toStringAsFixed(0)}');
  print('${product2.id}. ${product2.name} - \$${product2.price.toStringAsFixed(0)}');
  print('${product3.id}. ${product3.name} - \$${product3.price.toStringAsFixed(0)}');
  print('${product4.id}. ${product4.name} - \$${product4.price.toStringAsFixed(0)}');
  print('${product5.id}. ${product5.name} - \$${product5.price.toStringAsFixed(0)}');
}

void addToCart() {
  while (true) {
    stdout.write('\nEnter product number to add to cart (0 to finish): ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) {
      print('Invalid input. Please try again.');
      continue;
    }
    
    int productNumber;
    try {
      productNumber = int.parse(input);
    } catch (e) {
      print('Invalid input. Please enter a number.');
      continue;
    }
    
    if (productNumber == 0) {
      break;
    }
    
    if (productNumber < 1 || productNumber > 5) {
      print('Invalid product number. Please choose from 1-5.');
      continue;
    }
    
    stdout.write('Enter quantity: ');
    String? quantityInput = stdin.readLineSync();
    
    if (quantityInput == null || quantityInput.isEmpty) {
      print('Invalid quantity. Please try again.');
      continue;
    }
    
    int quantity;
    try {
      quantity = int.parse(quantityInput);
    } catch (e) {
      print('Invalid quantity. Please enter a number.');
      continue;
    }
    
    if (quantity <= 0) {
      print('Quantity must be greater than 0.');
      continue;
    }
    
    // Add to cart based on product number
    String productName = '';
    if (productNumber == 1) {
      cartQuantity1 += quantity;
      productName = product1.name;
    } else if (productNumber == 2) {
      cartQuantity2 += quantity;
      productName = product2.name;
    } else if (productNumber == 3) {
      cartQuantity3 += quantity;
      productName = product3.name;
    } else if (productNumber == 4) {
      cartQuantity4 += quantity;
      productName = product4.name;
    } else if (productNumber == 5) {
      cartQuantity5 += quantity;
      productName = product5.name;
    }
    
    print('Added ${quantity}x $productName to cart.');
  }
}

CustomerInfo getCustomerInfo() {
  stdout.write('\nPlease enter your name: ');
  String? name = stdin.readLineSync() ?? '';
  
  stdout.write('Please enter your phone number: ');
  String? phone = stdin.readLineSync() ?? '';
  
  return (name: name, phone: phone);
}

double calculateSubtotal() {
  double total = 0.0;
  
  total += product1.price * cartQuantity1;
  total += product2.price * cartQuantity2;
  total += product3.price * cartQuantity3;
  total += product4.price * cartQuantity4;
  total += product5.price * cartQuantity5;
  
  return total;
}

double calculateTax(double subtotal) {
  return subtotal * 0.13; // 13% tax
}

double calculateDiscount(double subtotal) {
  // Discount rules: 10% for orders over $500, 5% for orders over $200
  if (subtotal > 500) {
    return subtotal * 0.10;
  } else if (subtotal > 200) {
    return subtotal * 0.05;
  }
  return 0.0;
}

double calculateDeliveryFee(double distance) {
  // Base fee $5 + $2 per km over 5km
  if (distance <= 5) {
    return 5.0;
  } else {
    return 5.0 + (distance - 5) * 2.0;
  }
}

bool getDeliveryChoice() {
  while (true) {
    stdout.write('\nDo you want delivery? (yes/no): ');
    String? input = stdin.readLineSync()?.toLowerCase();
    
    if (input == 'yes' || input == 'y') {
      return true;
    } else if (input == 'no' || input == 'n') {
      return false;
    } else {
      print('Please enter yes or no.');
    }
  }
}

double getDeliveryDistance() {
  while (true) {
    stdout.write('Enter delivery distance in km: ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) {
      print('Invalid input. Please try again.');
      continue;
    }
    
    try {
      double distance = double.parse(input);
      if (distance <= 0) {
        print('Distance must be greater than 0.');
        continue;
      }
      return distance;
    } catch (e) {
      print('Invalid distance. Please enter a number.');
    }
  }
}

bool isCartEmpty() {
  return cartQuantity1 == 0 && cartQuantity2 == 0 && cartQuantity3 == 0 && 
         cartQuantity4 == 0 && cartQuantity5 == 0;
}

void printCartSummary() {
  print('\nYour cart:');
  if (cartQuantity1 > 0) {
    print('${cartQuantity1}x ${product1.name} - \$${(product1.price * cartQuantity1).toStringAsFixed(2)}');
  }
  if (cartQuantity2 > 0) {
    print('${cartQuantity2}x ${product2.name} - \$${(product2.price * cartQuantity2).toStringAsFixed(2)}');
  }
  if (cartQuantity3 > 0) {
    print('${cartQuantity3}x ${product3.name} - \$${(product3.price * cartQuantity3).toStringAsFixed(2)}');
  }
  if (cartQuantity4 > 0) {
    print('${cartQuantity4}x ${product4.name} - \$${(product4.price * cartQuantity4).toStringAsFixed(2)}');
  }
  if (cartQuantity5 > 0) {
    print('${cartQuantity5}x ${product5.name} - \$${(product5.price * cartQuantity5).toStringAsFixed(2)}');
  }
}

void processCheckout() {
  if (isCartEmpty()) {
    print('Your cart is empty. Please add some products first.');
    return;
  }
  
  printCartSummary();
  
  customerInfo = getCustomerInfo();
  
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
  print('\nThank you for shopping with us, ${customerInfo?.name}!');
  print('-----------------------------------------');
}

void resetForNextCustomer() {
  cartQuantity1 = 0;
  cartQuantity2 = 0;
  cartQuantity3 = 0;
  cartQuantity4 = 0;
  cartQuantity5 = 0;
  customerInfo = null;
}

void runCheckoutSystem() {
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

void main() {
  runCheckoutSystem();
}