import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'WELCOME !',
                    style: TextStyle(
                      fontSize: 40.0,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 97, 96, 94),
                        ),
                      ],
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Get Your Food Easy and Fast',
                    style: TextStyle(
                      fontSize: 16.0,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 97, 96, 94),
                        ),
                      ],
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 65.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SlideAction(
                      onSubmit: () {
                        return Future.delayed(const Duration(seconds: 1), () {
                          Navigator.pushReplacementNamed(context, '/login');
                        });
                      },
                      text: 'Get Started',
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      outerColor: Colors.white,
                      innerColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
