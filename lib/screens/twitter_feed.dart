import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';
class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feeds',),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, size: 28,), onPressed: () {},)
        ],


      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Card(
            child: Column(
              children: <Widget>[
                _cardHeader(),

                _cardBody(),
                _drawLine(),
                _cardFooter(),
              ],
            ),


          ),
        );
      }, itemCount: 28,),

    );
  }

  Widget _cardHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/a.png'),
            radius: 24,),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Row(
              children: <Widget>[
                Text('vvhvvjhgjjgjggj', style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),),
                Text('@ffffffff', style: TextStyle(
                  color: Colors.grey,
                ),),

              ],
            ),
            SizedBox(height: 8,),
            Text('fri,12,may 2017', style: TextStyle(color: Colors.grey),),
          ],
        ),

      ],

    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Text('gjhfmkfhfjfkglgkgjhhlhkhjhkhfdsddddddddddddddddddddd'),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.repeat),
                color: Colors.orange,
                onPressed: () {},),
              Text('25', style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),),

            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(onPressed: () {},
                child: Text('SHARE', style: TextStyle(color: Colors.orange),),),
              FlatButton(onPressed: () {},
                child: Text('Open', style: TextStyle(color: Colors.orange)),),
            ],
          ),
        ],
      ),

    );
  }

  Widget _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top: 16),
    );
  }
}