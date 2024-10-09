import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager/database/model/account_model.dart';
import 'package:password_manager/routes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AccountAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.auth,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
