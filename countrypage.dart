import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key}) : super(key: key);

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  late List countryData;
  fetchCountryData() async {
    http.Response response = await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Country States"),
      ),
      body: countryData==null?Container(child: CircularProgressIndicator(),):ListView.builder(
          itemCount: countryData == null ? 0 : countryData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 130,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0,10)
                  )
                ]
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(countryData[index]['country'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Image.network(countryData[index]['country info']['flag'],
                          height: 40,  width: 50,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container(
                    child: Column(
                      children: [
                        Text('CONFIRMED:' +countryData[index]['cases'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                        ),
                        Text('ACTIVE:' +countryData[index]['active'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                        ),
                        Text('RECOVERED:' +countryData[index]['cases'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            )
                        ),
                        Text('CONFIRMED:' +countryData[index]['cases'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            )
                        ),

                      ],
                    ),
                  ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
