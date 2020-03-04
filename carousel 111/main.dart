import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Hello Dot Dart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black12,

      body: 
      WavyHeaderImage(), //
    );
  }
}


class  WavyHeaderImage extends StatefulWidget {
  @override
  _WavyHeaderImageState createState() => _WavyHeaderImageState();
}

class _WavyHeaderImageState extends State<WavyHeaderImage> with SingleTickerProviderStateMixin{

   Color bgcolor = Color(0xFF060B43); //#060B43 
   bool showPop = false;
  PageController _pgCtr;
  int curntPage = 1;
  List sliderCards = ["Hello","hello ","Can You ","Hear ","Me","As ","Scream ","Your","Name",];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pgCtr = PageController(
      viewportFraction: .85,
      initialPage: curntPage,

    );
    // _pgCtr.addListener((){
    //   int nextPg = _pgCtr.page.round();
    //   if(curntPage != nextPg){
    //     setState(() {
    //      curntPage = nextPg; 
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height; 



   return Scaffold(
     backgroundColor: bgcolor,
          body: ListView(
            children: <Widget>[
              SizedBox(height: mheight*.15,),
              Center(
                    child: Container(
                    //   color: Colors.white,
                    //width: mwidth*.8,
                    height: mheight*.7,                      
                    child: PageView.builder(
                    controller: _pgCtr,
                    onPageChanged: (newPage){
                        setState(() {
                          print("Current page $curntPage");
                         curntPage = newPage;
                         print("New Current page $curntPage");

                        });
                      },
                      itemCount: sliderCards.length,
                      itemBuilder: (context, index){
                          return _buildContentPage(index, curntPage == index?true:false);
                                  },                          
                                ),
                                ),
                              ),      
                            ],
                            ),    
                            );
                            }

          



            Widget _buildContentPage(int index,isActive,) {
              double mwidth = MediaQuery.of(context).size.width; 
              double mheight = MediaQuery.of(context).size.height;
              final double blur = isActive? 30:0;
              final double offset = isActive? 20:0;
              final double top = isActive? 10:50;
              final double bottom = isActive? 20:5;

              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOutQuint,
                margin: EdgeInsets.only(top: top,bottom: bottom,right: 10,left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(
                    color: Colors.black87,
                    blurRadius: blur,
                    //offset: Offset(offset, offset),
                  )],
                ),
                child: Padding(
                padding: EdgeInsets.fromLTRB(
                  0.0,0,0.0,0.0
                  //10.0,isActive?0:40,10.0,0.0
                  ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color:index%2 == 0?Colors.green:Colors.deepOrange,
                    height: mheight*.7,
                  ),
                ),
              ),
              );
            }              

              }
           