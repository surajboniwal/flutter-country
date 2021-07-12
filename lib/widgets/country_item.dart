import 'package:country_list/controllers/pref_controller.dart';
import 'package:country_list/models/Country.dart';
import 'package:country_list/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({
    Key key,
    @required this.country,
  }) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(CountryScreen(country: country), fullscreenDialog: true);
      },
      title: Text(country.name),
      subtitle: Text(country.alpha3Code),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://flagpedia.net/data/flags/h80/${country.alpha2Code.toLowerCase()}.png',
        ),
        backgroundColor: Colors.transparent,
      ),
      trailing: GetBuilder<PrefController>(
        init: Get.find<PrefController>(),
        builder: (controller) => IconButton(
          icon: controller.checkCountrySaved(country) ? Icon(Icons.bookmark, color: Colors.blue) : Icon(Icons.bookmark_outline),
          onPressed: () {
            print(country.name);
            controller.toggleCountrySave(country);
          },
        ),
      ),
    );
  }
}
