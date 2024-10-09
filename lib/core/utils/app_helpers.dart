import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/app_images.dart';

class AppHelpers {
  // Helper function to navigate to a new page
  static Future<void> navigateTo(BuildContext context, Widget page) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  // Helper function to show a success dialog
  static void showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  }

  // Helper function to obsure/un-obsure passwords
  static String obsurePassword(String password) {
    return '*' * password.length;
  }

  // Helper function to format URL for display (strip 'http' or 'https')
  static String formatUrl(String url) {
    return url.replaceAll(RegExp(r'^https?:\/\/'), '');
  }

  // Helper to show a toast/snackbar notification
  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static String getServiceImage(String serviceName) {
    final Map<String, String> serviceIcons = {
      'Google': AppImages.Google,
      'Facebook': AppImages.Facebook,
      'Instagram': AppImages.Instagram,
      'Dribbble': AppImages.Dribbble,
      'Snapchat': AppImages.Snapchat,
      'Gmail': AppImages.Gmail,
      'Twitter': AppImages.Twitter,
      'Linkedin': AppImages.Linkedin,
      'Tiktok': AppImages.Tiktok,
      'Netflix': AppImages.Netflix,
      'Spotify': AppImages.Spotify,
      'Teams': AppImages.Teams,
      'Zoom': AppImages.Zoom,
      'Behance': AppImages.Behance,
    };
    return serviceIcons[serviceName] ?? AppImages.Google;
  }
}
