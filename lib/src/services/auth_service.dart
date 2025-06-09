import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:meleva_la/src/services/shared_preferences.dart';
import 'package:meleva_la/src/services/token_manager.dart';
import 'api_service.dart';

class AuthService {
  final ApiService apiService = ApiService();

  final HttpClient _client = HttpClient();

  get responseJson => null;

  Future<Map<String, String>> defaultHeaders() async {
    final token = await TokenManager().getToken();
    if (token == null) {
      print("Erro ao obter token");
      return {};
    }

    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  Future<Map<String, dynamic>> doLogin({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("${apiService.url}/login");

    final bodyMap = {
      "email": email,
      "password": password,
    };

    final request = await _client.postUrl(url);
    print(request.connectionInfo);
    final body = jsonEncode(bodyMap);
    request.headers.contentType = ContentType("application", "json");
    request.add(utf8.encode(body));

    final response = await request.close();

    print(response.statusCode);

    if (response.statusCode == 200) {
      final responseBody = await utf8.decodeStream(response);
      final responseMap = jsonDecode(responseBody);
      print(responseMap);

      final token = responseMap['access_token'];

      await SharedPreference.setUser(
        email: bodyMap['email']!,
        password: bodyMap['password']!,
        token: token
      );

      print("Usuário salvo com sucesso no SharedPreference");
      return responseMap;
    } else {
      final errorResponse = await utf8.decodeStream(response);
      print("Erro: $errorResponse");
      throw Exception("Erro: Código ${response.statusCode}");
    }
  }
}