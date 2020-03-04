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
      body: 
      Entry(), //
    );
  }
}


class  Entry extends StatefulWidget {

  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> with SingleTickerProviderStateMixin{
    bool revealed = false;
    Duration duration = Duration(milliseconds: 500);
    int curntIndex = 0;
    int bottomCurnt = 0;
    Color bgcolor = Color(0xFF070B39);
    bool openedMenu = false;

Widget itemsList({String imgpic,String name, String price}){
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;   
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                color: Colors.grey.withOpacity(.4),
                                child: ListTile(
                                  leading: GestureDetector(
                                    onTap: (){
                                      print("Touched an Image");
                                    },
                                    child: Container(
                                      width: mwidth*.3,
                                      height: mwidth*.3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          //fit: BoxFit.cover,
                                          image: AssetImage(imgpic)
                                        )
                                      ),
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("$name",style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 16),),
                                      SizedBox(height: 10.0,),
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                                        children: <Widget>[
                                          Row(
                                            mainAxisSize: MainAxisSize.min,                                      
                                            children: <Widget>[
                                              Text("\$",style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 18)),
                                              Text("  $price",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                            ],
                                          ),

                                      IconButton(
                                        icon: Icon(Icons.add_circle),
                                        onPressed: (){print("Added +++");},
                                      )    
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    );  
}

Widget toAnimate(){
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;  
  return   AnimatedPositioned(
                    duration: duration,
                    top:revealed == true?mheight*.8 :MediaQuery.of(context).orientation == Orientation.landscape?
                    mheight*.2:mheight*.12 ,
                    bottom:revealed ?0 : 0,
                    right:revealed ?0: 0,
                    left:revealed ?0:0, 
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                      child: Card(
                        margin: EdgeInsets.all(0),
                        child: Container(
                        color: Colors.white,
                        child: ListView(
                          children: <Widget>[
                           GestureDetector(
                             onTap: (){
                               print("Checked ...");
                             },
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children: <Widget>[
                                 Text("Check your order",style: TextStyle(color: Colors.blueAccent),),
                                 SizedBox(width: 5,),
                                 Icon(CupertinoIcons.forward,color: Colors.blueAccent)
                               ],
                             ),
                           ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("menu",style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 20)), 
                                SizedBox(height: 15.0,),
                                Container(
                                  height: mheight*.06,
                                  //color: Colors.limeAccent,
                                  child: ListView(
                                   // shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      // Container(
                                      //   color: Colors.deepOrange,
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: CupertinoButton(
                                          color: curntIndex == 0? Colors.deepOrange: Colors.deepOrange.withOpacity(.2),
                                          padding: EdgeInsets.fromLTRB(
                                            16,0,16,0
                                            ),
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          child: Text("Popular"),
                                          onPressed: (){
                                            setState(() {
                                             curntIndex = 0; 
                                            });
                                          },
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: CupertinoButton(
                                          color: curntIndex == 1? Colors.deepOrange: Colors.deepOrange.withOpacity(.2),
                                          padding: EdgeInsets.fromLTRB(
                                            16,0,16,0
                                            ),
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          child: Text("Top"),
                                          onPressed: (){
                                            setState(() {
                                             curntIndex = 1; 
                                            });                                            
                                          },
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: CupertinoButton(
                                          color: curntIndex == 2? Colors.deepOrange: Colors.deepOrange.withOpacity(.2),
                                          padding: EdgeInsets.fromLTRB(
                                            16,0,16,0
                                            ),
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          child: Text("Recent"),
                                          onPressed: (){
                                            setState(() {
                                             curntIndex = 2; 
                                            });                                            
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: CupertinoButton(
                                          color: curntIndex == 3? Colors.deepOrange: Colors.deepOrange.withOpacity(.2),
                                          padding: EdgeInsets.fromLTRB(
                                            16,0,16,0
                                            ),
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          child: Text("Trending"),
                                          onPressed: (){
                                            setState(() {
                                             curntIndex = 3; 
                                            });                                            
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding:EdgeInsets.symmetric(horizontal: 8),
                                        child: CupertinoButton(
                                          color: curntIndex == 4? Colors.deepOrange: Colors.deepOrange.withOpacity(.2),
                                          padding: EdgeInsets.fromLTRB(
                                            16,0,16,0
                                            ),
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          child: Text("Fashion"),
                                          onPressed: (){
                                            setState(() {
                                             curntIndex = 4; 
                                            });                                            
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: CupertinoButton(
                                          color: curntIndex == 5? Colors.deepOrange: Colors.deepOrange.withOpacity(.2),
                                          padding: EdgeInsets.fromLTRB(
                                            16,0,16,0
                                            ),
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          child: Text("news"),
                                          onPressed: (){
                                            setState(() {
                                             curntIndex = 5; 
                                            });                                            
                                          },
                                        ),
                                      ),                                                                            
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        itemsList(
                          imgpic: "pix/g.jpg",
                          name: "Fish Salmon",
                          price: "547",
                        ),  
                        itemsList(
                          imgpic: "pix/e.png",
                          name: "Fish Salmon",
                          price: "547",
                        ), 
                        itemsList(
                          imgpic: "pix/f.png",
                          name: "Fish Salmon",
                          price: "547",
                        ), 
                        itemsList(
                          imgpic: "pix/b.png",
                          name: "Fish Salmon",
                          price: "547",
                        ),                                                                         
                             

                          ],
                        ),
                      ),
                      ),
                    ),
                    );
}


Widget bottomPage(){
    double mwidth = MediaQuery.of(context).size.width; 
    double mheight = MediaQuery.of(context).size.height;  
return Scaffold(
  backgroundColor: bgcolor,
  //backgroundColor: Colors.brown,
  //appBar: AppBar(),
  body: ListView(
    padding: EdgeInsets.symmetric(vertical: 10),
    children: <Widget>[

      // Row(
      //   children: <Widget>[
      //     IconButton(
      //   //  padding: ,
      //     icon: Icon(openedMenu == false?Icons.menu:Icons.close,color: Colors.white,size: 35,),
      //     onPressed: (){
      //       setState(() {
      //        revealed = ! revealed; 
      //        openedMenu = ! openedMenu;
      //       });
      //     },
      //   ),
      //   ],
      // ),
      ListTile(
        contentPadding: EdgeInsets.all(0.0),
        leading: IconButton(
        //  padding: ,
          icon: Icon(openedMenu == false?Icons.menu:Icons.close,color: Colors.white,size: 35,),
          onPressed: (){
            setState(() {
             revealed = ! revealed; 
             openedMenu = ! openedMenu;
            });            
          },
        ),
        title: Text("        Fancy UI Kit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
      ),

    Column(
      children: <Widget>[
      GestureDetector(
        onTap: (){
          setState(() {
           bottomCurnt = 0; 
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("Servicey",style: TextStyle(color: bottomCurnt == 0?Colors.deepOrange:Colors.white,fontWeight: FontWeight.bold,fontSize:bottomCurnt == 0?24:16)),
        ),
      ),
      GestureDetector(
        onTap: (){
          setState(() {
           bottomCurnt = 1; 
          });          
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("Check My Cart",style: TextStyle(color: bottomCurnt == 1?Colors.deepOrange:Colors.white,fontWeight: FontWeight.bold,fontSize:bottomCurnt == 1?24:16)),
        ),
      ),
      GestureDetector(
        onTap: (){
          setState(() {
           bottomCurnt = 2; 
          });          
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("Transactions",style: TextStyle(color:bottomCurnt == 2?Colors.deepOrange:Colors.white,fontWeight: FontWeight.bold,fontSize:bottomCurnt == 2?24:16)),
        ),
      ),
      GestureDetector(
        onTap: (){
          setState(() {
           bottomCurnt = 3; 
          });          
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("Dashboard",style: TextStyle(color: bottomCurnt == 3?Colors.deepOrange:Colors.white,fontWeight: FontWeight.bold,fontSize:bottomCurnt == 3?24:16)),
        ),
      ),  
      GestureDetector(
        onTap: (){
          setState(() {
           bottomCurnt = 4; 
          });          
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("Filters",style: TextStyle(color: bottomCurnt == 4?Colors.deepOrange:Colors.white,fontWeight: FontWeight.bold,fontSize: bottomCurnt == 4?24:16)),
        ),
      ),
      GestureDetector(
        onTap: (){
          setState(() {
           bottomCurnt = 5; 
          });          
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("Messages",style: TextStyle(color: bottomCurnt == 5?Colors.deepOrange:Colors.white,fontWeight: FontWeight.bold,fontSize:bottomCurnt == 5?24:16)),
        ),
      ),
      GestureDetector(
        onTap: (){
          setState(() {
           bottomCurnt = 6; 
          });          
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("Library",style: TextStyle(color: bottomCurnt == 6?Colors.deepOrange:Colors.white,fontWeight: FontWeight.bold,fontSize: bottomCurnt == 6?24:16)),
        ),
      ),                    
      ],
    ),
           

    ],
  ),
);
}

  @override
  Widget build(BuildContext context) {
    double mwidth = MediaQuery.of(context).size.width; 
    double mheight = MediaQuery.of(context).size.height; 

               return Scaffold(    
                      body: Stack(
                      children: <Widget>[
                        bottomPage(),    
                        toAnimate()          
                        // itemDetailsShow == false?pageOnTop():
                        // showItemsDetail(),
                      ],
                    ),    
                  );
                }  
              }