import 'package:flutter/material.dart';
import '../bloc/bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();

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
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                margin: const EdgeInsets.only(top: 72.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // "Log in to Easy Coupon" text

                    const Text(
                      'Log in to Easy Coupon',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    // Username TextField
                    TextField(
                      autocorrect: false,
                      controller: emailC,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 158, 154, 154),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        alignLabelWithHint: true, // Center the hint text
                      ),
                      textAlign: TextAlign.center, // Center the input text
                    ),
                    const SizedBox(height: 20.0),
                    // Password TextField
                    TextField(
                      autocorrect: false,
                      controller: passC,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 158, 154, 154),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        alignLabelWithHint: true, // Center the hint text
                      ),
                      textAlign: TextAlign.center, // Center the input text
                    ),
                    const SizedBox(height: 20.0),
                    // Login Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle login action

                        context.read<AuthBloc>().add(
                              AuthEventLogin(emailC.text, passC.text),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFFFC129), // Yellow color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 125.0,
                        ),
                        elevation: 10, // Add shadow to the button
                        shadowColor: Colors.black, // Shadow color
                      ),
                      child: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthStateLogin) {
                            Navigator.pushReplacementNamed(context, '/student');
                          }
                          if (state is AuthStateError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          // if (state is AuthStateLoading) {
                          //   return const SizedBox(
                          //     width: 100, // Set a fixed width
                          //     child: Center(
                          //       child: Text(
                          //         "LOADING...",
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontWeight: FontWeight.bold,
                          //           fontSize: 14.0,
                          //         ),
                          //       ),
                          //     ),
                          //   );
                          // }
                          return const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // Forget Password
                    TextButton(
                      onPressed: () {
                        // Handle forget password action

                        Navigator.pushReplacementNamed(context, '/reset');
                      },
                      child: const Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
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
