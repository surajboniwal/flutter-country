import 'package:country_list/controllers/country_controller.dart';
import 'package:country_list/controllers/pref_controller.dart';
import 'package:country_list/models/Country.dart';
import 'package:country_list/widgets/country_item.dart';
import 'package:country_list/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomAppBar(showSearch: false),
            GetBuilder<PrefController>(
              init: Get.find<PrefController>(),
              builder: (controller) => controller.savedCountries.length > 0
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) {
                          Country country = controller.savedCountries[index];
                          return CountryItem(country: country);
                        },
                        childCount: controller.savedCountries.length,
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: Container(
                        height: 200,
                        child: Center(child: Text('No countries saved')),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
