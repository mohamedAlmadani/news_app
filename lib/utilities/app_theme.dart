import 'package:flutter/material.dart';



class AppTheme{

//لماذا استخدمنا staticلانو  عشان ما استخدم نسخة جديدة من apptheme عشان استخدم AppTheme.AppTheme
  static ThemeData appTheme = ThemeData(
    primaryColor: Colors.red.shade800,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red.shade800,
    ),



  );


}