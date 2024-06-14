import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/get_started.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Flutter Simple App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/get-started': (context) => const GetStarted(),
        '/login': (context) => const LoginPage(),

        
      },
    );
  }
}