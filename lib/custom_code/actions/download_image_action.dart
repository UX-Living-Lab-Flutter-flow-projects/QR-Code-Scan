// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<void> downloadImageAction(String qrcodeUrl) async {
  String imageUrl = qrcodeUrl;
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  String uniqueFileName =
      'image_${DateTime.now().millisecondsSinceEpoch}_${UniqueKey().toString()}.jpg';
  String filePath = "$appDocPath/$uniqueFileName";
  File file = File(filePath);

  try {
    if (await file.exists()) {
      await file.delete();
    }
    var response = await http.get(Uri.parse(imageUrl));
    await file.writeAsBytes(response.bodyBytes);
    print('Image downloaded successfully to: $filePath');
  } catch (error) {
    print('Error downloading image: $error');
  }
}
