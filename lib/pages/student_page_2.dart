import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'qr_scanner_page.dart';
import '../bloc/bloc.dart';

class StudentPage extends StatefulWidget {
  StudentPage({Key? key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  int result = 30;
  double spinBoxValue = 0; // Track the SpinBox value

  void handleQRScan(String qrData) {
    setState(() {
      result -= spinBoxValue.toInt(); // Use the SpinBox value
    });
    Navigator.pop(context); // Close the QR scanner page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Page'),
        backgroundColor: const Color(0xFFFCD170),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: _buildDrawer(context),
      body: Container(
        color: const Color(0xFFF9E6BD),
        child: Center(
          child: Container(
            height: 625,
            width: 300,
            decoration: BoxDecoration(
              color: const Color(0xFFFCD170),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavigationButton('Home'),
                    _buildNavigationButton('Report'),
                  ],
                ),
                Container(
                  height: 110,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF8900),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/1234.jpg',
                          fit: BoxFit.cover,
                        ),
                        const Positioned(
                          left: 20,
                          top: 10,
                          child: Text(
                            'The Reliable\nCoupon System',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      result.toString(),
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Container(
                  height: 50,
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SpinBox(
                    min: 1,
                    max: 3,
                    value: 1, 
                    onChanged: (value) {
                      setState(() {
                        spinBoxValue = value;
                      });
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QRScannerPage(handleQRScan),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        minimumSize: const Size(290, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Scan the QR Code",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(String text) {
    return Container(
      height: 20,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
         const DrawerHeader(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF8A00), Color(0xFFFFB400)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child:  Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close drawer and navigate to Home
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About App'),
            onTap: () {
              Navigator.pop(context); // Close drawer and navigate to About App
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              
              // Add your log out logic here
              BlocProvider.of<AuthBloc>(context).add(AuthEventLogout());
              Navigator.pushReplacementNamed(context, '/get-started');
            },
          ),
        ],
      ),
    );
  }
}
