# 🔒 Biometric Authentication App

A simple Flutter application that showcases the biometric authentication process. This app demonstrates how to implement biometric authentication using the device's built-in capabilities.

## 🛠️ Technologies

- **Flutter**
- **Dart**

## ✨ Features

- Implements biometric authentication (fingerprint and facial recognition).
- Provides a user-friendly interface to demonstrate the authentication process.

## 🚦 Running the Project

To run the project locally, follow these steps:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/your-username/biometric-authentication.git
    cd biometric-authentication
    ```

2. **Install dependencies**:

    ```bash
    flutter pub get
    ```

3. **Run the app**:

    ```bash
    flutter run
    ```

## 📦 Project Structure

```bash
lib/
├── auth/
│   ├── widgets/
│   │   └── auth.dart                # Widgets for authentication logic
├── core/                             # Core utilities or base classes
├── data/                             # Data layer (repositories, data sources)
├── database/                         # Database logic
├── domain/
│   ├── entities/
│   │   └── account_entity.dart       # Entity representing account data
│   ├── usecases/
│   │   ├── add_account.dart          # Use case for adding an account
│   │   ├── delete_account.dart       # Use case for deleting an account
│   │   └── get_accounts.dart         # Use case for retrieving accounts
├── presentation/
│   ├── pages/
│   │   ├── add_account_page.dart     # UI page for adding an account
│   │   ├── home_page.dart            # UI for the home page
│   │   └── mainscreen.dart           # Main screen of the app
│   ├── widgets/                      # Widgets for UI
├── service/
│   ├── encryption_handler.dart       # Logic for encryption
│   ├── generate_key.dart             # Key generation logic for encryption
│   └── local_auth.dart               # Local authentication logic (e.g., biometrics)
└── main.dart                         # Entry point of the app
```

### 🔐 How It Works

The app uses the Local Authentication Plugin to access biometric sensors like fingerprint or face ID. Upon launching the app, users can tap a button to initiate biometric authentication. If the device supports biometrics and the user has registered their biometrics (e.g., fingerprint), the app prompts the user to authenticate.
```
If the authentication is successful, a success message is displayed.
If the authentication fails, an error message is shown.
```

### 📲 Enabling Biometrics on Your Device

Make sure biometric authentication is enabled on your device:
```
Android: Go to Settings > Security > Fingerprint/Face Unlock to enable biometrics.
iOS: Go to Settings > Face ID & Passcode or Settings > Touch ID & Passcode.
```

## 🎥 Photos
<div>
  <img src="assets/images/screen2.jpg" alt="Image 1" width="200" height="450" style="display: inline-block; margin-right: 10px;"/>
  <img src="assets/images/screen1.jpg" alt="Image 2" width="200" height="450" style="display: inline-block;"/>
</div>
