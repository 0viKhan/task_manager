import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? body;
  final String? errorMessage;

  NetworkResponse(
      {required this.isSuccess, required this.statusCode, this.body, this.errorMessage});
}

class NetworkCaller {
  static const String _defaultErrorMessage='Something Went Wrong';
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, null);
      Response response = await get(uri);
      _logResponse(url, response);

      if (response.statusCode == 200) {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjson,
        );
      }
      else {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(

            isSuccess: false,
            statusCode: response.statusCode,
            errorMessage: decodedjson['data'] ?? _defaultErrorMessage,
        );
      }
    } catch (e) {
      return NetworkResponse(

          isSuccess: false,
          statusCode: -1,
          errorMessage:e.toString()
      );
    }
  }
  static Future<NetworkResponse> postRequest({required String url,Map<String,String>?body}) async {
    try {
      Uri uri = Uri.parse(url);
      _logRequest(url, body);
      Response response = await post(

          uri,
          headers: {
            'Content-Type': 'application/json',
          },



          body: jsonEncode(body));
      _logResponse(url, response);
      if (response.statusCode == 200) {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjson,
        );
      }
      else {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(

          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: decodedjson['data'] ?? _defaultErrorMessage,
        );
      }
    } catch (e) {
      return NetworkResponse(

          isSuccess: false,
          statusCode: -1,
          errorMessage:e.toString()
      );
    }

  }
  static void _logRequest(String url,Map<String,String>?body)
  {
 debugPrint('==============Request================\n'
 'Url:$url\n'
  'BODY:$body\n'
  '=================Response==============');

}
 static void _logResponse(String url,Response response)
  {
    debugPrint('===============Req===============\n'
        'Url:$url\n'
        'STATUS CODE:${response.statusCode}\n'
    'BODY:${response.body}\n'
        '==============Response=================');

  }
}
