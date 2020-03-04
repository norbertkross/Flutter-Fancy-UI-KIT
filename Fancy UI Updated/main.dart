import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter_app/detailAnimPage.dart';

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
      WavyHeaderImage(), //
    );
  }
}


class  WavyHeaderImage extends StatefulWidget {
  @override
  _WavyHeaderImageState createState() => _WavyHeaderImageState();
}

class _WavyHeaderImageState extends State<WavyHeaderImage> with SingleTickerProviderStateMixin{
  //  bool activeNow = false;
  //  int roundIndex = 0;
  String currentPic ="pix/d.jpg";
   bool boxTaped = false;
   bool showCollapsed = true;
   Duration animDuration = Duration(milliseconds: 500); 
List<String>  holdIMGList =[
   "pix/a.jpg",
   "pix/b.png",
    "pix/c.png",
    "pix/d.jpg",
    "pix/e.png",
    "pix/f.png",
    "pix/g.jpg",
    "pix/h.jpg",
    "pix/i.jpg",
    "pix/j.jpg",
    "pix/k.png",

];

String curntimg = "pix/e.png";

  @override
  Widget build(BuildContext context) {
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height; 

  Widget bodyRoundBox({String ttl,String subttl,String distance, String numberTrested,String imageName}){
    return GestureDetector(
                        onTap: (){
                          
                          setState(() {  
                            currentPic = imageName;                         
                          showCollapsed == true? showCollapsed = false:showCollapsed = true;
                           print("Material OnTapped::: $showCollapsed");                           
                          });
                        },       
      child: Padding(
                padding: EdgeInsets.all(mwidth*.02),
                child:Stack(
                      children:<Widget>[
      
                    ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child:Material(
                            elevation: 20.0,
                            child: Container(
                              //color: Colors.red,
                              height: mheight * .3,
                              child: Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Container(
                                            //color: Colors.green,
                                    width: mwidth*.60,
                                    height: mheight * .25,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(ttl,
                                                      style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                      SizedBox(height: 20.0,),
                                                      Text(subttl,
                                                      style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.blue),),                                            
                                                    ],
                                                  ),
                                                ),                                      
                                              ],
                                            ),
                                          ),


                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      ClipSmallArea(imageName)
                                    ],
                                  ),                      
                                ],
                              ),
                            ),
                          ),
                      ),

                    Padding(
                      padding:  EdgeInsets.only(top: mheight * .2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(bottom:Radius.circular(30)),
                        child: Container(
                        //color: Colors.yellow,
                        width: mwidth*.99,
                        height: mheight * .1,
                        child:Padding(
                            padding: EdgeInsets.symmetric(horizontal:8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(width:20),
                                  Icon(Icons.directions,color: Colors.green,),
                                  Text("$distance km away",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      color: Colors.blue,
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text("$numberTrested"),
                                      ),
                                    ),
                                  ),
                                  Text("Intrested"
                                    ,style: TextStyle(),),
                                  SizedBox(width:20)
                                ],
                              )
                              

                              ],
                            ),
                          ),
                                              ),
                                            ),
                                          )
              
                      ]
                    ),
              ),
    );
  }

Widget floatingImage(Color clr,{String imageName,}){
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
              SizedBox(width:5.0),
            GestureDetector(
              onTap:(){
                setState(() {
                curntimg = imageName; 
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("$imageName")
                    )
                  ),
                  //color: clr,
                  height:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.25:mheight*.2,
                  width:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.25:mheight*.2,
                ),
              ),
            ),      
        ],
      ),
    ],
  );
}


