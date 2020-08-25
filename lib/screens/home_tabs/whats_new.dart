import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/post_api.dart';
import 'package:news_app/models/post.dart';
import 'package:news_app/screens/single_post.dart';
class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( //عشان بتقدر تمرر الصفحة الي الانتهاء لان contiouبينتهي عند اخر شاشة ولا يمكن تمرير
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
          _drawRecentUpdata(),

        ],
      ),

    );

  }
  Widget _drawHeader(){
    return   GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return singlepost();
        } ));

      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.25,
        decoration: BoxDecoration(
          image:DecorationImage(
            image: ExactAssetImage('assets/images/a.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 48,right: 48),
              child: Text('How Terries & Royals',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(right: 34,left: 34),
              child: Text('Lorem ipsum dolor sit amer mohamk ali moh mohamed ',style: TextStyle(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
            )
          ],

        ),
      ),
    );
  }

 Widget _drawTopStories() {
  return Container(
    color: Colors.grey.shade100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[

        Padding(
          padding: const EdgeInsets.only(left: 16,top: 16),
          child:_drawSectionTitle('Top Stories'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: FutureBuilder(
            
              builder: (context,AsyncSnapshot snapShot){

                return  Column(
                  children: <Widget>[
                    _drawsSigleRow( ),
                    _drawDivider(),
                    _drawsSigleRow( ),
                    _drawDivider(),
                    _drawsSigleRow(),
                    _drawDivider(),
                  ],
                );

              },

            ),
          ),
        ),



       ] ),

    );


 }
 Widget _drawRecentUpdata() {
    return  Padding(
      padding: EdgeInsets.all(8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(left: 16,bottom: 8,top: 8),
            child: _drawSectionTitle('Recent Updata'),

          ),
          _drawRecentUpdataesCard(Colors.deepOrange),
          _drawRecentUpdataesCard(Colors.teal),
          SizedBox(
            height: 48,
          ),

        ],
      ),
    );

}
 Widget _drawsSigleRow(){
    return   Padding(
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

Widget  _drawDivider() {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey.shade100,
    );
}

 Widget _drawSectionTitle(String title) {

    return  Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w600,
        fontSize: 16


    ),);
 }

 Widget _drawRecentUpdataesCard(Color color) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/a.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.25,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16,left: 16),
            child: Container(
              padding: EdgeInsets.only(left: 24,top: 2,bottom:2,right:24),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),

              child: Text(
                'SPORT',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500


                ),



              ),

            ),
          ),
          Padding(
          padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
            child: Text(
              'Vettel is ferrari Number One -Hamilton',
              style: TextStyle(
                fontSize: 18,

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16,bottom:16,top: 16,right: 16),
            child: Row(
              children: <Widget>[
                Icon(Icons.timer,color: Colors.grey,size: 18,),
                SizedBox(
                  width: 4,
                ),
                Text('15 min',style: TextStyle(color: Colors.grey,fontSize: 14),),
              ],
            ),
          ),
        ],

      ),


    );
 }
}

