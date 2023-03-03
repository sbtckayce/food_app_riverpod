import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
ThemeData theme(){
 return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Ubuntu',
    textTheme: textTheme(),
    
  );
  
}
TextTheme textTheme() {
  return  const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
   
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    
      fontSize: 22,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
    fontWeight: FontWeight.normal,
   
      fontSize: 18,
    ),
   
    bodyLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      height: 1.75,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
     bodySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 12,
    ),
  );
}