
import 'dart:convert';
import 'package:covid19/datasource.dart';
import 'package:covid19/mostaffectedcountry.dart';
import 'package:covid19/pages/countrypage.dart';
import 'package:covid19/pannels/infopanel.dart';
import 'package:covid19/pannels/worldwidepannel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    late Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get(Uri.parse("http://corona.lamao.ninja/all"));
    setState(() {
      worldData = json.decode(response.body);
    });
  }

    late List countryData;
  fetchCountryData() async {
    http.Response response = await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries?sort=cases'));
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  Future fetchData() async{
    fetchWorldWideData();
    fetchCountryData();
    print('fetch Data Called');
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryblack,
        title: const Text("COVID 19 TRACKER"),
      ),
      body: RefreshIndicator(
        onRefresh: fetchData,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.25,
                decoration: BoxDecoration(color: Colors.orange[100],),
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 10,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Text(
                      "worldwide",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CountryPage()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryblack,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.all(10),
                        child:  const Text(
                          "REGIONAL",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              worldData == null ? CircularProgressIndicator() : WorldWidePanel(
                worldData: worldData,),

               Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Most Affected Country",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
             SizedBox(height: 10,),
              countryData == null ? Container() : MostAffectedPanel(
                  CountryData: countryData),
              InfoPanel(),
              SizedBox(height: 20),
              const Text("WE ARE TOGETHER IN THE FIGHT",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}