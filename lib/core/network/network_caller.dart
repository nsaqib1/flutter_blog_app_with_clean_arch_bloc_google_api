import 'dart:convert';

import 'package:flutter_bog_app_with_clean_arch_bloc_blogger_api/core/network/api_key.dart';

import 'network_response.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    final String urlWithKey = "$url?key=$apiKey";
    try {
      final Response response = await get(Uri.parse(urlWithKey));
      print(response.statusCode);
      return NetworkResponse(
        statusCode: response.statusCode,
        isSuccess: true,
        response: jsonDecode(response.body),
      );
    } catch (e) {
      print(e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        response: {},
        errorMessage: e.toString(),
      );
    }
  }
}
