import 'dart:io';

class Product {
  final int id;
  final String name;
  final double price;
  
  Product(this.id, this.name, this.price);
}

class CartItem {
  final Product product;
  int quantity;
  
  CartItem(this.product, this.quantity);
  
  double get totalPrice => product.price * quantity;
}

class CheckoutSystem {
  static const List<Product> products = [
    Product(1, 'Keyboard', 100.0),
    Product(2, 'Mouse', 50.0),
    Product(3, 'Monitor', 300.0),
    Product(4, 'USB Cable', 20.0),
    Product(5, 'Headphones', 150.0),
  ];
  
  List<CartItem> cart = [];
  String? customerName;
  String? customerPhone;
  
  void showMenu() {
    print('\nWelcome to the store!');
    print('Available products:');
    for (var product in products) {
      print('${product.id}. ${product.name} - \$${product.price.toStringAsFixed(0)}');
    }
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
      
      if (productNumber < 1 || productNumber > products.length) {
        print('Invalid product number. Please choose from 1-${products.length}.');
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
      
      Product selectedProduct = products[productNumber - 1];
      
      // Check if product already exists in cart
      bool found = false;
      for (var item in cart) {
        if (item.product.id == selectedProduct.id) {
          item.quantity += quantity;
          found = true;
          break;
        }
      }
      
      if (!found) {
        cart.add(CartItem(selectedProduct, quantity));
      }
      
      print('Added ${quantity}x ${selectedProduct.name} to cart.');
    }
  }
  
  void getCustomerInfo() {
    stdout.write('\nPlease enter your name: ');
    customerName = stdin.readLineSync();
    
    stdout.write('Please enter your phone number: ');
    customerPhone = stdin.readLineSync();
  }
  
  double calculateSubtotal() {
    return cart.fold(0.0, (sum, item) => sum + item.totalPrice);
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
  
  void processCheckout() {
    if (cart.isEmpty) {
      print('Your cart is empty. Please add some products first.');
      return;
    }
    
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
    cart.clear();
    customerName = null;
    customerPhone = null;
  }
  
  void run() {
    print('🛒 Multi-Client Checkout System');
    print('===============================');
    
    while (true) {
      showMenu();
      addToCart();
      
      if (cart.isNotEmpty) {
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
}

void main() {
  CheckoutSystem system = CheckoutSystem();
  system.run();
}