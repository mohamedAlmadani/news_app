
import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

import 'home_tabs/favourities.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whats_new.dart';
class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();

}

class _HeadLineNewsState extends State<HeadLineNews> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    //تحديث الحالة وتتبع index كمان
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Headline News'),
          centerTitle: false,
          //لانو طبيعة الأيفون بيأتي النص في النص ونمنع ذالك عن طريق هاد الاشي
          actions: <Widget>[
            //عشان نتعامل من يمين appbar واما leading من يسار  AppBar
            IconButton(icon: Icon(Icons.search), onPressed: () {},),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {},),

          ],
          bottom: TabBar(
            indicatorColor: Colors.white,

            tabs: [
              Tab(text: 'WHATS NEW',),
              Tab(text: 'POPULAR',),
              Tab(text: 'FAVOURITES',),

            ],
            controller: _tabController,
          ),

        ),

        drawer: NavigationDrawer(),
        body: Center(
            child: TabBarView(children: <Widget>[
              Favourites(),
              Popular(),
              Favourites(),


            ], controller: _tabController,)
        ),


      );
    }
  }





