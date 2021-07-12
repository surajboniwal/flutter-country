import 'package:country_list/models/Country.dart';
import 'package:country_list/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({
    Key key,
    this.country,
  }) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'CountrySide',
          style: GoogleFonts.caveat(
            textStyle: TextStyle(fontSize: 24.0),
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 40.0),
              Container(
                height: 110.0,
                width: 160.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                      color: Colors.grey,
                    ),
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://flagpedia.net/data/flags/w160/${country.alpha2Code.toLowerCase()}.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  country.name,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text('')),
                  DataColumn(label: Text('')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Capital')),
                      DataCell(Text(country.capital)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Code')),
                      DataCell(Text(country.alpha3Code)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Region')),
                      DataCell(Text(country.region.toString().split('.')[1])),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Subregion')),
                      DataCell(Text(country.subregion)),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Population')),
                      DataCell(Text(country.population.toString())),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              CustomButton(
                text: 'View in Google Maps',
                icon: Icons.map,
                onTap: () {
                  _displayMap();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _displayMap() {
    Get.bottomSheet(
      ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.0),
          topLeft: Radius.circular(24.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(country.latlng[0], country.latlng[1]),
              zoom: 4.0,
            ),
          ),
        ),
      ),
    );
  }
}
