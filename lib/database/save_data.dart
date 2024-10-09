import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:password_manager/core/utils/app_helpers.dart';
import 'package:password_manager/database/model/account_model.dart';
import 'package:password_manager/presentation/pages/mainscreen.dart';
import 'package:password_manager/service/encryption_handler.dart';

Future<void> onSaveAccount(
  TextEditingController serviceNameController,
  TextEditingController serviceIDController,
  TextEditingController passwordController,
  TextEditingController confirmPasswordController,
  BuildContext context,
) async {
  // Get input values
  String serviceName = serviceNameController.text.trim();
  String serviceUrl = serviceIDController.text.trim();
  String password = passwordController.text.trim();
  String confirmPassword = confirmPasswordController.text.trim();

  // Validation logic
  if (serviceName.isNotEmpty && serviceUrl.isNotEmpty && password.isNotEmpty) {
    if (password == confirmPassword) {
      // Encrypt the password
      String encryptedPassword = EncryptionHandler.encryptPassword(password);
      print(encryptedPassword);
      // Save account data using Hive
      var box = await Hive.openBox<Account>('accounts');
      Account account = Account(
        serviceName: serviceName,
        serviceUrl: serviceUrl,
        password: encryptedPassword,
        category:
            'Browser', // Consider passing category as a parameter if needed
        isPasswordVisible: false,
      );

      await box.add(account);

      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account saved successfully')),
      );

      // Optionally clear the fields after saving
      serviceNameController.clear();
      serviceIDController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      AppHelpers.navigateTo(context, const MainScreen());
    } else {
      // Show error message if passwords do not match
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
    }
  } else {
    // Show error message if validation fails
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill in all fields correctly')),
    );
  }
}

Future<List<Account>> retrieveAccountData() async {
  try {
    var box = await Hive.openBox<Account>('accounts');
    return box.values.toList();
  } catch (e) {
    print('Error retrieving accounts: $e');
    return []; // Return an empty list if an error occurs
  }
}
