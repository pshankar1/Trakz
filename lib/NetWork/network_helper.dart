import 'dart:convert';

import 'package:firebase_signin/NetWork/network_enum.dart';
import 'package:firebase_signin/NetWork/network_typedef.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  const NetworkHelper._();

  static String concatUrlQP(String url, Map<String, String>? queryParameters) {
    if (url.isEmpty) return url;
    if (queryParameters == null || queryParameters.isEmpty) {
      return url;
    }
    final StringBuffer stringBuffer = StringBuffer("$url");
    queryParameters.forEach((key, value) {
      if (value.trim() == '') return;
      if (value.contains(' ')) throw Exception('Invalid Input Exception');
      stringBuffer.write('$key=$value');
    });
    final result = stringBuffer.toString();
    return result.substring(0, result.length - 1);
  }

  static bool _isValidResponse(json) {
    return json != null;
  }

  static R filterResponse<R>(
      {required NetworkCallBack callBack,
      required http.Response? response,
      required NetworkOnFailureCallBackWithMesasge onFailureCallBackWithMesasge,
      CallBackParameterName parameterName = CallBackParameterName.all}) {
    try {
      if (response == null || response.body.isEmpty) {
        return onFailureCallBackWithMesasge(
            NetworkResponseErrorType.responseEmpty, 'empty response');
      }
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (_isValidResponse(json)) {
          return callBack(parameterName.getJson(json));
        }
      } else if (response.statusCode == 1708) {
        return onFailureCallBackWithMesasge(
            NetworkResponseErrorType.socket, 'socket');
      }
      return onFailureCallBackWithMesasge(
          NetworkResponseErrorType.didNotSucceed, 'did not succeed');
    } catch (e) {
      return onFailureCallBackWithMesasge(
          NetworkResponseErrorType.exception, 'Exception $e');
    }
  }
}
