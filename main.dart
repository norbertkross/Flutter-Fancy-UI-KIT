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
      home: MyHomePage(title: 'Aberor'),
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
   bool activeNow = false;
   int roundIndex = 0;
   int currentIndex =1;
   int rndINt = 0 ;
   final GlobalKey <ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;  

Widget returnRoundCard(String picName, String txtName){

  return  Stack(
                children: <Widget>[ 
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: InkWell(
                        onTap: (){
                           print("rndInt bf-st : $rndINt");
                          setState(() {
                          rndINt = Random().nextInt(97);
                          print("rndInt af-st : $rndINt");
                          });
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return DetailPage("tag-$rndINt",picName);
                          }));
                        },
                        child: Hero(
                          tag:"tag-$rndINt" ,

                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(picName)),
                            ),
                            //color: Colors.red,
                            height: mheight*.8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                  SizedBox(height: 50.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(.3),
                        child: IconButton(
                          icon: Icon(activeNow == false?Icons.star_border:Icons.star,color:Colors.white,),
                          onPressed: (){
                            setState(() {
                              activeNow =!activeNow; 
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 50.0,),
                    ],
                  )
                    ],
                  ),

                  Column(
                    children: <Widget>[
                  SizedBox(height:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.60:mheight*.7,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CupertinoButton(
                        padding: EdgeInsets.all(8),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black.withOpacity(.3),
                        onPressed: (){},
                        child: Text(txtName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
                      SizedBox(width: 50.0,),
                    ],
                  )
                    ],
                  ),                                    

                ],
              );
}

   return Scaffold(
     endDrawer: Drawer(),
     key: _scafoldKey,
     bottomNavigationBar: BottomNavigationBar(
       currentIndex:currentIndex ,
       onTap:(__){
         setState(() {
          currentIndex = __; 
         });
       } ,
       showSelectedLabels: true,
       showUnselectedLabels: false,
       selectedItemColor: Colors.green,
       items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
           icon: Icon(Icons.home),
           title: Text("Home")
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.airplanemode_active),
           title: Text("Travel")
         ),   
         BottomNavigationBarItem(
           icon: Icon(Icons.card_travel),
           title: Text("Luggage")
         ),                 
       ],
       
     ),
     backgroundColor: Colors.white,
          body: ListView(
              children: <Widget>[      
                          Container(
                            child: Column(
                              children: <Widget>[
                                //SizedBox(height:10.0),
                                ListTile(
                                  title: Text("Hello Dot. Dart",style: TextStyle(color: Colors.green,fontSize:20,fontWeight: FontWeight.bold),),
                                  trailing:IconButton(
                                    icon: Icon(Icons.apps,color: Colors.deepOrange,),
                                    onPressed: ()=> _scafoldKey.currentState.openEndDrawer(),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  //color: Colors.red,
                                  child:ListView(
                                    //padding: ,
                                            scrollDirection: Axis.horizontal,
                                            //shrinkWrap: true,
                                            children: <Widget>[
                                          Container(
                                            width: 8.0,
                                            //color: Colors.green,
                                          ),
                                          CupertinoButton(
                                            padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                                            color:  roundIndex == 0 ?Colors.blue:Colors.indigoAccent.withOpacity(.3) ,
                                            minSize: 35.0,
                                            borderRadius:BorderRadius.all(Radius.circular(20.0)),
                                            onPressed: (){
                                            roundIndex = 0; 
                                            setState(() {
                                            
                                            });
                                            },
                                            child: Text("Top"
                                            ,style: TextStyle(color:Colors.white,fontSize:20,
                                            fontWeight: FontWeight.bold),),
                                          ),
                                          Container(
                                            width: 10.0,
                                          ),
                                          CupertinoButton(
                                            padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                                            color:  roundIndex == 1 ?Colors.blue:Colors.indigoAccent.withOpacity(.3) ,
                                            minSize: 35.0,
                                            borderRadius:BorderRadius.all(Radius.circular(20.0)),
                                            onPressed: (){
                                            roundIndex = 1; 
                                            setState(() {
                                            
                                            });
                                            },
                                            child: Text("Dubai"
                                            ,style: TextStyle(color:Colors.white,fontSize:20,
                                            fontWeight: FontWeight.bold),),
                                          ),                                          
                                          Container(
                                            width: mwidth*.05,
                                          ),                                          

                                          CupertinoButton(
                                             padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                                            color:  roundIndex == 2 ?Colors.blue:Colors.indigoAccent.withOpacity(.3) ,
                                            minSize: 35.0,
                                            borderRadius:BorderRadius.all(Radius.circular(20.0)),
                                            onPressed: (){
                                            roundIndex = 2; 
                                            setState(() {
                                            
                                            });
                                            },
                                            child: Text("Thailand"
                                            ,style: TextStyle(color:Colors.white,fontSize:20,
                                            fontWeight: FontWeight.bold),),
                                          ),
                                          Container(
                                            width: mwidth*.05,
                                          ),                                          

                                          CupertinoButton(
                                             padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                                            color:  roundIndex == 3 ?Colors.blue:Colors.indigoAccent.withOpacity(.3) ,
                                            minSize: 35.0,
                                            borderRadius:BorderRadius.all(Radius.circular(20.0)),
                                            onPressed: (){
                                            roundIndex = 3; 
                                            setState(() {
                                            
                                            });
                                            },
                                            child: Text("Japan"
                                            ,style: TextStyle(color:Colors.white,fontSize:20,
                                            fontWeight: FontWeight.bold),),
                                          ),                                          

                                            ],
                                          ),
                                ),

                                Container(
                                  height: mheight*.9,
                                  child: PageView(
                                    children: <Widget>[
                                //SizedBox(height: 5.0,),
                                returnRoundCard("pix/j.jpg","Shelter Windmil"), 
                                returnRoundCard("pix/h.jpg","Krossing Bridge"),
                                returnRoundCard("pix/g.jpg","Across The Valleys"),
                                returnRoundCard("pix/d.jpg","The Home"),                                 
                                returnRoundCard("pix/j.jpg","Shelter Windmil"),
                                    ],
                                  ),
                                )
 
                                // SizedBox(height: 5.0,),
                                // returnRoundCard("pix/h.jpg","Krossing Bridge"),
                                // SizedBox(height: 5.0,),
                                // returnRoundCard("pix/g.jpg","Across The Valleys"),
                                // SizedBox(height: 5.0,),
                                // returnRoundCard("pix/d.jpg","The Home"),                                                                                                
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.swap_horiz,color: Colors.red,)
                            ],
                          )        
                        ],
                      ),
                  );
                }  
              }

           
