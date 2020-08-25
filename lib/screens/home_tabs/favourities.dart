import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> colorsList = [
    Colors.red,
    Colors.teal,
    Colors.deepOrange,
    Colors.indigo,
    Colors.brown,
    Colors.purple
  ];
  Random random = Random();

  Color _getRandomColor() {
    return colorsList[random.nextInt(colorsList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _authorRow(),
                SizedBox(height: 16,),
                _newsItemRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/a.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 16), //للمحيط الخارجي
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Michael Adams',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '15Min .',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'Life Style',
                      style: TextStyle(color: _getRandomColor()),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/images/a.png'), fit: BoxFit.cover),
        ),
        height: 124,
        width: 124,
        margin: EdgeInsets.only(right: 16),
      ),

      Expanded(
        child: Column(
          children: <Widget>[
            Text('Tech Tent: Old phones and safe social',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),),
            Text('aaaaaaaaaaavvvvvvvvvcccccccnnnnnnnnnmmmmmmmmkkkk',style: TextStyle(color: Colors.grey,fontSize: 16,height: 1.25),),
          ],
        ),
      ),
    ]);
  }
}
