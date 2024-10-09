import 'package:flutter/material.dart';
import 'package:password_manager/auth/auth.dart';
import 'package:password_manager/presentation/pages/add_account_page.dart';
import 'package:password_manager/presentation/pages/home_page.dart';
import 'package:password_manager/presentation/pages/mainscreen.dart';

class AppRoutes {
  static const String mainscreen = '/';
  static const String auth = '/auth';
  static const String home = '/home';
  static const String addAccount = '/add-account';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case auth:
        return MaterialPageRoute(builder: (_) => const Auth());
      case mainscreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case addAccount:
        return MaterialPageRoute(builder: (_) => const AddAccountPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
