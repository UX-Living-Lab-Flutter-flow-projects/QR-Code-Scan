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

class QrCodeColors extends StatefulWidget {
  const QrCodeColors({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _QrCodeColorsState createState() => _QrCodeColorsState();
}

class _QrCodeColorsState extends State<QrCodeColors> {
  TextEditingController textEditingController = TextEditingController();
  String qrData = '';
  GlobalKey qrKey = GlobalKey();

  List<Color> foregroundColors = [
    Colors.black,
    Colors.white,
    Colors.white,
    Colors.black,
    Colors.white,
    Colors.white,
    Colors.black,
  ];

  List<Color> backgroundColors = [
    Colors.white,
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.deepOrangeAccent,
    Colors.purple,
    Colors.yellow,
  ];
  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrImageView(
          data: 'Muzzamil khan',
          version: QrVersions.auto,
          size: 270,
          foregroundColor: foregroundColors[selectedColorIndex],
          backgroundColor: backgroundColors[selectedColorIndex],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(foregroundColors.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColorIndex = index;
                });
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: backgroundColors[index],
                  border: Border.all(
                    color: selectedColorIndex == index
                        ? Colors.black
                        : Colors.transparent,
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
