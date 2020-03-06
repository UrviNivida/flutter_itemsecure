import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';



class Prefs {
  final String _kNotificationsPrefs = "allowNotifications";
  final String _kSortingOrderPrefs = "sortOrder";
  final String _LoggedIn = "0";
  final String _SelectedDate = "0";
  final String _lastTimeOutTime = "0";
  final _lastTimeOutDuration = 0;
  final _switchbtntime = false;


  getLoginData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  setLoginData(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }


  Future<String> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(_LoggedIn) ?? '0';
  }
  /// ----------------------------------------------------------
  /// Method that saves the user decision on sorting order
  /// ----------------------------------------------------------
  Future<bool> setLoggedIn(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_LoggedIn, value);
  }

  Future<String> getSelectedDate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_SelectedDate) ?? '0';
  }

  Future<bool> setSelectedDate(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_SelectedDate, value);
  }

  Future<String> getLastTimeOutTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_lastTimeOutTime) ?? '0';
  }

  Future<bool> setLastTimeOutTime(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_lastTimeOutTime, value);
  }


  Future<int> getLastTimeOutDuration() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('_lastTimeOutDuration') ?? 0;
  }

  Future<bool> setLastTimeOutDuration(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt('_lastTimeOutDuration', value);
  }

  Future<bool> getSwitchBtnTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('_switchbtntime') ?? false;
  }

  Future<bool> setSwitchBtnTime(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('_switchbtntime', value);
  }


//  // read
//  final myInt = prefs.getInt('my_int_key') ?? 0;
//// write
//  prefs.setInt('my_int_key', 42);

























//  /// ------------------------------------------------------------
//  /// Method that returns the user decision to allow notifications
//  /// ------------------------------------------------------------
//  Future<bool> getAllowsNotifications() async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    return prefs.getBool(_kNotificationsPrefs) ?? false;
//  }
//  /// ----------------------------------------------------------
//  /// Method that saves the user decision to allow notifications
//  /// ----------------------------------------------------------
//  Future<bool> setAllowsNotifications(bool value) async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    return prefs.setBool(_kNotificationsPrefs, value);
//  }
//  /// ------------------------------------------------------------
//  /// Method that returns the user decision on sorting order
//  /// ------------------------------------------------------------
//  Future<String> getSortingOrder() async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//    return prefs.getString(_kSortingOrderPrefs) ?? 'name';
//  }
//  /// ----------------------------------------------------------
//  /// Method that saves the user decision on sorting order
//  /// ----------------------------------------------------------
//  Future<bool> setSortingOrder(String value) async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    return prefs.setString(_kSortingOrderPrefs, value);
//  }


}



/*  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }*/