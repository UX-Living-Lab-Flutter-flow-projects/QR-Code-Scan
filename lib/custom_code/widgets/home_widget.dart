// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!

import 'package:http/http.dart' as http;
import 'dart:convert';

class Data {
  String? sId;
  String? qrcodeId;
  int? logoSize;
  String? qrcodeColor;
  String? companyId;
  String? createdBy;
  String? description;
  String? productName;
  bool? isActive;
  String? qrcodeType;
  String? qrcodeImageUrl;
  Null? logoUrl;

  Data(
      {this.sId,
      this.qrcodeId,
      this.logoSize,
      this.qrcodeColor,
      this.companyId,
      this.createdBy,
      this.description,
      this.productName,
      this.isActive,
      this.qrcodeType,
      this.qrcodeImageUrl,
      this.logoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    qrcodeId = json['qrcode_id'];
    logoSize = json['logo_size'];
    qrcodeColor = json['qrcode_color'];
    companyId = json['company_id'];
    createdBy = json['created_by'];
    description = json['description'];
    productName = json['product_name'];
    isActive =
        json['is_active'] == 'true' || json['is_active'] == true ? true : false;
    qrcodeType = json['qrcode_type'];
    qrcodeImageUrl = json['qrcode_image_url'];
    logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['qrcode_id'] = this.qrcodeId;
    data['logo_size'] = this.logoSize;
    data['qrcode_color'] = this.qrcodeColor;
    data['company_id'] = this.companyId;
    data['created_by'] = this.createdBy;
    data['description'] = this.description;
    data['product_name'] = this.productName;
    data['is_active'] = this.isActive;
    data['qrcode_type'] = this.qrcodeType;
    data['qrcode_image_url'] = this.qrcodeImageUrl;
    data['logo_url'] = this.logoUrl;
    return data;
  }
}

class qrmodel {
  Response? response;

  qrmodel({this.response});

  qrmodel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  bool? isSuccess;
  List<Data>? data;

