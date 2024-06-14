import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: -300,
            bottom: 10,
            right: -20,
            left: -100,
            child: Image.asset(
              'assets/nn.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Gradient overlay
          Positioned(
            bottom: -50,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 1.75,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF8A00), Color(0xFFFFB400)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(500.0),
                  topRight: Radius.circular(500.0),
                ),
              ),
              
            ),

            
          ),
        ],
      ),
    );
  }
}
