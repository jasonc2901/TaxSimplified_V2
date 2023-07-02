import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get_it.dart';

class SharedPrefs extends ChangeNotifier {
  Future<SharedPreferences>? _prefsInstance;

  SharedPrefs() {
    _init();
  }

  Future<void> _init() async {
    _prefsInstance = SharedPreferences.getInstance();
    await _prefsInstance;
    getIt.signalReady(this);
    notifyListeners();
  }

  Future<bool> getBool(String key, [bool elseValue = false]) async {
    var prefs = await _prefsInstance;
    return prefs?.getBool(key) ?? elseValue;
  }

  Future<bool> setBool(String key, bool value) async {
    var prefs = await _prefsInstance;
    return prefs?.setBool(key, value) ?? Future<bool>.value(false);
  }
}
