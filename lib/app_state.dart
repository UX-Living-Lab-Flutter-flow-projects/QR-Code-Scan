import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _ActiveQrCode = prefs.getBool('ff_ActiveQrCode') ?? _ActiveQrCode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _response;
  dynamic get response => _response;
  set response(dynamic _value) {
    _response = _value;
  }

  String _QrImage = '';
  String get QrImage => _QrImage;
  set QrImage(String _value) {
    _QrImage = _value;
  }

  int _quantity = 0;
  int get quantity => _quantity;
  set quantity(int _value) {
    _quantity = _value;
  }

  String _sessionID = '';
  String get sessionID => _sessionID;
  set sessionID(String _value) {
    _sessionID = _value;
  }

  String _sessionId = '';
  String get sessionId => _sessionId;
  set sessionId(String _value) {
    _sessionId = _value;
  }

  Color _colorToAPI = Color(4294574080);
  Color get colorToAPI => _colorToAPI;
  set colorToAPI(Color _value) {
    _colorToAPI = _value;
  }

  String _colorTOAPIString = '#FA0000';
  String get colorTOAPIString => _colorTOAPIString;
  set colorTOAPIString(String _value) {
    _colorTOAPIString = _value;
  }

  int _qrcodID = 0;
  int get qrcodID => _qrcodID;
  set qrcodID(int _value) {
    _qrcodID = _value;
  }

  bool _ActiveQrCode = true;
  bool get ActiveQrCode => _ActiveQrCode;
  set ActiveQrCode(bool _value) {
    _ActiveQrCode = _value;
    prefs.setBool('ff_ActiveQrCode', _value);
  }

  bool _InActiveQrCode = false;
  bool get InActiveQrCode => _InActiveQrCode;
  set InActiveQrCode(bool _value) {
    _InActiveQrCode = _value;
  }

  String _QrProductName = '';
  String get QrProductName => _QrProductName;
  set QrProductName(String _value) {
    _QrProductName = _value;
  }

  Color _color1 = Color(4294967295);
  Color get color1 => _color1;
  set color1(Color _value) {
    _color1 = _value;
  }

  Color _color2 = Color(4294967295);
  Color get color2 => _color2;
  set color2(Color _value) {
    _color2 = _value;
  }

  Color _color3 = Color(4294967295);
  Color get color3 => _color3;
  set color3(Color _value) {
    _color3 = _value;
  }

  Color _color4 = Color(4294967295);
  Color get color4 => _color4;
  set color4(Color _value) {
    _color4 = _value;
  }

  Color _color5 = Color(4294967295);
  Color get color5 => _color5;
  set color5(Color _value) {
    _color5 = _value;
  }

  Color _color6 = Color(4294769916);
  Color get color6 => _color6;
  set color6(Color _value) {
    _color6 = _value;
  }

  Color _color7 = Color(4294967295);
  Color get color7 => _color7;
  set color7(Color _value) {
    _color7 = _value;
  }

  Color _color8 = Color(4294967295);
  Color get color8 => _color8;
  set color8(Color _value) {
    _color8 = _value;
  }

  String _qrID = '';
  String get qrID => _qrID;
  set qrID(String _value) {
    _qrID = _value;
  }

  String _wer = '';
  String get wer => _wer;
  set wer(String _value) {
    _wer = _value;
  }

  String _qr = '';
  String get qr => _qr;
  set qr(String _value) {
    _qr = _value;
  }

  String _imageurl = '';
  String get imageurl => _imageurl;
  set imageurl(String _value) {
    _imageurl = _value;
  }

  dynamic _dataaaa;
  dynamic get dataaaa => _dataaaa;
  set dataaaa(dynamic _value) {
    _dataaaa = _value;
  }

  List<dynamic> _testttt = [];
  List<dynamic> get testttt => _testttt;
  set testttt(List<dynamic> _value) {
    _testttt = _value;
  }

  void addToTestttt(dynamic _value) {
    _testttt.add(_value);
  }

  void removeFromTestttt(dynamic _value) {
    _testttt.remove(_value);
  }

  void removeAtIndexFromTestttt(int _index) {
    _testttt.removeAt(_index);
  }

  void updateTesttttAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _testttt[_index] = updateFn(_testttt[_index]);
  }

  void insertAtIndexInTestttt(int _index, dynamic _value) {
    _testttt.insert(_index, _value);
  }

  String _lean = '';
  String get lean => _lean;
  set lean(String _value) {
    _lean = _value;
  }

  int _len = 0;
  int get len => _len;
  set len(int _value) {
    _len = _value;
  }

  dynamic _qrCodeDetail;
  dynamic get qrCodeDetail => _qrCodeDetail;
  set qrCodeDetail(dynamic _value) {
    _qrCodeDetail = _value;
  }

  String _qrColor = '';
  String get qrColor => _qrColor;
  set qrColor(String _value) {
    _qrColor = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
