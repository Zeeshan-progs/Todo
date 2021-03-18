import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// Text fields controllers 
TextEditingController title = TextEditingController();
TextEditingController description = TextEditingController();

// Firestore Instance
final reference = FirebaseFirestore.instance.collection('note');



// Styles 
TextStyle titleStyle = GoogleFonts.gildaDisplay(
  fontSize: 25,
  color: Colors.deepPurple,
);


// Text Fields style 
TextStyle editText = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontFamily: 'lato-Regular',
);

// Sugested Text 
TextStyle displayText = GoogleFonts.singleDay(
  fontSize: 18,
  color: Colors.grey,
);
