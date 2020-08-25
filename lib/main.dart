import 'package:flutter/material.dart';
import 'package:news_app/screens/OnBoarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'utilities/app_theme.dart';




main() async{   //من dart
 SharedPreferences prefs = await SharedPreferences.getInstance();
 bool seen =prefs.getBool('seen');
 Widget _scrren;
 if(seen == null || seen == false){
   _scrren =OnBoarding();
 }else{
   _scrren =HomeScrean();
 }

  runApp(NewsApp(_scrren));//من فلاتر
}

class NewsApp extends StatelessWidget {
   final Widget _scrren;

  NewsApp(this._scrren);

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme, //بيستخدم مع materialApp ولون تاعه ع لاجميع صفحات التطبيق


      home: this._scrren ,
   );
  }
}