Widget slideFromTop(String pic){

  return Stack(
    children: <Widget>[
       GestureDetector(
         onTap: (){
           setState(() {
            showCollapsed = !showCollapsed; 
           });
         },
         child: showCollapsed == false? Container(
            color: Colors.black.withOpacity(.7),
          ):Container(),
       ),
      AnimatedPositioned(
                    duration: animDuration,
                    top:showCollapsed ?0 : 0,
                    bottom:showCollapsed ?mheight*1:MediaQuery.of(context).orientation == Orientation.landscape?
                    mheight*.1:mheight*.2,
                    right:showCollapsed ?0 : 0,
                    left:showCollapsed ?0 :0, 
                    child:ClipRRect(
                      borderRadius: BorderRadius.vertical(bottom:Radius.circular(40)),
                      child: Container(
                        height: mheight*.8,
                        color: Colors.red,
                        child: ListView(
                          //shrinkWrap: true,
                              children: <Widget>[

                            Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(pic)),
                                    ),
                                    //color: Colors.green,
                                    height: MediaQuery.of(context).orientation == Orientation.landscape?
                                     mheight*.8:mheight*.5,
                                  ),
                                ),

                                ListTile(
                                  leading: IconButton(
                                    icon: Icon(Icons.zoom_in,color: Colors.white,),
                                    onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context)=>SubDetailPage(pic)
                                      ));
                                      },
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.close,color: Colors.white,),
                                    onPressed: (){
                                      setState(() {
                                       showCollapsed = !showCollapsed; 
                                       print("Is collapsed::: $showCollapsed");
                                      });                              
                                    },
                                  ), //popupMenuButton(),
                                ),

                              ],
                            ),

                            

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Choose an Option",style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),),
                                ),
                        Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Lorem Ipsium is a dummy text, which means lorem ipsium, lorem ipsium lorem ipsium, lorem ipsium lorem ipsium, lorem ipsium lorem ipsium, lorem ipsium lorem ipsium, lorem ipsium lorem ipsium, lorem ipsium lorem ipsium, lorem ipsium lorem ipsium, lorem ipsium lorem ipsium, lorem ipsium lorem ipsium, lorem ipsium"
                                  ,style: TextStyle(color: Colors.white,fontSize: 14.0,),),
                                ),
                          Container(
                          //color: Colors.red,
                          height: MediaQuery.of(context).orientation == Orientation.landscape?mheight*.6:mheight*.4,//mheight*.4,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                            floatingImage(Colors.green,imageName: holdIMGList[6]),
                            floatingImage(Colors.brown,imageName: holdIMGList[3]),
                            floatingImage(Colors.blue,imageName: holdIMGList[1]),
                            floatingImage(Colors.white,imageName: holdIMGList[8]),                                                            
                            ],
                          ),
                        ),

                              ],
                            )


                              ],
                            ),
                        ),
                      ),
                   ),
    ],
  );
}



   return Scaffold(
     backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              
              Container(
                color: Colors.grey.withOpacity(.9),
                child: ListView(
                    children: <Widget>[      
                        Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius:  BorderRadius.vertical(bottom: Radius.circular(30)),
                              child: Container(
                                //color: Colors.red,

                                //height: 50.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      
                                      Colors.green,
                                      Colors.deepOrange,
                                    ],
                                  ),
                                ),
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(Icons.location_on,color: Colors.white,),
                                            SizedBox(width:10.0),
                                            Text("Wilson Gardens, Bangladeshi",
                                            style:TextStyle(color: Colors.white,fontSize: 18),)
                                          ],
                                        ),
                                      ),                              
                                    ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text("Find Amazing Events happening near you"
                                          ,style:TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:12.0),
                                      child: Column(
                                        children: <Widget>[
                                          Text("Find Amazing Events happening near you"
                                          ,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                     SizedBox(height:30.0),

                                      Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:12.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(30),
                                          child:
                                           Container(
                                            color: Colors.white,
                                            height: boxTaped == false?60.0:null,
                                            child:Column(
                                              children: <Widget>[
                                            boxTaped == true?Padding(
                                                  padding: EdgeInsets.all(
                                                    boxTaped == true?4.0:0.0),
                                                  child: TextFormField(
                                                    decoration:  InputDecoration(
                                                      prefixIcon: IconButton(
                                                        icon: Icon(Icons.cancel),
                                                        onPressed: (){
                                                          print("Removed");
                                                          setState(() {
                                                            boxTaped = !boxTaped;
                                                          });
                                                          },
                                                      ),                                              
                                                      suffixIcon: IconButton(
                                                        icon: Icon(Icons.search),
                                                        onPressed: (){
                                                          print("Removed");
                                                          setState(() {
                                                            boxTaped = !boxTaped;
                                                          });
                                                          },
                                                      ),
                                                      labelText: " Search events here",
                                                      fillColor: Colors.white,
                                                      border:  OutlineInputBorder(
                                                        //gapPadding: ,
                                                        borderRadius:  BorderRadius.circular(30.0),
                                                        borderSide:  BorderSide(
                                                        ),
                                                      ),
                                                      //fillColor: Colors.green
                                                    ),
                                                    ),
                                                ):Container(
                                                  child: Center(
                                                    child: IconButton(
                                                      icon: Icon(Icons.keyboard_hide,color: Colors.green,size: 40.0,),
                                                      onPressed: (){
                                                        setState(() {
                                                         boxTaped = !boxTaped; 
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        ),
                                        SizedBox(height:30.0),                                    
                                       // )
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),                      
                            
                          ],
                              ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width:20),
                                Text("Featured events",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){print("viewing all. Wait ........");},
                                  child: Text("View all",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue),)),
                                SizedBox(width:20)
                              ],
                            )
                            

                            ],
                          ),
                        ),      
                        bodyRoundBox(
                          ttl:"Late Spring Marathon",
                          subttl: "25th September, 2019",
                          distance: "127",
                          numberTrested: "372",
                          imageName:"pix/d.jpg",
                        ),
                        bodyRoundBox(
                          ttl:"Cake Baking",
                          subttl: "21th June, 2019",
                          distance: "27",
                          numberTrested: "37",
                          imageName:"pix/g.jpg",
                        ), 

                        bodyRoundBox(
                          ttl:"Cycling",
                          subttl: "27th July, 2019",
                          distance: "2",
                          numberTrested: "102",
                          imageName:"pix/b.png",
                        ), 

                        bodyRoundBox(
                          ttl:"Music Jam",
                          subttl: "31th November, 2019",
                          distance: "75",
                          numberTrested: "1762",
                          imageName:"pix/f.png",
                        ), 

                            ],
                          ),
              ),
              /// Widget which slides from top
                  slideFromTop(currentPic),               
            ],
          ),
                  );
                }  
              }

           



