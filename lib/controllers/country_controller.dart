import 'package:country_list/models/Country.dart';
import 'package:country_list/repo/country_repo.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  List<Country> countries = [];
  List<Country> countriesOrig = [];
  bool isSortedByName = true;

  Future<bool> getCountries() async {
    try {
      countries = countryFromJson(await CountryRepo.getCountries());
      countriesOrig = countries;
      if (countries.length == 0) return false;
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  void search(query) {
    countries = countriesOrig.where((element) => element.name.toLowerCase().contains(query) || element.alpha3Code.toLowerCase().contains(query)).toList();
    update();
  }

  void sort(sortByName) {
    if (sortByName) {
      isSortedByName = true;
      countries.sort((a, b) => a.name.compareTo(b.name));
    } else {
      isSortedByName = false;
      countries.sort((a, b) => a.alpha3Code.compareTo(b.alpha3Code));
    }
    update();
  }
}
