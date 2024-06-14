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
          
          // Gradient overlay with ClipPath
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.75,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF8A00), Color(0xFFFFB400)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                //margin:const EdgeInsets.only(top: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    // "Log in to Easy Coupon" text
                    
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
                       return Navigator.pushReplacementNamed(context, '/login');
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
                                                                                                                                                              
              //   ],
                ),
              ),
            ),
        
          Positioned(
            top: -100,
            bottom: 300,
            right: -20,
            left: -10,
            child: ClipPath(
              clipper: BottomClipper(),
              child: Image.asset(
                'assets/nn.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 100);
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 100);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}