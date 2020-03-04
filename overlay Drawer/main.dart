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
      backgroundColor: Colors.black,

      body:WavyHeaderImage(), //
    );
  }
}


class  WavyHeaderImage extends StatefulWidget {
  @override
  _WavyHeaderImageState createState() => _WavyHeaderImageState();
}

class _WavyHeaderImageState extends State<WavyHeaderImage> with SingleTickerProviderStateMixin{

  Color bgcolor = Color(0xFF4A4A58);
  //Color bgcolor1 = Colors.black;
  bool isCollapsed = true;
  AnimationController animationController;
  int curnIndex = 0;
   Color bgcolor2 = Colors.black;
  int viewNow = 2;
 double holdValuesToChange = 30.0;  
 Duration animDuration = Duration(milliseconds: 500);

Widget gvtiles(String ttle, String sbttle, String price, Function actionPerform){
  return Padding(
              padding: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Colors.blueAccent.withOpacity(.1),
                  child: ListTile(
                  onTap: actionPerform,
                  title: Text("$ttle",style: TextStyle(color: Colors.blue),),
                  subtitle: Text("$sbttle",style: TextStyle(color: Colors.blue),),
                  trailing:Text("\$ $price"),
                    ),
                         ),
                       ),
                     ); 
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = 
    AnimationController(vsync: this,duration: Duration(milliseconds: 300));
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  Widget baseOf(){
  return GestureDetector(
    onTap: (){
    print("underneat container");
    setState(() {
    isCollapsed = ! isCollapsed; 
  });    
    },
    child: Container(
      color:Colors.blue ,
           width: MediaQuery.of(context).size.width,  
            child: ListView(
              children: <Widget>[      
                Column(
                    children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 10.0,),
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage("pix/abstract.jpg"),
                            ),
                          ],
                        ),

                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.0),
                          child: 
                          Column(
                            children: <Widget>[
                              SizedBox(
                                  height: 10.0,
                                ),
                                ListTile(
                                  title: Text("Aberor Norbert Eugene ",
                                    style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: 
                                    FontWeight.bold),),
                                    subtitle: Text("San Francisco, CA",
                                    style: TextStyle(fontSize: 14,color: Colors.white,),),
                                ),

                              SizedBox(
                                  height: 20.0,
                                ),                            

                                ListTile(
                                  onTap: (){
                                    setState(() {
                                     curnIndex = 0; 
                                    });
                                  },
                                 // contentPadding: EdgeInsets.symmetric(horizontal:0.0),
                                  title: Text("Dashboard ",
                                    style: TextStyle(fontSize: curnIndex == 0?20:16,
                                     color: curnIndex == 0?Colors.white:Colors.white,
                                    fontWeight:curnIndex == 0?FontWeight.bold:FontWeight.w300),),
                                ),   
                                
                                ListTile(
                                  onTap: (){
                                    setState(() {
                                     curnIndex = 1; 
                                     print("current index $curnIndex");
                                    });
                                  },                                
                                  title: Text("Messages",
                                    style: TextStyle(fontSize:curnIndex == 1?20:16,
                                    color:curnIndex == 1?Colors.white:Colors.white,
                                    fontWeight:curnIndex == 1?FontWeight.bold:FontWeight.w300),),
                                ),    

                                ListTile(
                                  onTap: (){
                                    setState(() {
                                     curnIndex = 2; 
                                    });
                                  },                                
                                  title: Text("Filters ",
                                    style: TextStyle(fontSize:curnIndex == 2?20: 16,
                                    color: curnIndex == 2?Colors.white:Colors.white,
                                    fontWeight:curnIndex == 2?FontWeight.bold:FontWeight.w300),),
                                ), 

                                ListTile(
                                  onTap: (){
                                    setState(() {
                                     curnIndex = 3; 
                                    });
                                  },                                
                                  title: Text("Our Contact ",
                                    style: TextStyle(fontSize:curnIndex == 3?20: 16,
                                    color: curnIndex == 3?Colors.white:Colors.white,
                                    fontWeight:curnIndex == 3?FontWeight.bold:FontWeight.w300),),
                                ),    

                                ListTile(
                                  onTap: (){
                                    setState(() {
                                     curnIndex = 4; 
                                    });
                                  },                                
                                  title: Text("Library ",
                                    style: TextStyle(fontSize:curnIndex == 4?20: 16,
                                    color: curnIndex == 4?Colors.white:Colors.white,
                                    fontWeight: curnIndex == 4?FontWeight.bold:FontWeight.w300),),
                                ),
                                ListTile(
                                  onTap: (){
                                    setState(() {
                                     curnIndex = 5; 
                                    });
                                  },                                
                                  title: Text("Reviews ",
                                    style: TextStyle(fontSize:curnIndex == 5?20: 16,
                                    color: curnIndex == 5?Colors.white:Colors.white,
                                    fontWeight: curnIndex == 5?FontWeight.bold:FontWeight.w300),),
                                ),  
                                ListTile(
                                  onTap: (){
                                    setState(() {
                                     curnIndex = 0; 
                                     print("logged out !!!");
                                    });
                                  },
                                  leading: Icon(Icons.exit_to_app,color: Colors.white,),
                                  title: Text("Log Out ",
                                    style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                                ),                                                                                                                                                                      

                            ],
                          ),
                        )
                          ],
                        )
                      ],
                    ), 
                    ),
  );
  }



  Widget inFront(){
double mwidth = MediaQuery.of(context).size.width; 
double mheight = MediaQuery.of(context).size.height;    
  return AnimatedPositioned(
    duration: animDuration,
    top:isCollapsed ?0 : mheight*.05,
    bottom:isCollapsed ?0 : mheight*.05,
    right:isCollapsed ?0 : mwidth*-.3,
    left:isCollapsed ?0 : mwidth*.7,
      child: 
      // ClipRRect(
      //   borderRadius:isCollapsed == false?BorderRadius.circular(holdValuesToChange):BorderRadius.circular(0.0),
      //   child:
         Card(
          margin: EdgeInsets.all(0.0),
            elevation: 30.0,
     
          child: Material(
            elevation: 10.0,
            child:
            Container(
              child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.shifting,
                  //backgroundColor: Colors.blue,
                  currentIndex: viewNow,
                  onTap: (newView){
                    setState(() {
                     viewNow = newView; 
                    });
                  },
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      backgroundColor: Colors.blue,
                      title: Text("Home"),
                      icon: Icon(Icons.home),
                    ),

                    BottomNavigationBarItem(
                      backgroundColor: Colors.blue,
                      title: Text("Message"),
                      icon: Icon(Icons.message),
                    ),
                    BottomNavigationBarItem(
                      // This would give the background color only if the item at the initial index is given that color 
                      backgroundColor: Colors.blue,

                      title: Text("Track"),
                      icon: Icon(Icons.tv),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.blue,
                      title: Text("Profile"),
                      icon: Icon(Icons.people),
                    ),
                    BottomNavigationBarItem(
                      backgroundColor: Colors.blueAccent,
                      title: Text("Info"),
                      icon: Icon(Icons.info),
                    ),                                                                                
                  ],
                ),
                body: CupertinoPageScaffold(
                backgroundColor: Colors.white,
                navigationBar: CupertinoNavigationBar(
                  backgroundColor: Colors.white,
                  leading:IconButton(
                        icon: 
                        Icon(isCollapsed == true?Icons.menu:Icons.close,color: Colors.blue,),
                        onPressed: (){
                          setState(() {
                        isCollapsed = ! isCollapsed; 
                        });

                        },

                      ),
                      middle: Text("Meditation",style: TextStyle(color: Colors.blue),),
                      trailing: IconButton(
                        icon: Icon(Icons.search,color: Colors.blue,),
                        onPressed: (){},
                      ),
                ),
          child: Container(
              //color: bgcolor,
              child: ListView(
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    Container(
                      height: mheight*.5,
                      child: PageView.builder(
                        //dragStartBehavior: ,
                        scrollDirection: Axis.horizontal,
                        controller: PageController(viewportFraction: .8),
                        itemBuilder: (BuildContext context,int index){
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  color: index % 2 == 0? Colors.red:index % 2 == 1?Colors.blue:
                                  index % 2 == 3?Colors.purple:index % 2 == 7?Colors.white:Colors.green
                                  ,
                                height: mheight*.5,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                      SizedBox(height: 20.0,),
                     ListTile(
                        title: Text("Transactions",style: TextStyle(color: Colors.blue,fontSize: 18.0,fontWeight: FontWeight.bold),),
                        subtitle: Text("Today",style: TextStyle(color: Colors.blue,fontSize: 14.0,fontWeight: FontWeight.w300),),
                        trailing: Icon(Icons.sort,color: Colors.blue,),
                    ),     
                    gvtiles("Coffee", "breakfast","4362.9",(){print("hello pressed");}),
                    gvtiles("MacBook Pro", "Electronic Gadget","1000.0",(){print("hello pressed");}),
                    gvtiles("Car", "Speed of 3000 km per hour","35,000.0",(){print("hello pressed");}),
                    gvtiles("life", "cant be bought","~ infinity",(){print("hello pressed");}),
                    gvtiles("Party", "Abstract","54.5",(){print("hello pressed");}),
                      
                    ],
    
                  ),
                ),
               ),
              ),
            ),
          ),
        ),
     // ),
  );
  }

  @override
  Widget build(BuildContext context) {
  //  double mwidth = MediaQuery.of(context).size.width; 
  //  double mheight = MediaQuery.of(context).size.width; 
   return Scaffold(
     //backgroundColor: w,
          body:Stack(
              children: <Widget>[
                  baseOf(),
                  inFront(),                                
                    ],
                   )
                  );
                }  
              }
