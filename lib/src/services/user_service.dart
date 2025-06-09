import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:meleva_la/src/services/shared_preferences.dart';
import 'package:meleva_la/src/services/token_manager.dart';
import 'api_service.dart';

class UserService {
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

  Future<List<dynamic>> getUsers() async {
    final url = Uri.parse("${apiService.url}/users");

    final request = await _client.getUrl(url);
    final headers = await defaultHeaders();
    headers.forEach((key, value) {
      request.headers.set(key, value);
    });

    final response = await request.close();

    print(response.statusCode);

    if (response.statusCode == 200) {
      final responseBody = await utf8.decodeStream(response);
      final responseMap = jsonDecode(responseBody);
      print(responseMap);
      return responseMap;
    } else {
      final errorResponse = await utf8.decodeStream(response);
      print("Erro: $errorResponse");
      throw Exception("Erro: Código ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> getUserById({
    required String id
  }) async {
    final url = Uri.parse("${apiService.url}/users/$id");

    final request = await _client.getUrl(url);
    final headers = await defaultHeaders();
    headers.forEach((key, value) {
      request.headers.set(key, value);
    });

    final response = await request.close();

    print(response.statusCode);

    if (response.statusCode == 200) {
      final responseBody = await utf8.decodeStream(response);
      final responseMap = jsonDecode(responseBody);
      print(responseMap);
      return responseMap;
    } else {
      final errorResponse = await utf8.decodeStream(response);
      print("Erro: $errorResponse");
      throw Exception("Erro: Código ${response.statusCode}");
    }
  }
}