import 'package:flutter/material.dart';
class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,position) {
          return Card(
            child:_drawsSigleRow(),
          );

        },
        itemCount: 20,
        );

  }
  Widget _drawsSigleRow() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            child: Image(image: ExactAssetImage('assets/images/a.png'),
              fit: BoxFit.cover,

            ),
            height: 124,
            width: 124,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded( //  أخذ قياس معين sizrboxوcoumnتاني حصرناه  بالاكسبندد ولها قدرة تحتسب بقية المساحة
            child: Column(
              children: <Widget>[
                Text('The word global warming annual summit',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,

                  ),

                ),
                SizedBox(
                  height: 18,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Maicael Adams'),
                    Row(
                      children: <Widget>[
                        Icon(Icons.timer),
                        Text('15 min'),
                      ],
                    ),
                  ],
                ),
              ],


            ),
          ),

        ],
      ),
    );
  }
}
