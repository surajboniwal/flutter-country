import 'package:http/http.dart' as http;

class CountryRepo {
  static Future getCountries() async {
    http.Response response = await http.get(Uri.https('restcountries.eu', '/rest/v2/all'));
    return response.body;
  }
}
