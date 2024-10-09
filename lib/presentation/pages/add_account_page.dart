import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:password_manager/core/constants/app_colors.dart';
import 'package:password_manager/core/constants/app_text_styles.dart';
import 'package:password_manager/database/save_data.dart';
import 'package:password_manager/presentation/widgets/custom_button.dart';
import 'package:password_manager/presentation/widgets/custom_textfield.dart';

class AddAccountPage extends StatefulWidget {
  const AddAccountPage({super.key});

  @override
  _AddAccountPageState createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _serviceIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          'Add Accounts',
          style: AppTextStyles.heading1,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(IconlyLight.setting),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomTextField(
                  controller: _serviceNameController,
                  hintText: "Enter sevice name",
                  isObscure: false,
                  type: TextInputType.text,
                  labelText: "Service Name"),
              const SizedBox(height: 15),
              CustomTextField(
                  controller: _serviceIDController,
                  hintText: "Enter service email or id",
                  isObscure: false,
                  type: TextInputType.text,
                  labelText: "Service Email or ID"),
              const SizedBox(height: 15),
              CustomTextField(
                  controller: _passwordController,
                  hintText: "Enter password",
                  isObscure: true,
                  type: TextInputType.text,
                  labelText: "Password"),
              const SizedBox(height: 15),
              CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: "Enter password again",
                  isObscure: true,
                  type: TextInputType.text,
                  labelText: "Confirm Password"),
              const SizedBox(height: 35),
              CustomButton(
                  text: 'Save Credentials',
                  background: AppColors.textColor,
                  foreground: AppColors.backgroundColor,
                  onTap: () {
                    onSaveAccount(
                        _serviceNameController,
                        _serviceIDController,
                        _passwordController,
                        _confirmPasswordController,
                        context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
