# 🔒 Password Manager

A secure password manager app built with Flutter, designed to store and manage your credentials, and prompt users to save login details for various applications.

## 🛠️ Technologies

- **Flutter**
- **Dart**

## ✨ Features

- Secure storage of usernames and passwords
- Biometric authentication (fingerprint/face unlock) for added security
- Search functionality to quickly find stored credentials
- Categorization and organization of credentials
- Customizable password visibility
- Easy-to-use interface with custom buttons and text fields

## 🚦 Running the Project

To run the project locally, follow these steps:

1. **Clone the repository**:

    ```bash
    git clone https://github.com/DevSumanP/Password-Manager-App
    cd password_manager
    ```

2. **Install dependencies**:

    ```bash
    flutter pub get
    ```

3. **Set up Android files**:

   Update your `MainActivity.kt` file located at `android/app/src/main/kotlin/com/example/password_manager/MainActivity.kt`:

    ```kotlin
    package com.example.password_manager

    import io.flutter.embedding.android.FlutterFragmentActivity

    class MainActivity: FlutterFragmentActivity() {
        // ...
    }
    ```

   Update your `AndroidManifest.xml` located at `android/app/src/main/AndroidManifest.xml`:

    ```xml
    <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.password_manager">
        <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
        <application
            android:label="password_manager"
            android:name="${applicationName}"
            android:icon="@mipmap/ic_launcher">
        <!-- Other configurations -->
        </application>
    </manifest>
    ```

4. **Run the app**:

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

The app stores your credentials locally, ensuring that only you can access them using biometric authentication.
The credentials are stored in a secure database, and the app provides a clean interface to manage, search, and categorize passwords.


