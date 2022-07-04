import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

   WorldWidePanel({super.key, required this.worldData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics:  NeverScrollableScrollPhysics(),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
              childAspectRatio: 2,
        ),
        children:  [
          StatusPanel(
            title: 'CONFIRMED',
            textColor: Colors.red,
            count: worldData['cases'].toString(),
            panelColor: Colors.deepOrangeAccent,
          ),
          StatusPanel(
            panelColor: Colors.lightBlueAccent ,
            textColor: Colors.blue,
            title: 'ACTIVE',
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.greenAccent,
            textColor: Colors.green,
            title: 'RECOVERED',
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(
            panelColor: Colors.black45,
            textColor: Colors.grey,
            title: 'DEATHS',
             count: worldData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}
class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

   StatusPanel({Key? key, required this.panelColor, required this.textColor, required this.title, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10.0),
     decoration: BoxDecoration( color: panelColor,),
      height: 80, width: width/2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textColor,
            ),
          ),
          Text(
            count,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
