import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late final SharedPreferences prefs;

  initialization() async {
    prefs = await _prefs;
  }

  clearPreference() async {
    prefs.clear();
  }

  setStatus(int value) async {
    prefs.setInt("status", value);
  }

  setInt(key, value) async {
    prefs.setInt(key, value);
  }

  setString(key, value) async {
    prefs.setString(key, value);
  }

  setBool(key, value) async {
    prefs.setBool(key, value);
  }

  setList(key, value) async {
    prefs.setStringList(key, value);
  }

  setDouble(key, value) async {
    prefs.setDouble(key, value);
  }

  getData(String key) {
    return prefs.get(key);
  }
}
