import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static final _secureStorage = FlutterSecureStorage();

  static const String _userEmail = "_userEmail";
  static const String _userToken = "_userToken";

  static const String _userPassword = "_userPassword";

  static Future<void> setUser({
    required String email,
    required String password,
    required String token,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setString(_userEmail, email);
    await pref.setString(_userToken, token);
    await _secureStorage.write(key: _userPassword, value: password);
  }

  static Future<Map<String, String>> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String email = pref.getString(_userEmail) ?? '';
    String token = pref.getString(_userToken) ?? '';
    String password = await _secureStorage.read(key: _userPassword) ?? '';

    return {
      'email': email,
      'password': password,
      'token': token,
    };
  }

  static Future<void> clear() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_userEmail);
    await preferences.remove(_userToken);
    await _secureStorage.delete(key: _userPassword);
  }

  static Future<bool> isUserLogged() async {
    final pref = await SharedPreferences.getInstance();
    final email = pref.getString(_userEmail);
    final token = pref.getString(_userToken);

    return email != null && token != null;
  }
}