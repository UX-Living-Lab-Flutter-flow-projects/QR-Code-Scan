// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatefulWidget {
  const QRCode({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  TextEditingController qrCodeController = TextEditingController();
  String qrData = '';

  @override
  void dispose() {
    qrCodeController.dispose();
    super.dispose();
  }

  void generateQrCode() {
    setState(() {
      qrData = qrCodeController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(
            controller: qrCodeController,
            decoration: InputDecoration(
                hintText: 'Enter your text',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          const SizedBox(
            height: 50,
          ),
          QrImageView(
            data: qrData,
            version: QrVersions.auto,
            size: 200.0,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            width: 160,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: MaterialButton(
                onPressed: generateQrCode, child: Text("Create QR Code")),
          ),
          // Container(
          //   width: 100,
          //   height: 40,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     color: Colors.green,
          //   ),
          //   child: MaterialButton(
          //       onPressed: () {
          //         Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) =>
          //                 CreateQRcode3Widget(qrCode: qrData)));
          //       },
          //       child: Text("Next")),
          // ),
        ],
      ),
    );
  }
}
