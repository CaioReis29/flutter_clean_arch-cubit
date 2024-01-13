import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/routes/app_routes.dart';
import 'package:flutter_clean_architecture/core/themes/my_theme.dart';
import 'package:flutter_clean_architecture/features/user/presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Arch',
      theme: MyTheme.theme,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => const HomeScreen(),
      },
    );
  }
}
