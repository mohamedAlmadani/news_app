import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/categories_api.dart';
import 'package:news_app/api/post_api.dart';
import 'package:news_app/pages/about.dart';
import 'package:news_app/pages/contact.dart';
import 'package:news_app/pages/help.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
import 'home_tabs/whats_new.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/favourities.dart';





class HomeScrean extends StatefulWidget {
  @override
  _HomeScreanState createState() => _HomeScreanState();
}

enum PopoutMenu { HELP, ABOUT, CONTACT }

class _HomeScreanState extends State<HomeScrean>
    with SingleTickerProviderStateMixin {

  //عشان vsync
  TabController _tabController;
 CategoriesAPI categoriesAPI =CategoriesAPI();
  @override
  void initState() {
    //تحديث الحالة وتتبع index كمان
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    //vsync : خاصية الرسم وشاشة تتحدث 60مرة في تانية
  }

  @override
  void dispose() {
    //عشان ما يعلق التحكم
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        centerTitle:
            false, //لانو طبيعة الأيفون بيأتي النص في النص ونمنع ذالك عن طريق هاد الاشي
        actions: <Widget>[
          //عشان نتعامل من يمين appbar واما leading من يسار  AppBar
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          _popOutMenu(context),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: 'WHATS NEW',
            ),
            Tab(
              text: 'POPULAR',
            ),
            Tab(
              text: 'FAVOURITES',
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
          child: TabBarView(
        children: <Widget>[
          WhatsNew(),
          Popular(),
          Favourites(),
        ],
        controller: _tabController,
      )),
    );
  }

  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopoutMenu>(
        itemBuilder: (context) {
          return [
            PopupMenuItem<PopoutMenu>(
              value: PopoutMenu.ABOUT,

                  child: Text('ABOUT'),

),
            PopupMenuItem<PopoutMenu>(
              value: PopoutMenu.CONTACT,
              child: Text('CONTACT'),
            ),
            PopupMenuItem<PopoutMenu>(
              value: PopoutMenu.HELP,
              child: Text('HELP'),
            ),
          ];
        },
        onSelected: (PopoutMenu mena) {
          switch (mena) {
            case PopoutMenu.ABOUT:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AboutUs();
              }));

              break;
            case PopoutMenu.CONTACT:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ContactUs();
              }));
              break;
            case PopoutMenu.HELP:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HelpUs();
              }));
              break;
          }
        },
        icon: Icon(Icons.more_vert));
  }
}
