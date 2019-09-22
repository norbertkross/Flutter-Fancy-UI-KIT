import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_app/rollOver.dart';

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

   bool sCollapsed = true;
   bool showLayover = true; 
   Duration animDuration = Duration(milliseconds: 500); 
   Color bgcolor = Color(0xFF060B43); //#060B43 
   Color bgcolor2 = Color(0xFF070B39);//#070B39
    Map<dynamic, Widget> _segmentedChildren = {
  0:Padding(
    padding: EdgeInsets.all(5.0),
    child: Icon(Icons.perm_media,
    //color: Colors.pink ,
    ),
  ),
  1:Padding(
    padding: EdgeInsets.all(5.0),
    child: Icon(Icons.edit,
    //color: Colors.green,
    ),
  ),
  2:Padding(
    padding: EdgeInsets.all(5.0),
    child: Icon(Icons.edit,
    //color: Colors.green,
    ),
  ),  
    };
    int groupValue = 0;

  @override
  Widget build(BuildContext context) {
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height; 


Widget slideFromTop(String pic){

  return Stack(
    children: <Widget>[

      AnimatedPositioned(
                    duration: animDuration,
                    top:showLayover ?mheight:MediaQuery.of(context).orientation == Orientation.landscape?
                    mheight*.0:mheight*0.0,
                    bottom:showLayover ?0:0,
                    right:showLayover ?0 : 0,
                    left:showLayover ?0 :0, 
                    child:LayOver(),
                   ),
                 showLayover ==false? Container(
                   height: mheight,
                    child: Padding(
                       padding: EdgeInsets.only(top: mheight*.8),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: <Widget>[
                           FloatingActionButton(
                             backgroundColor: Colors.green,
                           onPressed: (){
                                   setState(() {
                                    showLayover = !showLayover; 
                                    print(showLayover);
                                   });                             
                           },
                           child:Icon(Icons.close)
                     ),
                     SizedBox(width: 15.0,)
                         ],
                       ),
                     )
                  ):Container(),
                   
    ],
  );
}


   return Scaffold(
     backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              
                     ListView(
                       children: <Widget>[
                         Container(
                           height: mheight*1.5,
                           color: bgcolor,
                           child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(top:40.0),
                                        child: Text("Child Fears",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.only(top:15.0),
                                      //   child: Text("no more fears",
                                      //   style:TextStyle(color: Colors.white,fontSize: 16),),
                                      // ),   
                                      Padding(
                                        padding: EdgeInsets.only(top:40.0),
                                      ),                                                                         
                                      Center(
                                        child: Container(
                                          height: mheight*.5,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("pix/fd.png"),
                                            )
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top:19.0),
                                      ),   

                                              Padding(
                                              padding: EdgeInsets.only(top:1.0),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(" Fears",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                                                  Padding(
                                                    padding: EdgeInsets.all(20),
                                                    child: Container(
                                                    child:Text("We access and treat children and adoloscents. This we believe would help them cope with stress in this crazy world we live in"
                                                  ,style:TextStyle(color: Colors.white,fontSize: 14),),
                                                  ),
                                                  )
                                                  
                                                  
                                                ],
                                              ),
                                            ) ,
                              ],
                           ),
                         )
                       ],
                     ),
                    //  Column(
                    //    children: <Widget>[
                         Padding(
                           padding: EdgeInsets.only(
                             top:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.9:mheight*.9),
                           child: Center(
                             child:ClipRRect(
                               borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                               child: GestureDetector(
                                 onTap: (){
                                   print("draw buttom page");
                                   setState(() {
                                    showLayover = !showLayover; 
                                    print(showLayover);
                                   });
                                   //showLayover = false;
                                 },
                                 child: Container(
                                 height: mheight*.10,
                                 width: mheight*.10,
                                 color: Colors.white.withOpacity(.5),
                                 child: BackdropFilter(
                                   filter: ImageFilter.blur(sigmaX: 1.0,sigmaY:1.0),
                                   child: Icon(CupertinoIcons.up_arrow),
                                 ),
                             ),
                               ),
                             ),
                           ),
                         ),

                         //showLayover == true? 
                         slideFromTop("pix/fd.png")
                         //:Container()

                          ],
                              ),
    
                  );
                }  
              }

           
