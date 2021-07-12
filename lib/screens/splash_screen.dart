import 'dart:io';

import 'package:country_list/controllers/country_controller.dart';
import 'package:country_list/controllers/pref_controller.dart';
import 'package:country_list/screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      InternetAddress.lookup('google.com').then((value) {
        if (value.isNotEmpty && value[0].rawAddress.isNotEmpty) {
          Get.find<CountryController>().getCountries().then((value) {
            if (value) {
              Get.find<PrefController>().initSharedPrefs().then((val) {
                if (val) {
                  Get.off(NavScreen());
                } else {
                  print('Some error occured');
                }
              });
            } else {
              print('Some error occured');
            }
          });
        }
      });
    } on SocketException catch (_) {
      Get.find<PrefController>().initSharedPrefs().then((val) {
        if (val) {
          Get.off(NavScreen());
        } else {
          print('Some error occured');
        }
      });
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/splash.jpeg',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: Get.height / 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Country Side",
                  style: GoogleFonts.caveat(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 46.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                CircularProgressIndicator(
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
