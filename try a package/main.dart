import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Clipper'),
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
      Entry(
        childrenTop: <ChildWidget>[
          ChildWidget(),
          ChildWidget(),
          ChildWidget(),
          ChildWidget(),                    
        ],
        childrenBottom: <ChildWidget>[
          ChildWidget(),
          ChildWidget(),
          ChildWidget(),
          ChildWidget(),   
          ChildWidget(),
          ChildWidget(),
          ChildWidget(),
          ChildWidget(), 
          ChildWidget(),
          ChildWidget(),
          ChildWidget(),
          ChildWidget(),                            
        ],
      ), //
    );
  }
}


class  Entry extends StatefulWidget {
  final List <ChildWidget> childrenTop ;
  final List <ChildWidget> childrenBottom ;
   Entry({@required this.childrenTop, @required this.childrenBottom});  
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> with SingleTickerProviderStateMixin{

   bool showLayover = true; 
   Duration animDuration = Duration(milliseconds: 300); 
   Color bgcolor = Color(0xFF060B43);


  @override
  Widget build(BuildContext context) {
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height; 




                    Widget floatingDraggable(){
                      return  Padding(
                           padding: EdgeInsets.only(
                             top:mheight*.4, 
                             left:MediaQuery.of(context).orientation == Orientation.landscape?mwidth*.965:mwidth*.95,
                            //  MediaQuery.of(context).orientation == Orientation.landscape?mwidth*.96
                            //  :mwidth*.94
                             ),
                           child: 
                          //  Center(
                          //    child:
                             ListTile(
                               contentPadding: EdgeInsets.all(0.0),
                              subtitle: ClipRRect(
                                 borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
                                 child: GestureDetector(
                                   onTap: (){
                                     print("draw buttom page");

                                   },
                                   onHorizontalDragStart: (__){
                                     setState(() {
                                      showLayover = !showLayover; 
                                      print(showLayover);
                                     });
                                   },
                                   child: Container(
                                   height:
                                   //MediaQuery.of(context).orientation == Orientation.landscape?mheight*.3:
                                   mheight*.20,
                                   width: mheight*.08,
                                   color: Colors.white.withOpacity(.6),
                                   child: BackdropFilter(
                                     filter: ImageFilter.blur(sigmaX: 1.0,sigmaY:1.0),
                                     child: Icon(CupertinoIcons.back,),
                                   ),
                               ),
                                 ),
                               ),
                             ),
                          // ),
                         );
}


Widget slideFromSide({Color bodyColor,Color headColor,String titleTop, String titleBottom,Color titleTopColor, Color titleBottomColor,bool endPosition }){

  return Stack(
    children: <Widget>[
    showLayover == false? Container(
        color: Colors.black.withOpacity(.3),
      ):Container(),
      AnimatedPositioned(
                    duration: animDuration,
                    top:showLayover?0:0,
                    bottom:showLayover ?0:0,
                    right:showLayover ?0 : 0,
                    left:showLayover ?mwidth*1.0:MediaQuery.of(context).orientation == Orientation.landscape?
                    mheight*.0:mheight*0.0, 
                    child:GestureDetector(
                      onTap: (){
                                   setState(() {
                                    showLayover = !showLayover; 
                                    print(showLayover);
                                   });                        
                      },
                      child: Container(
                        width: mwidth*.2,
                        child: Stack(
                          children: <Widget>[
                            //SizedBox(width: mwidth*.4,),
                            ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: <Widget>[
                              endPosition == null || true? SizedBox(width: mwidth*.385,):Container(),//hfcjgjc
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Container(
                                                color: Colors.white,
                                                height:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.3:mheight*.2,
                                                width: mwidth*.6,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      height:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.07: mheight*.04,
                                                      color:headColor != null?headColor:Colors.black.withOpacity(.2),
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal:8.0),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Text(titleTop == null?"Tools":titleTop,style:TextStyle(color: titleTopColor == null? Colors.white: titleTopColor)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.23:mheight*.16,
                                                      color:bodyColor != null?bodyColor:Colors.red,
                                                      child: ListView(
                                                        shrinkWrap: true,
                                                        scrollDirection: Axis.horizontal,
                                                        children:widget.childrenTop,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 5.0,),

                          //////////////////// bigger tool tip

                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Container(
                                                color: Colors.white,
                                                height:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.5: mheight*.45,
                                                width: mwidth*.6,
                                                child:  Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      height:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.08:mheight*.04,
                                                      color: headColor != null?headColor:Colors.black.withOpacity(.2),
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(horizontal:8.0),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Text(titleBottom == null? "Base line":titleBottom,style:TextStyle(color:titleBottomColor == null? Colors.white:titleBottomColor)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.42: mheight*.41,
                                                      color:bodyColor != null?bodyColor:Colors.red,
                                                      child: GridView(
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 3,
                                                          crossAxisSpacing: 1.0,
                                                        ),
                                                        children: widget.childrenBottom,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                
                                              ),
                                            ),                                
                                          ],
                                        ),
                                        SizedBox(width: 5,)
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                   ),

                   
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

                         floatingDraggable(),
                                    

                         slideFromSide(bodyColor: Colors.deepOrange,headColor: Colors.blue,),

                          ],
                              ),
    
                  );
                }  
              }

           






















class ChildWidget extends StatelessWidget {
Icon icon;
Color color,foreColor;
Function onTouched;
ChildWidget({
  this.color,this.foreColor,this.icon,this.onTouched
});

  @override
  Widget build(BuildContext context) {
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;    
return Padding(
        padding:EdgeInsets.all(mheight*.01),
        child: Container(
          height: mheight*.14,
          width: mwidth*.2,
          //color: ,
          child: GestureDetector(
            onTap: onTouched != null? onTouched:(){},
            child: CircleAvatar(
              backgroundColor: color == null?Colors.blue:color,
              foregroundColor: foreColor == null?Colors.black:foreColor,
              //radius: 50,
              child: icon == null ?Icon(Icons.edit):icon,
            ),
          ),
        ),
      );
  }
}