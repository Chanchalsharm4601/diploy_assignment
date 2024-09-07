import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'screens/home.dart';


void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'assignment',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.pink[50],

      ),
      home: Home()
    );
  }
}