  Response({this.isSuccess, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    Key? key,
    this.width,
    this.height,
    this.name,
    required this.navigateTo,
    required this.delete,
    required this.edit,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? name;
  final Future<dynamic> Function() navigateTo;
  final Future<dynamic> Function() delete;
  final Future<dynamic> Function() edit;

  @override
  State<HomeWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeWidget> {
  List<Data> allQRCodeData = [];
  List<Data> activeQRCodeData = [];
  List<Data> inactiveQRCodeData = [];
  bool all = false;
  bool inactive = false;
  bool active = true;
  bool loading = true;

  Future<void> _refreshData(BuildContext context) async {
    setState(() {
      loading = true;
    });
    fetchData();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  int len = 0;
  int aclen = 0;
  int inaclen = 0;
  var Controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Future<void> fetchData() async {
    final url = Uri.parse(
        'https://www.qrcodereviews.uxlivinglab.online/api/v1/qr-code/?created_by=${widget.name}');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        //print(response.body);
        // final jsonData = json.decode(response.body);
        dynamic jsonData = json.decode(response.body);
        qrmodel da = qrmodel.fromJson(jsonData);
        if (da.response!.data != null) {
          len = da.response!.data!.length;
          print(len);
        }

        // Clear existing data
        allQRCodeData.clear();
        activeQRCodeData.clear();
        inactiveQRCodeData.clear();
        da.response!.data!.forEach((element) {
          setState(() {
            loading = false;
          });
          allQRCodeData.add(element);
          if (element.isActive == true) {
            activeQRCodeData.add(element);
          } else {
            inactiveQRCodeData.add(element);
          }
        });
        aclen = activeQRCodeData.length;
        inaclen = inactiveQRCodeData.length;
        print(allQRCodeData.length);
        print(allQRCodeData[0].description);
        print(activeQRCodeData.length);
        print(activeQRCodeData[0].description);
        print(inactiveQRCodeData.length);
        print(inactiveQRCodeData[0].description);

        setState(() {
          loading = false;
        });
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: RefreshIndicator(
          onRefresh: () => _refreshData(context),
          child: Container(
            color: FlutterFlowTheme.of(context).primaryBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            all = false;
                            active = true;
                            inactive = false;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: 100,
                          decoration: BoxDecoration(
                              color: active
                                  ? FlutterFlowTheme.of(context).success
                                  : FlutterFlowTheme.of(context).accent4,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 2)
                              ]),
                          child: Center(
                            child: Text(
                              'Active',
                              style: TextStyle(
                                  color: FlutterFlowTheme.of(context).accent3),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            all = false;
                            active = false;
                            inactive = true;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: 100,
                          decoration: BoxDecoration(
                              color: inactive
                                  ? FlutterFlowTheme.of(context).success
                                  : FlutterFlowTheme.of(context).accent4,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 2)
                              ]),
                          child: Center(
                            child: Text(
                              'Inactive',
                              style: TextStyle(
                                  color: FlutterFlowTheme.of(context).accent3),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            all = true;
                            active = false;
                            inactive = false;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          width: 100,
                          decoration: BoxDecoration(
                              color: all
                                  ? FlutterFlowTheme.of(context).success
                                  : FlutterFlowTheme.of(context).accent4,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 2)
                              ]),
                          child: Center(
                            child: Text(
                              'All',
                              style: TextStyle(
                                  color: FlutterFlowTheme.of(context).accent3),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    child: TextFormField(
                      onTap: () {
                        _focusNode.requestFocus();
                      },
                      onTapOutside: (e) {
                        FocusScope.of(context).unfocus();
                      },
                      focusNode: _focusNode,
                      autofocus: true,
                      onChanged: (text) {
                        if (all) {
                          findDataById(id: text, dataList: allQRCodeData);
                          print(SearchedList.length);
                          print('s ${SearchedList[0].qrcodeId}');
                        }
                        if (active) {
                          findDataById(id: text, dataList: activeQRCodeData);
                          print(SearchedList.length);
                        }
                        if (inactive) {
                          findDataById(id: text, dataList: inactiveQRCodeData);
                          print(SearchedList.length);
                        }
                      },
                      controller: Controller,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Search for QR code',
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        suffix: InkWell(
                          splashColor: Colors.grey,
                          onTap: () {
                            SearchedList = [];
                            Controller.clear();
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                            Icons.clear,
                            size: 24.0,
                            color: Color(0xFFACB9C4),
                          ),
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.black),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Visibility(
                  visible: all,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'All QR Codes ($len)',
                    ),
                  ),
                ),
                Visibility(
                  visible: inactive,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Inactive QR Codes ($inaclen)',
                    ),
                  ),
                ),
                Visibility(
                  visible: active,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Text(
                      'Active QR Codes ($aclen)',
                    ),
                  ),
                ),
                Visibility(
                  visible: loading,
                  child: Center(child: CircularProgressIndicator()),
                ),
                Visibility(
                  visible: active &&
                      SearchedList.isEmpty &&
                      activeQRCodeData.isEmpty,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Center(
                        child: Text(
                      ' Theres NO Active QR Codes ',
                    )),
                  ),
                ),
                Visibility(
                  visible: all && SearchedList.isEmpty && allQRCodeData.isEmpty,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Center(
                        child: Text(
                      'NO QR Codes ',
                    )),
                  ),
                ),
                Visibility(
                  visible: inactive &&
                      SearchedList.isEmpty &&
                      inactiveQRCodeData.isEmpty,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Center(
                        child: Text(
                      'NO QR Codes ',
                    )),
                  ),
                ),
                Visibility(
                  visible: all && SearchedList.isEmpty,
                  child: Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          final qCode = allQRCodeData[index];
                          if (qCode.isActive != null && qCode.isActive!) {
                            return active_widget(
                              name: allQRCodeData[index].companyId,
                              id: allQRCodeData[index].qrcodeId,
                              type: allQRCodeData[index].isActive,
                              url: allQRCodeData[index].qrcodeImageUrl,
                              color: allQRCodeData[index].qrcodeColor,
                              productName: allQRCodeData[index].productName,
                              description: allQRCodeData[index].description,
                              delete: () {
                                widget.delete();
                              },
                              edit: () {
                                widget.edit();
                              },
                            );
                          } else {
                            return INactive_widget(
                                id: allQRCodeData[index].qrcodeId,
                                url: allQRCodeData[index].qrcodeImageUrl,
                                color: allQRCodeData[index].qrcodeColor,
                                delete: () {
                                  widget.delete();
                                });
                          }
                        },
                        itemCount: allQRCodeData.length),
                  ),
                ),
                Visibility(
                  visible: SearchedList.isNotEmpty,
                  child: Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) => active_widget(
                              name: SearchedList[index].companyId,
                              id: SearchedList[index].qrcodeId,
                              type: SearchedList[index].isActive,
                              url: SearchedList[index].qrcodeImageUrl,
                              color: SearchedList[index].qrcodeColor,
                              productName: activeQRCodeData[index].productName,
                              description: activeQRCodeData[index].description,
                              delete: () {
                                widget.delete();
                              },
                              edit: () {
                                widget.edit();
                              },
                            ),
                        itemCount: SearchedList.length),
                  ),
                ),
                Visibility(
                  visible: active && SearchedList.isEmpty,
                  child: Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) => active_widget(
                              name: activeQRCodeData[index].companyId,
                              id: activeQRCodeData[index].qrcodeId,
                              type: activeQRCodeData[index].isActive,
                              url: activeQRCodeData[index].qrcodeImageUrl,
                              color: activeQRCodeData[index].qrcodeColor,
                              productName: activeQRCodeData[index].productName,
                              description: activeQRCodeData[index].description,
                              delete: () {
                                widget.delete();
                              },
                              edit: () {
                                widget.edit();
                              },
                            ),
                        itemCount: activeQRCodeData.length),
                  ),
                ),
                Visibility(
                  visible: inactive && SearchedList.isEmpty,
                  child: Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => INactive_widget(
                          id: inactiveQRCodeData[index].qrcodeId,
                          url: inactiveQRCodeData[index].qrcodeImageUrl,
                          color: inactiveQRCodeData[index].qrcodeColor,
                          delete: () {
                            widget.delete();
                          }),
                      itemCount: inactiveQRCodeData.length,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  List<Data> SearchedList = [];

  void findDataById({required String id, required List<Data> dataList}) {
    if (id.isEmpty) {
    } else {
      // Filter the Data based on search text
      final filteredList = dataList.where((model) {
        // You can customize this condition based on your search requirements
        return model.qrcodeId!.toLowerCase().contains(id.toLowerCase());
      }).toList();

      if (filteredList != null && filteredList.isNotEmpty) {
        setState(() {
          SearchedList = filteredList;
          print(SearchedList.length);
          print('s ${SearchedList[0].qrcodeId}');
        });
      } else {
        // Handle case when no matching items are found
        print('Error');
      }
    }
  }

  Widget active_widget({
    required name,
    required id,
    required type,
    required url,
    required color,
    required productName,
    required description,
    required void Function() delete,
    required void Function() edit,
  }) =>
      InkWell(
        onTap: () {
          setState(() {
            FFAppState().qrCodeDetail = {
              'id': id,
              'url': url,
              'color': color,
              'name': productName,
              'description': description,
              'active': true
            };
            FFAppState().qrColor = color;
          });
          widget.navigateTo();
        },
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 2)
              ]),
          child: Center(
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 120,
                  decoration: BoxDecoration(
                    color: type ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          '${url ?? 'http://dowellfileuploader.uxlivinglab.online/qrCodes/qrcode_1693754729.jpg'}'),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'Name: ${productName}',
                          style: TextStyle(
                              fontSize: 10,
                              color: FlutterFlowTheme.of(context).alternate),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                        child: Text(
                          'Type: ${type}',
                          style: TextStyle(
                              fontSize: 10,
                              color: FlutterFlowTheme.of(context).alternate),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'ID: ${id}',
                          style: TextStyle(
                              fontSize: 10,
                              color: FlutterFlowTheme.of(context).alternate),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              FFAppState().qrCodeDetail = {
                                'id': id,
                                'url': url,
                                'color': color,
                                'name': productName,
                                'description': description,
                                'active': true
                              };
                              edit();
                            },
                            child: Icon(
                              Icons.edit_note_outlined,
                              size: 20,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {
                              FFAppState().qrCodeDetail = {
                                'id': id,
                                'url': url,
                                'color': color,
                                'name': productName,
                                'description': description,
                                'active': true
                              };
                              delete();
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        'share',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      );
  Widget INactive_widget({
    required id,
    required url,
    required color,
    required void Function() delete,
  }) =>
      InkWell(
        onTap: () {
          setState(() {
            FFAppState().qrCodeDetail = {
              'id': id,
              'url': url,
              'color': color,
              'active': false
            };
            FFAppState().qrColor = color;
          });
          widget.navigateTo();
        },
        child: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 2)
              ]),
          child: Center(
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          '${url ?? 'http://dowellfileuploader.uxlivinglab.online/qrCodes/qrcode_1693754729.jpg'}'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    ' ID: ${id}',
                    style: TextStyle(
                      fontSize: 12,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ),
      );
}
