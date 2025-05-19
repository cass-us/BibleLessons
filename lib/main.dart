import 'package:flutter/material.dart';
import 'package:currency_converter/currency_material_page.dart'; // This will be your Login Page
//import 'home.dart'; // This will be the Christian-themed Home Page

void main() {
  runApp(const MyApp());
}

// Use PascalCase for class names
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Christian App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CurrencyMaterialPage(), // Show the custom home page first
      routes: {
        '/login': (context) => const CurrencyMaterialPage(), // Login page route
      },
    );
  }
}
