import 'dart:convert';

import 'package:country_list/models/Country.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefController extends GetxController {
  SharedPreferences prefs;
  List<Country> savedCountries = [];

  Future<bool> initSharedPrefs() async {
    try {
      prefs = await SharedPreferences.getInstance();
      var saved = prefs.getString('saved');
      if (saved != null) savedCountries = countryFromJson(saved);
      if (prefs == null) return false;
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  toggleCountrySave(country) {
    if (savedCountries.contains(country)) {
      savedCountries.remove(country);
    } else {
      savedCountries.add(country);
    }
    prefs.setString('saved', countryToJson(savedCountries));
    update();
    print(savedCountries.length);
  }

  clearSaved() {
    prefs.clear();
  }

  checkCountrySaved(country) {
    if (savedCountries.contains(country)) {
      return true;
    }
    return false;
  }
}
