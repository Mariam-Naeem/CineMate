
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocalStorage {
  final SharedPreferences _prefs;

  LocalStorage(this._prefs);

  Future<bool> setString({required String key, required String value}) async {
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool({required String key, required bool value}) async {
    return await _prefs.setBool(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }
}