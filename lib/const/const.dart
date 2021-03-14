import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController title = TextEditingController();
TextEditingController description = TextEditingController();

TextStyle titleStyle = GoogleFonts.gildaDisplay(
  fontSize: 30,
  color: Colors.deepPurple,
);

TextStyle editText = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontFamily: 'lato-Regular',
);

TextStyle displayText = GoogleFonts.singleDay(
  fontSize: 18,
  color: Colors.grey,
);
