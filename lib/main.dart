import 'package:easy_coupon/pages/password_reset_page.dart';
import 'package:easy_coupon/pages/student_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/splash_screen.dart';
import 'pages/get_started.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'bloc/auth/auth_bloc.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
        // Add other providers if necessary
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Simple App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        initialRoute: '/',
        routes: {
          '/get-started': (context) => const GetStarted(),
          '/login': (context) => LoginPage(),
          '/student': (context) => const StudentPage(),
          '/reset': (context) => const PasswordResetPage(),
        },
      ),
    );
  }
}
