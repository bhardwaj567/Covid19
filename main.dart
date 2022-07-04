import 'package:covid19/datasource.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily:GoogleFonts.flowCircular().fontFamily,
      backgroundColor: primaryblack,
    ),
    home:  HomePage(),
  ));
}