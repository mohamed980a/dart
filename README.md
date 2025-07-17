# 🛒 Multi-Client Checkout System

A Python-based checkout system that handles multiple customers sequentially in a store environment.

## Features

- **5 Fixed Products**: Keyboard ($100), Mouse ($50), Monitor ($300), USB Cable ($20), Headphones ($150)
- **Multi-Customer Support**: Processes customers one after another until manually stopped
- **Comprehensive Billing**: Calculates subtotal, tax (13%), discount, and delivery fees
- **Delivery Options**: Distance-based delivery fee calculation
- **Input Validation**: Robust error handling for all user inputs

## How to Run

```bash
python3 checkout_system.py
```

## Usage Flow

1. **Product Selection**: Customer chooses products by number and quantity
2. **Customer Info**: System asks for name and phone number
3. **Delivery Choice**: Option for delivery with distance-based pricing
4. **Receipt Generation**: Detailed receipt with all charges
5. **Next Customer**: System resets for the next customer

## Sample Interaction

```
Welcome to the store!
Available products:
1. Keyboard - $100
2. Mouse - $50
3. Monitor - $300
4. USB Cable - $20
5. Headphones - $150

Enter product number to add to cart (0 to finish): 3
Enter quantity: 2

Enter product number to add to cart (0 to finish): 2
Enter quantity: 1

Enter product number to add to cart (0 to finish): 0

Please enter your name: John Doe
Please enter your phone number: 123-456-7890

Subtotal: $650.00
Tax (13%): $84.50
Discount: $0.00

Do you want delivery? (yes/no): yes
Enter delivery distance in km: 25
Delivery fee: $45.00

----------------------------
Total amount to pay: $779.50

Thank you for shopping with us, John Doe!
-----------------------------------------

Ready for next customer...
```

## Business Rules

### Tax
- Fixed 13% tax rate applied to subtotal

### Discount
- 10% discount for orders $1000 and above
- No discount for orders under $1000

### Delivery Fees
- Up to 10km: $15.00
- 11-20km: $30.00
- 21km+: $45.00

## Stopping the Program

Press `Ctrl+C` to stop the program gracefully.

## Functions

- `show_menu()`: Displays available products
- `calculate_tax(subtotal)`: Calculates 13% tax
- `calculate_discount(subtotal)`: Applies discount based on order value
- `calculate_delivery_fee(distance)`: Calculates distance-based delivery fee
