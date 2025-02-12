# expense_manager
**Project Overview**
Expense Manager is a Flutter mobile application designed to help users track their income and expenses efficiently. It features a modern UI, state management using Provider, and interactive elements like filtering and categorizing transactions.

**Setup Instructions**

Prerequisites:

Install Flutter
Ensure you have an IDE like VS Code or Android Studio

Clone this repository:
git clone https://github.com/your-username/expense-manager.git

Navigate into the project directory:
cd expense-manager

Install dependencies:
flutter pub get

Run the app:
flutter run

**Features Implemented**
Splash Screen: 
Displays the app logo for 3 seconds before navigating to login.

Login Screen: 
Email & password validation (static validation: test@gmail.com / 123456). 
Navigates to the Dashboard upon successful login.

Dashboard Screen: 
Displays total balance, income, and expense summary.
Shows a list of recent transactions (initially hardcoded JSON format).

Add Expense Screen:
Fields: Amount, Category, Description, Date (default: current date).
Option to select Income or Expense type.
Saves the transaction and updates the dashboard.

Transaction List Screen:
Displays all transactions with filter options (Income/Expense/All).
Ability to delete transactions.

Navigation & UI Improvements:
Bottom Navigation Bar for seamless navigation.
Floating Action Button for quick expense addition.
Modern Material Design UI.



A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
