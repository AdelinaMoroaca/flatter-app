Flutter Firebase Authentication Demo

A simple Flutter application that demonstrates user authentication with Firebase using Email & Password.
The app allows users to register, log in, and log out, with personalized messages displayed after login.

🚀 Features

Login & Registration Page

Input fields: Full Name, Email, Password

Form validation for each field

Register a new user with Firebase Authentication

Log in an existing user

Home Page

Personalized message:
Hey, <User>! You're successfully logged in 🎉

Logout button that signs out the user and returns to the login screen

🛠️ Requirements

Flutter SDK
installed

A Firebase project created in the Firebase Console

flutterfire_cli installed:

dart pub global activate flutterfire_cli

⚙️ Setup

Clone this repository

git clone <repo-url>
cd my_app

Install dependencies

flutter pub get

Configure Firebase
Run the FlutterFire CLI:

flutterfire configure

This will generate the file:

lib/firebase_options.dart

Run the app

flutter run -d chrome

You can also run on Android or Linux desktop.

📂 Project Structure
lib/
├── main.dart # App entry point, initializes Firebase & routes
├── login_page.dart # Login/Register form with validation & Firebase Auth
├── home_page.dart # Home screen with user greeting & logout
└── firebase_options.dart # Firebase config (auto-generated)

✅ Testing Scenarios

New User Registration

Enter full name, email, and password → creates a new Firebase user

Existing User Login

Enter email and password → logs the user in

Logout

Press logout → user is signed out and redirected to Login Page
