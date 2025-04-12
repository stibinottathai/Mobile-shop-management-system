import 'package:flutter/material.dart';
import 'package:mobile_shop_management_system/controllers/controllers.dart';
import 'package:mobile_shop_management_system/core/provider_list.dart';
import 'package:mobile_shop_management_system/core/theme.dart';
import 'package:mobile_shop_management_system/screens/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: appProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
