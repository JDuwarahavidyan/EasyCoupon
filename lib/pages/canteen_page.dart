import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CanteenPage extends StatefulWidget {
  const CanteenPage({super.key});
  @override
  State<CanteenPage> createState() => _CanteenPageState();
}

class _CanteenPageState extends State<CanteenPage> {
  String? _qrData;

  void _generateQRCode() {
    setState(() {
      _qrData = "New QR Code Data"; // You can change this to generate dynamic data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Canteen QR Code Generator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_qrData != null)
              QrImageView(
                data: _qrData!,
                version: QrVersions.auto,
                size: 200.0,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateQRCode,
              child: const Text("Generate QR Code"),
            ),
          ],
        ),
      ),
    );
  }
}
