import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:password_manager/core/constants/app_colors.dart';
import 'package:password_manager/core/constants/app_text_styles.dart';
import 'package:password_manager/core/utils/app_helpers.dart';

class AccountCard extends StatefulWidget {
  final String serviceName;
  final String serviceUrl;
  final String serviceLogo;
  final String password;
  final bool isPasswordVisible;
  final VoidCallback onVisibilityToggle;
  final VoidCallback onDelete;

  const AccountCard({
    super.key,
    required this.serviceName,
    required this.serviceUrl,
    required this.serviceLogo,
    required this.password,
    required this.isPasswordVisible,
    required this.onVisibilityToggle,
    required this.onDelete,
  });

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Service logo
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                widget.serviceLogo,
                width: 35,
                height: 35,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),

            // Account Details (Name, URL, Password)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.serviceName,
                    style: AppTextStyles.subtitle1,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'URL: ${AppHelpers.formatUrl(widget.serviceUrl)}',
                    style: AppTextStyles.bodyText,
                  ),
                  const SizedBox(height: 2.0),
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Password: ${widget.password}',
                      style: TextStyle(
                        fontSize: widget.isPasswordVisible
                            ? AppTextStyles.passwordText.fontSize
                            : AppTextStyles.passwordText
                                .fontSize, // Font size changes based on visibility
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Password visibility toggle icon
            IconButton(
              icon: Icon(
                widget.isPasswordVisible ? IconlyLight.show : IconlyLight.hide,
                color: AppColors.passwordIconColor,
              ),
              onPressed: widget.onVisibilityToggle,
            ),
          ],
        ),
      ),
    );
  }
}
