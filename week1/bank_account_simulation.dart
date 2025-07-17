// import 'dart:io';
//
// void main()
// {
//   print("Welcome to the Bank Account Simulation!");
//
//   // Initialize a bank account with a balance
//   print("Creating a bank account with an initial balance");
//   print("Please Enter Your Name Account: ");
//   String name = stdin.readLineSync() ?? "Default User";
//   print("Please Enter Your Number Account: ");
//   String number = stdin.readLineSync() ?? "0000";
//   print("Please Enter Your Type Account: ");
//   String type = stdin.readLineSync() ?? "Savings";
//   print("Please Enter Your initial Balance Account: ");
//   double initialBalance = double.parse(stdin.readLineSync() ?? "0.0");
//
//   print('Account created successfully!');
//   print('Account Holder: $name');
//   print('Account Number: $number');
//   print('Account Type: $type');
//   print('Initial Balance: \$${initialBalance.toStringAsFixed(2)}');
//   print('----------------------------------------');
//
//   // Choice to simulate transactions
//   print("Would you like to simulate transactions? (yes/no)");
//   print("chosse number 1 Deposit");
//   print("chosse number 2 Withdraw");
//   print("chosse number 3 Predict Future Balance (Profit Model)");
//   print("chosse number 4 View Account Summary");
//   print("chosse number 5 Exit");
//
// // Read user input for choice
//   String? choice = stdin.readLineSync()?.toLowerCase();
//   if (choice ==1.toString()) {
//     Deposit(initialBalance, name, number, type);
//   }else if (choice ==2.toString()) {
//     withdraw(initialBalance);
//   } else if (choice ==3.toString()) {
//     print("Predicting future balance is not implemented yet.");
//   } else if (choice ==4.toString()) {
//     print("Viewing account summary is not implemented yet.");
//   } else if (choice ==5.toString()) {
//     print("Exiting the simulation. Goodbye!");
//     return;
//   } else {
//     print("Invalid choice. Exiting the simulation.");
//     return;
//   }
//
//   // Simulate some transactions
//   // double balance = Deposit(initialBalance, name, number, type);
//
//   //withdrawal
//   // withdraw(balance);
//
//
//
//   // End of the simulation
//
// }
//
// void withdraw(double balance) {
//   //withdrawal
//   print("Please Enter the amount to withdraw: ");
//   double withdrawalAmount = double.parse(stdin.readLineSync() ?? "0.0");
//   if (withdrawalAmount <= 0) {
//     print("Invalid withdrawal amount. Exiting the simulation.");
//   } else if (withdrawalAmount > balance) {
//     print("Insufficient funds for withdrawal of \$${withdrawalAmount}.");
//   } else {
//     balance -= withdrawalAmount;
//     print("Withdrew: \$${withdrawalAmount}");
//     print('New Balance: \$${balance.toStringAsFixed(2)}');
//   }
// }
//
// double Deposit(double initialBalance, String name, String number, String type) {
//   // Simulate some transactions
//   double balance = initialBalance;
//     print("Please Enter the amount to deposit ");
//     double amount = double.parse(stdin.readLineSync() ?? "0.0");
//
//     if (amount == 0) {
//       print("Exiting the simulation.");
//
//     }
//
//     if (amount < 0 && balance + amount < 0) {
//       print("Insufficient funds for withdrawal of \$${amount.abs()}.");
//     } else {
//       balance += amount;
//       String transactionType = amount > 0 ? "Deposited" : "Withdrew";
//       print("$transactionType: \$${amount.abs()}");
//       print('New Balance: \$${balance.toStringAsFixed(2)}');
//     }
//
//     print('----------------------------------------');
//
//
//   print("Thank you for using the Bank Account Simulation!");
//   print("Final Balance: \$${balance.toStringAsFixed(2)}");
//   print("Account Holder: $name");
//   print("Account Number: $number");
//   print("Account Type: $type");
//   print("Goodbye!");
//   print('----------------------------------------');
//   return balance;
// }

import 'dart:io';

String accountName = '';
int accountNumber = 0;
String accountType = '';
double accountBalance = 0.0;

void main() {
  createAccount();

  late int option;
  do {
    showMenu();
    var input = stdin.readLineSync();
    option = int.parse(input!);
    switch (option) {
      case 1:
        Deposit();
        break;
      case 2:
        Withdrawal();
        break;
      case 3:
        predictFutureBalance();
        break;
      case 4:
        showAccountSummary();
        break;
      case 5:
        print("Thank you for using the banking system. Goodbye!");
        break;
      default:
        print("Invalid option. Please enter a number between 1 and 5.");
    }
  } while (option != 5);
}

void createAccount() {
  print("\n=== Create Your Bank Account ===");

  print("Enter your name: ");
  accountName = stdin.readLineSync()!;

  while (true) {
    print("Enter account number: ");
      accountNumber = int.parse(stdin.readLineSync()!);
      break;

  }

  do {
    print("Enter account type (savings/checking): ");
    accountType = stdin.readLineSync()!.toLowerCase();
    if (accountType != "savings" && accountType != "checking") {
      print("Invalid account type. Please enter 'savings' or 'checking'.");
    }
  } while (accountType != "savings" && accountType != "checking");

  while (true) {
    print("Enter initial balance: ");
      accountBalance = double.parse(stdin.readLineSync()!);
      if (accountBalance < 0) {
        print("Initial balance cannot be negative.");
        continue;
      }
      break;
    }


  print("\nAccount created successfully!");
}

void showMenu() {
  print("\n------ Menu ------");
  print("1. Deposit");
  print("2. Withdraw");
  print("3. Predict Future Balance (Profit Model)");
  print("4. View Account Summary");
  print("5. Exit");
  print("Choose an option: ");
}

void Deposit() {
  print("Enter amount to deposit: ");
    double amount = double.parse(stdin.readLineSync()!);
    if (amount <= 0) {
      print("Invalid amount. Deposit failed.");
      return;
    }
    accountBalance += amount;
    print("Deposit successful. New balance: \$${accountBalance.toStringAsFixed(2)}");
  }


void Withdrawal() {
  print("Enter amount to withdraw: ");

    double amount = double.parse(stdin.readLineSync()!);
    if (amount <= 0) {
      print("Invalid amount. Withdrawal failed.");
      return;
    }
    if (amount > accountBalance) {
      print("Insufficient balance. Withdrawal denied.");
      return;
    }
    accountBalance -= amount;
    print("Withdrawal successful. New balance: \$${accountBalance.toStringAsFixed(2)}");
}

void predictFutureBalance() {
  int years;
  while (true) {
    print("Enter number of years: ");

      years = int.parse(stdin.readLineSync()!);
      if (years < 0) {
        print("Number of years cannot be negative.");
        continue;
      }
      break;


  }

  double rate;
  while (true) {
    print("Enter annual profit rate (%): ");

      rate = double.parse(stdin.readLineSync()!);
      if (rate < 0) {
        print("Profit rate cannot be negative.");
        continue;
      }
      break;

  }

  double futureBalance = accountBalance * (1 + (rate / 100) * years);
  print("\nPredicted future balance after $years years: \$${futureBalance.toStringAsFixed(2)}");
  print("Rounded balance: \$${futureBalance.round()}\n");
}

void showAccountSummary() {
  print("\nAccount Summary:");
  print("Name: $accountName");
  print("Account Number: $accountNumber");
  print("Account Type: $accountType");
  print("Current Balance: \$${accountBalance.toStringAsFixed(2)}");
  print("Rounded Balance: \$${accountBalance.round()}\n");
}