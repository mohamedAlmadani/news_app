import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../pagemodel.dart';
import 'pagemodel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'home_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex =0;
  ValueNotifier<int>  _pageviewNotifier = ValueNotifier(0); //تغير قيمة




  List<PageModel> pages = List<PageModel>();
  void _addPages() {
    pages.add(PageModel(
      '1-Making friends is easy as waving your hand back and forth in easy step',
      Icons.ac_unit,
      'assets/images/bg.jpg',
      'Welcome',
    ));
    pages.add(PageModel(
      '2-Making friends is easy as waving your hand back and forth in easy step',
      Icons.access_alarm,
      'assets/images/bg1.jpg',
      'Alaem',
    ));
    pages.add(PageModel(
      '3-Making friends is easy as waving your hand back and forth in easy step',
      Icons.print,
      'assets/images/bg2.jpg',
      'print',
    ));
    pages.add(PageModel(
      '4-Making friends is easy as waving your hand back and forth in easy step',
      Icons.map,
      'assets/images/bg.jpg',
      'Map',
    ));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return Scaffold(
      body: Stack(
        //يأخذ childern وهو تاع سحب
        children: <Widget>[
          PageView.builder(
            //هو بيحتوي ع اكثر من عنصر
            // ignore: missing_return
            itemBuilder: (context, index) {
              return Stack(
                //طبقة تانية للصورة يعني الأكون والنص
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(
                            pages[index].image,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        //للرفع صورة الي اعلي بالستخدام offset وبيعتمد ع اكس وواي
                        child: Icon(
                          pages[index].icon,
                          size: 150,
                          color: Colors.white,
                        ),
                        offset: Offset(0, -150),
                      ),
                      Text(
                        pages[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 48, right: 48, top: 18),
                        child: Text(
                          pages[index].description,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages
                .length, //اتم بيلدر سيتم استدعها 4 مرات و4 من انديكس و4 صفحات معناها
            onPageChanged: (index){ //عشان لم بدك اشي يتحرك ع جميع الصغحات مسلا دائرة الحمراء تتحرك ع جميع الصفحات
              _pageviewNotifier.value=index;
            },
          ),
          Transform.translate(
            offset: Offset(0, 175),

            child: Align(
              alignment: Alignment.center,
              child:_displaypageIndicators(pages.length),

            ),

    ),


          Align(
            //محادات
            alignment: Alignment.bottomCenter, //أسفل النص
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0, left: 16, right: 16),
              child: SizedBox(
                width: double.infinity, //كامل العرض
                height: 50,
                child: RaisedButton(
                  color: Colors.red.shade900,
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () {
                  Navigator.push( //ادفع صفحة جدبدة بس لأمام
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        //TODO: updata seen //لازم اخبر التطبيق  انو ترا المستخدم شاف هاده الشاشة
                        //ليكن بإسم seen يعطيني هل المستخدم شاهد هذه الصفحات ام لا لهذا قمنا باستخدام البلگن shared prefrences
                        _updataSeen();
                        return HomeScrean();


                      },

                  ),
                  );





                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget _displaypageIndicators( int length){
  return PageViewIndicator(
    pageIndexNotifier: _pageviewNotifier,
    length: length,
    normalBuilder: (animationController, index) => Circle(
      size: 8.0,
      color: Colors.grey,
    ),
    highlightedBuilder: (animationController, index) => ScaleTransition(
      scale: CurvedAnimation(
        parent: animationController,
        curve: Curves.ease,
      ),
      child: Circle(
        size: 12.0,
        color: Colors.red,
      ),
    ),
  );


}

  void _updataSeen()  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);//يقوم بتخزين قيمة true في مفتاح seen
  }

}
