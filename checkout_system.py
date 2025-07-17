#!/usr/bin/env python3
"""
Multi-Client Checkout System
A store checkout system that handles multiple customers sequentially.
"""

# Store products with fixed prices
PRODUCTS = {
    1: {"name": "Keyboard", "price": 100.00},
    2: {"name": "Mouse", "price": 50.00},
    3: {"name": "Monitor", "price": 300.00},
    4: {"name": "USB Cable", "price": 20.00},
    5: {"name": "Headphones", "price": 150.00}
}

TAX_RATE = 0.13  # 13% tax rate


def show_menu():
    """Display the store menu with available products."""
    print("Welcome to the store!")
    print("Available products:")
    for product_id, product_info in PRODUCTS.items():
        print(f"{product_id}. {product_info['name']} - ${product_info['price']:.0f}")
    print()


def calculate_tax(subtotal):
    """Calculate tax based on subtotal."""
    return subtotal * TAX_RATE


def calculate_discount(subtotal):
    """Calculate discount based on subtotal amount."""
    # Based on the example, no discount is applied for this scenario
    # You can modify this logic as needed for your business rules
    if subtotal >= 1000:
        return subtotal * 0.10  # 10% discount for orders $1000+
    else:
        return 0.00  # No discount for orders under $1000


def calculate_delivery_fee(distance):
    """Calculate delivery fee based on distance."""
    if distance <= 10:
        return 15.00  # Base fee for up to 10km
    elif distance <= 20:
        return 30.00  # Fee for 11-20km
    else:
        return 45.00  # Fee for 21km+


def get_valid_product_choice():
    """Get a valid product choice from the user."""
    while True:
        try:
            choice = int(input("Enter product number to add to cart (0 to finish): "))
            if choice == 0:
                return 0
            elif choice in PRODUCTS:
                return choice
            else:
                print(f"Invalid product number. Please choose from 1-{len(PRODUCTS)} or 0 to finish.")
        except ValueError:
            print("Please enter a valid number.")


def get_valid_quantity():
    """Get a valid quantity from the user."""
    while True:
        try:
            quantity = int(input("Enter quantity: "))
            if quantity > 0:
                return quantity
            else:
                print("Quantity must be greater than 0.")
        except ValueError:
            print("Please enter a valid number.")


def get_valid_distance():
    """Get a valid delivery distance from the user."""
    while True:
        try:
            distance = float(input("Enter delivery distance in km: "))
            if distance > 0:
                return distance
            else:
                print("Distance must be greater than 0.")
        except ValueError:
            print("Please enter a valid number.")


def get_delivery_choice():
    """Get whether customer wants delivery."""
    while True:
        choice = input("Do you want delivery? (yes/no): ").lower().strip()
        if choice in ['yes', 'y']:
            return True
        elif choice in ['no', 'n']:
            return False
        else:
            print("Please enter 'yes' or 'no'.")


def process_customer():
    """Process a single customer's order."""
    # Show menu
    show_menu()
    
    # Shopping cart to store items
    cart = {}
    
    # Shopping loop
    while True:
        product_choice = get_valid_product_choice()
        
        if product_choice == 0:
            break
            
        quantity = get_valid_quantity()
        
        # Add to cart
        if product_choice in cart:
            cart[product_choice] += quantity
        else:
            cart[product_choice] = quantity
        
        print()  # Add blank line for readability
    
    # If cart is empty, skip to next customer
    if not cart:
        print("No items in cart. Moving to next customer...\n")
        return
    
    # Get customer information
    print()
    name = input("Please enter your name: ").strip()
    phone = input("Please enter your phone number: ").strip()
    print()
    
    # Calculate subtotal
    subtotal = 0
    for product_id, quantity in cart.items():
        subtotal += PRODUCTS[product_id]["price"] * quantity
    
    # Calculate tax and discount
    tax = calculate_tax(subtotal)
    discount = calculate_discount(subtotal)
    
    # Display order summary
    print(f"Subtotal: ${subtotal:.2f}")
    print(f"Tax ({TAX_RATE*100:.0f}%): ${tax:.2f}")
    print(f"Discount: ${discount:.2f}")
    print()
    
    # Handle delivery
    delivery_fee = 0
    if get_delivery_choice():
        distance = get_valid_distance()
        delivery_fee = calculate_delivery_fee(distance)
        print(f"Delivery fee: ${delivery_fee:.2f}")
    
    # Calculate total
    total = subtotal + tax - discount + delivery_fee
    
    # Display final receipt
    print("\n" + "-" * 28)
    print(f"Total amount to pay: ${total:.2f}")
    print()
    print(f"Thank you for shopping with us, {name}!")
    print("-" * 41)
    print()


def main():
    """Main program loop to handle multiple customers."""
    print("🛒 Multi-Client Checkout System")
    print("=" * 35)
    print()
    
    try:
        while True:
            process_customer()
            print("Ready for next customer...")
            print()
            
            # Optional: Ask if there's another customer
            # Uncomment the following lines if you want to add an exit option
            # continue_choice = input("Is there another customer? (yes/no): ").lower().strip()
            # if continue_choice in ['no', 'n']:
            #     break
            # print()
            
    except KeyboardInterrupt:
        print("\n\nThank you for using our checkout system!")
        print("Have a great day!")


if __name__ == "__main__":
    main()