import 'package:meleva_la/src/services/shared_preferences.dart';

class TokenManager {
  static final TokenManager _instance = TokenManager._internal();

  factory TokenManager() => _instance;
  TokenManager._internal();

  String? _token;

  Future<String?> getToken() async {
    if (_token != null) return _token;

    try {
      final userData = await SharedPreference.getUser();
      _token = userData['token'];
      return _token;
    } catch (e) {
      print("Erro ao recuperar o token: $e");
      return null;
    }
  }

  void clearTokenCache() {
    _token = null;
  }
}
