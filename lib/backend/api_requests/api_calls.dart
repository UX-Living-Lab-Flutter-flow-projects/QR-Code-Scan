import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LogoutCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Logout',
      apiUrl: 'https://100014.pythonanywhere.com/api/mobilelogout/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostQRCodeApiCall {
  static Future<ApiCallResponse> call({
    String? companyId = '',
    String? quantity = '',
    String? qrcodeType = '',
    String? logo = '',
    String? link = '',
    String? createdBy = '',
    String? description = '',
  }) async {
    final ffApiRequestBody = '''
{
  "qrcode_type": "${qrcodeType}",
  "quantity": "${quantity}",
  "logo": "${logo}",
  "description": "${description}",
  "company_id": "${companyId}",
  "link": "${link}",
  "created_by": "${createdBy}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PostQRCodeApi',
      apiUrl:
          'https://100099.pythonanywhere.com/api/v2/qr-code/?api_key=70336876-a9e6-4d2f-97d8-c6fc7758375c',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PostQRCodeApiVONECall {
  static Future<ApiCallResponse> call({
    String? companyId = '',
    String? quantity = '',
    String? qrcodeType = '',
    String? logo = '',
    String? link = '',
    String? createdBy = '',
    String? description = '',
    String? masterLink = '',
    String? productName = 'tv',
    String? name = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PostQRCodeApiVONE',
      apiUrl:
          'https://www.qrcodereviews.uxlivinglab.online/api/v1/qr-code/?created_by=${name}',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'master_link':
            "https://100099.pythonanywhere.com/api/v1/qr-code/?api_key=70336876-a9e6-4d2f-97d8-c6fc7758375c",
        'created_by': createdBy,
        'link': "https://100099.pythonanywhere.com/api/v1/inactive",
        'company_id': companyId,
        'description': description,
        'quantity': "1",
        'qrcode_type': "Link",
        'product_name': productName,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GETQRCodeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETQRCode',
      apiUrl:
          'https://100099.pythonanywhere.com/api/v2/qr-code/?api_key=70336876-a9e6-4d2f-97d8-c6fc7758375c',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.response.data[:].product_name''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.response.data[:]._id''',
        true,
      );
  static dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.response.data[:].create_by''',
        true,
      );
}

class GETQRCodevOneCall {
  static Future<ApiCallResponse> call({
    String? name = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GETQRCodevOne',
      apiUrl:
          'https://www.qrcodereviews.uxlivinglab.online/api/v1/qr-code/?created_by=${name}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.response.data[:].api_key''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.response.data[:]._id''',
        true,
      );
  static dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.response.data[:].created_by''',
        true,
      );
  static dynamic len(dynamic response) => getJsonField(
        response,
        r'''$.response.data.length''',
      );
}

class GetQrCodeByIdCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: ' GetQrCodeById',
      apiUrl:
          'https://www.qrcodereviews.uxlivinglab.online/api/v1/update-qr-code/${id}/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PUTUpdateQRCodeApiVONECall {
  static Future<ApiCallResponse> call({
    String? qrcodeColor = '',
    String? id = '',
  }) async {
    final ffApiRequestBody = '''
{
  "qrcode_color": "${qrcodeColor}",
  "master_link": "https://ll05-ai-dowell.github.io/100107-DowellEmailExtractor/",
  "description": "This is my description",
  "product_name": "Product name"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PUTUpdateQRCodeApiVONE',
      apiUrl:
          'https://www.qrcodereviews.uxlivinglab.online/api/v1/update-qr-code/${id}/',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class PUTProductCall {
  static Future<ApiCallResponse> call({
    String? qrColor = '',
    String? id = '',
    String? description = 'Product Description',
    String? productName = 'Product Name',
    bool? isActive,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PUTProduct',
      apiUrl:
          'https://www.qrcodereviews.uxlivinglab.online/api/v1/update-qr-code/${id}/',
      callType: ApiCallType.PUT,
      headers: {},
      params: {
        'description': description,
        'product_name': productName,
        'qrcode_color': qrColor,
        'master_link':
            "https://ll05-ai-dowell.github.io/100107-DowellEmailExtractor/\'",
        'is_active': isActive,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ActiveQrCodeCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ActiveQrCode',
      apiUrl:
          'https://www.qrcodereviews.uxlivinglab.online/api/v1/activate-qr-code/${id}/',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DummyUpdateApiCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? email = '',
    String? phone = '',
    String? country = '',
    String? city = '',
    String? firstName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${username}",
  "first_name" : "",
  "email": "${email}",
  "phone": "${phone}",
  "country": "${country}",
  "city":"${city}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'dummy update api',
      apiUrl: 'https://100014.pythonanywhere.com/api/profile_update/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
