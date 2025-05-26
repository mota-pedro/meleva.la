import 'package:flutter/material.dart';
import 'package:meleva_la/src/pages/auth_module/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MeLeva.La',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 82, 113, 255),
            primary: Color.fromARGB(255, 82, 113, 255),
            secondary: Colors.white,
            tertiary: Color.fromARGB(255, 67, 100, 251),
        ),
        textTheme: TextTheme(

        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 82, 113, 255),
          primary: Color.fromARGB(255, 82, 113, 255),
          secondary: Color.fromARGB(255, 26, 29, 32),
          tertiary: Colors.white,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}