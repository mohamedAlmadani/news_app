import 'package:flutter/material.dart';
class NavMenuItem{
  String title;
  Function destination;// ما يتم تنفيذه لحتي استدعاه

  NavMenuItem(this.title, this.destination);

}