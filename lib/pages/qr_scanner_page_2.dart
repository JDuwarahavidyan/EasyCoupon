import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
    @override
    _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    QRViewController? controller;
    bool scanning = false;

    @override
    void dispose() {
        controller?.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('QR Scanner'),
            ),
            body: Column(
                children: [
                    Expanded(
                        flex: 5,
                        child: QRView(
                            key: qrKey,
                            onQRViewCreated: _onQRViewCreated,
                        ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Center(
                            child: ElevatedButton(
                                onPressed: scanning ? null : _startScanning,
                                child: Text(scanning ? 'Scanning...' : 'Start Scanning'),
                            ),
                        ),
                    ),
                ],
            ),
        );
    }

    void _onQRViewCreated(QRViewController controller) {
        this.controller = controller;
        controller.scannedDataStream.listen((scanData) {
            // Handle the scanned QR code data
            print(scanData.code);
        });
    }

    void _startScanning() {
        setState(() {
            scanning = true;
        });
        controller?.resumeCamera();
    }
}