class ClipSmallArea extends StatefulWidget {
  String imageHere;
  ClipSmallArea(this.imageHere);
  @override
  _ClipSmallAreaState createState() => _ClipSmallAreaState();
}

class _ClipSmallAreaState extends State<ClipSmallArea> {
  @override
  Widget build(BuildContext context) {
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;    
    return ClipPath(
      clipper: CustomClipperpath(context),
      child: ClipRRect(
              borderRadius:  BorderRadius.horizontal(left: Radius.circular(30)),
              child: Container(
                //color: Colors.black,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.imageHere)
                  )
                ),
                width: mwidth*.36,
                height: mheight * .3,
              ),
            ),
    );
  }
}





////////////////////////////  Custom Bottom Clipper  /////////////////////////


class CustomClipperpath extends CustomClipper<Path>{
  BuildContext context;
  CustomClipperpath(this.context);

  @override
  Path getClip(Size size) {
    var path = Path();
    // TODO: implement getClip
    
    var mh = size.height;
    var mw = size.width;    
//  First Curve maybe 
    var fcp = Offset(mw/4.5, mh);
    var fep = Offset(size.width, mh*.45);

 
  path.moveTo(0.0, 30.0);
  path.lineTo(0.0, mh*.4);
  path.quadraticBezierTo(fcp.dx, fcp.dy, fep.dx, fep.dy);  
  path.lineTo(size.width, mh*.4);
  path.lineTo(size.width, 0.0);
  path.lineTo(0.0,0.0);  

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}
