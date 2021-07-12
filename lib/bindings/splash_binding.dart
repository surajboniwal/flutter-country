import 'package:country_list/controllers/country_controller.dart';
import 'package:country_list/controllers/pref_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CountryController(), permanent: true);
    Get.put(PrefController(), permanent: true);
  }
}
