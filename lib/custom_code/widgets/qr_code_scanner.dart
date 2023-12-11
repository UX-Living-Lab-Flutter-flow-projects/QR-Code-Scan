// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  QrCodeScanner({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  QRViewController? _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  String _scannedCode = '';
  String scaned = '';

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });
    _controller!.scannedDataStream.listen((scanData) {
      setState(() {
        _scannedCode = scanData.code!;
        scaned = _scannedCode;
        FFAppState().qr = scaned;
      });
    });
  }

  void _launchURL() async {
    setState(() {
      FFAppState().qr = 'mohaed';
    });
    // final uri = Uri.parse(_scannedCode!);
    //
    // if (await canLaunchUrl(uri)){
    //   await launchUrl(uri);
    // } else {
    //   // can't launch url
    // }

    // if (_scannedCode != null && await canLaunch(_scannedCode!))
    // {
    //   await launch(_scannedCode!);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: QRView(
            key: _qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.green,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: _launchURL,
            child: Text(
              _scannedCode ?? 'Scan a QR code',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
