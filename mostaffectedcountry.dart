import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {

  final List CountryData;
  const MostAffectedPanel({Key? key, required this.CountryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView.builder(
        shrinkWrap: true,
          itemBuilder: (context ,index){
            return Container(
              child: Row(
                children: [
                  Image.network(CountryData[index]['CountryInfo']['flag'],height: 30,),
                  const SizedBox(width: 10),
                  Text(CountryData[index]['country'],style: const TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(width: 10),
                  Text('Deathes:' +CountryData[index]['Deathes'],
                  style:  TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
            );
          },
          itemCount: 5,
      ),
    );
  }
}
