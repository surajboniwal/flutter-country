import 'package:country_list/controllers/country_controller.dart';
import 'package:country_list/models/Country.dart';
import 'package:country_list/widgets/country_item.dart';
import 'package:country_list/widgets/customappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomAppBar(),
            GetBuilder<CountryController>(
              init: Get.find<CountryController>(),
              builder: (controller) => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    Country country = controller.countries[index];
                    return CountryItem(country: country);
                  },
                  childCount: controller.countries.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
