import 'package:country_list/controllers/country_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
    this.showSearch = true,
  }) : super(key: key);

  final bool showSearch;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: showSearch ? 120.0 : 55.0,
      flexibleSpace: showSearch
          ? FlexibleSpaceBar(
              background: Column(
                children: <Widget>[
                  SizedBox(height: 55),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 40.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: CupertinoTextField(
                              keyboardType: TextInputType.text,
                              placeholder: 'Search by country name or code',
                              placeholderStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xffC4C6CC),
                                  fontSize: 14.0,
                                ),
                              ),
                              prefix: Padding(
                                padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xffC4C6CC),
                                ),
                              ),
                              onChanged: (val) => {Get.find<CountryController>().search(val.toLowerCase())},
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xffF0F1F5),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.sort),
                            onPressed: () {
                              Get.defaultDialog(
                                title: 'Select sort',
                                titleStyle: TextStyle(fontSize: 16.0),
                                radius: 4.0,
                                content: SingleChildScrollView(
                                  child: GetBuilder<CountryController>(
                                    init: Get.find<CountryController>(),
                                    builder: (controller) => Column(
                                      children: [
                                        ListTile(
                                          selected: controller.isSortedByName,
                                          title: Text(
                                            'Sort by country name',
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                          onTap: () {
                                            Get.back();
                                            controller.sort(true);
                                          },
                                        ),
                                        ListTile(
                                          selected: !controller.isSortedByName,
                                          title: Text(
                                            'Sort by country code',
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                          onTap: () {
                                            Get.back();
                                            controller.sort(false);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(),
      floating: true,
      title: Text(
        'CountrySide',
        style: GoogleFonts.caveat(
          textStyle: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
