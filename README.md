**KartiFy**
KartiFy is a Flutter-based e-commerce application that displays categorized products (Men, Women, Kids). Users can view product details, add items to their cart, and proceed to checkout. The app is built with Flutter and uses the Provider package for state management.

**Features**
1. Categorized product lists for Men, Women, and Kids.
2. Detailed product view with description and pricing.
3. Add products to a shopping cart.
4. Remove items from the cart.
5. Checkout functionality with total price calculation.

**Installation & Setup Instructions**
**Prerequisites**
Flutter SDK installed on your machine.
Android Studio or Visual Studio Code (recommended for Flutter development).
Git for version control.

**Clone the Repository**

**run in terminal** - (**git clone https://github.com/Chanchalsharm4601/diploy_assignment.git**
                       **cd diploy_assignment**)
**Install Dependencies** - Before running the app, make sure you install all the required dependencies:
                         (**flutter pub get**)
**Run the App** - To run the app on an emulator or physical device:
                  (**flutter run**)
**Code Structure**
**main.dart:** Entry point of the application, initializes the app and sets up providers.
**home.dart:** Displays the categorized list of products.
**productDetailScreen.dart:** Displays the details of a selected product.
**cart_provider.dart:** Manages the state of the shopping cart using the Provider package.
**CartScreen.dart:** Displays the products added to the cart and allows checkout.

**Assets**
Product data is stored in assets/product.json.
