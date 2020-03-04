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

int curntIndex = 2;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child: Icon(Icons.add),
      // ),
      body:  WavyHeaderImage(), //
    );
  }
}


class  WavyHeaderImage extends StatefulWidget {
  @override
  _WavyHeaderImageState createState() => _WavyHeaderImageState();
}

class _WavyHeaderImageState extends State<WavyHeaderImage> {

    Widget  popupMenuButton(){
      return PopupMenuButton<String>(
        icon: Icon(Icons.menu,color: Colors.white,),
         itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[

               PopupMenuItem<String>(
                value:
                'Hoteliers',
                child:Row(children: <Widget>[Icon(Icons.hotel,color: Colors.green,),Text(
                'Hoteliers' ,style: TextStyle(color: Colors.green),),],),  
              ),
              PopupMenuItem<String>(
                value:
                'Hoteliers',
                child:Row(children: <Widget>[Icon(Icons.hotel,color: Colors.green,),Text(
                'Choice two' ,style: TextStyle(color: Colors.green),),],),  
              ),

            ],
            onSelected: ( result) {
              // print(result);
              //    Navigator.of(context)
              //       .push(CupertinoPageRoute(builder: (BuildContext context)
              //       //=>FavoritePage(userUID: currentUser,)
              //       =>Container()));
              },
          );
    }

int numb = 100;

inc(){
  setState(() {
   numb +=1; 
  });
}

dec(){
  setState(() {
   numb -=1; 
  });
}
  @override
  Widget build(BuildContext context) {
    var mdh = MediaQuery.of(context).size.height;
    var mdw = MediaQuery.of(context).size.width;    
    return 
    Stack(
      children: <Widget>[
        
ListView(
  
    children: <Widget>[
  
      
  Stack(
    children: <Widget>[
          ClipPath(
        clipper: NewClipperpath(context),
        child:   Column(
          children: <Widget>[
               Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:AssetImage("pix/abstract.jpg") ), ),
                     height:MediaQuery.of(context).size.height*(48/100),
                    width: MediaQuery.of(context).size.width*(100/100),),
                            ],),),

Column(
  children: <Widget>[
    Padding(padding: EdgeInsets.only(top: 10.0),),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
         IconButton(
           icon: Icon(CupertinoIcons.back,color: Colors.white,),
           onPressed: (){print("hello");},
         ),
        //  IconButton(
        //    icon:  Icon(Icons.se,color: Colors.white,size: 40.0,),
        //    onPressed: (){},
        //  ),

          popupMenuButton(),
                    
                   ],
                 ),
              ],
            ),


    ],
  ),

  
  SizedBox(height: 30.0,),
  Text(" Sweet Light", style: TextStyle(fontSize: 22.0),),
  SizedBox(height: 15.0,),
  Text("Lorem ipsium lorem ipsium Lorem ipsium lorem ipsium Lorem ipsium lorem ipsium Lorem ipsium lorem ipsium Lorem ipsium lorem ipsium"
  ),
  
  SizedBox(height: 15.0,),
  
  Row(  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,  
    children: <Widget>[  
      Text("   Reviews",style: TextStyle(color: Colors.purpleAccent,fontSize: 20.0),),  
      Row(  
        children: <Widget>[
  
          Icon(Icons.star,color: Colors.yellow,),
  
          Icon(Icons.star,color: Colors.yellow,),
  
          Icon(Icons.star,color: Colors.yellow,),
  
          Icon(Icons.star,color: Colors.yellow,),
  
          Icon(Icons.star_border,color: Colors.yellow,),
  
          SizedBox(width: 15.0,)
  
        ],
  
      ),
  
    ],
  
  ),
  
  
  
  SizedBox(height: 15.0,),
  
  Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    children: <Widget>[
  
      Text("   Colors",style: TextStyle(color: Colors.purpleAccent,fontSize: 20.0),),
  
      Row(
  
        children: <Widget>[
  
          
  
        ClipRRect(
  
        borderRadius: BorderRadius.circular(15.0),
  
        child: Container(
  
          color: Colors.green,
  
          width: 20.0,
  
          height: 20.0,
  
        ),
  
      ),
  
  SizedBox(width: 2.0,),
  
        ClipRRect(
  
        borderRadius: BorderRadius.circular(15.0),
  
        child: Container(
  
          color: Colors.deepOrangeAccent,
  
          width: 20.0,
  
          height: 20.0,
  
        ),
  
      ),
  
  SizedBox(width: 2.0,),
  
        ClipRRect(
  
        borderRadius: BorderRadius.circular(15.0),
  
        child: Container(
  
          color: Colors.blue,
  
          width: 20.0,
  
          height: 20.0,
  
        ),
  
      ),
  
  SizedBox(width: 2.0,),
  
        ClipRRect(
  
        borderRadius: BorderRadius.circular(15.0),
  
        child: Container(
  
          color: Colors.red,
  
          width: 20.0,
  
          height: 20.0,
  
        ),
  
      ),
  
  
  
      SizedBox(width: 20.0,),
  
  
  
        ],
  
      ),
  
  
  
    ]
  
  ),
  
  SizedBox(height: 15.0,),
  
  
  
  Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    children: <Widget>[
  
      Text("   Price",style: TextStyle(color: Colors.purpleAccent,fontSize: 20.0),),
  
  
  
     Row(
  
       children: <Widget>[
  
         Text("\$432",style: TextStyle(fontSize: 20.0),),
  
         SizedBox(width: 20.0,)
  
       ],
  
     ) 
  
        
  
    ],
  
  ),
  
  
  
  SizedBox(height: 30.0,),
  
  
  
                  Row(
  
                    mainAxisSize: MainAxisSize.max,
  
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
  
                    /// Row for buttons
  
                    children: <Widget>[
  
                      Column(
  
                        mainAxisSize: MainAxisSize.min,
  
                          children: <Widget>[
  
                           // TextField(),
  
                            Material(
  
                              elevation: 8.0,
  
                              borderRadius: BorderRadius.circular(30.0),
  
                              child:CupertinoButton(
  
                                //minSize: 44.0,
  
                                child:Row(
  
                                  mainAxisSize: MainAxisSize.min,
  
                                  children: <Widget>[
  
                                    GestureDetector(
  
                                      onTap: (){dec();},
  
                                      child:
  
                                      //Text("--",style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 0.0,fontSize: 5.0),) ,
  
                                      Icon(Icons.minimize ,color: Colors.green, 
  
                                      ),
  
                                    ),  
  
                                    Container(
  
                                      width: 100.0,
  
                                      height: 20.0,
  
                                      child:FittedBox(
  
                                      child: Row(
  
                                        children: <Widget>[
  
                                           Text(
  
                                             //'Cont'
  
                                             "$numb   "
  
                                             //"${languageToUse != null ?TranslateStatic.add[languageToUse]:'Add'}"
  
                                             //' +'
  
                                             ,style: TextStyle(
  
                                      color: Colors.red,
  
                                      fontSize: 35.0,
  
                                      fontWeight: FontWeight.bold
  
                                    ),),
  
                                    GestureDetector(
  
                                      onTap: (){inc();},
  
                                      child: Icon(Icons.add,color: Colors.green,size: 35.0, 
  
                                      ),
  
                                    ), 
  
                                      
  
                                        ],
  
                                      ),
  
                                    ) ,
  
                                    )
  
                                    
  
                                   
  
                                  ],
  
                                ),
  
                                onPressed: null,
  
                                
  
                              )
  
                            )
  
                          ],
  
                        ),
  
  
  
  /// secon Button
  
  
  
  
  
                      Column(
  
                        mainAxisSize: MainAxisSize.min,
  
                          children: <Widget>[
  
                           // TextField(),
  
                            Material(
  
                              elevation: 8.0,
  
                              borderRadius: BorderRadius.circular(30.0),
  
                              child:CupertinoButton(
  
                                //minSize: 44.0,
  
                                child:Row(
  
                                  mainAxisSize: MainAxisSize.min,
  
                                  children: <Widget>[
  
                                    Container(
  
                                      width: 100.0,
  
                                      height: 20.0,
  
                                      child:FittedBox(
  
                                      child: Row(
  
                                        children: <Widget>[

                                           Text(
  
                                             'Continue'
  
                                             //"${languageToUse != null ?TranslateStatic.add[languageToUse]:'Add'}"
  
                                             //' +'
  
                                             ,style: TextStyle(
  
                                      color: Colors.red,
  
                                      fontSize: 35.0,
  
                                      fontWeight: FontWeight.bold
  
                                    ),),
  
  
  
                                        ],
  
                                      ),
  
                                    ) ,
  
                                    )
  
                                    
  
                                   
  
                                  ],
  
                                ),
  
                                onPressed: (){},
  
                                
  
                              )
  
                            )
  
                          ],
  
                        ),
  
  
  
                    ],
  
                  ),
  
  SizedBox(height: 40.0,)
  
    ],
  
  ),

           
            
                 ],
                );
              }
            }
            


class NewClipperpath extends CustomClipper<Path>{
  BuildContext context;
  NewClipperpath(this.context);

  @override
  Path getClip(Size size) {
    var path = Path();
    // TODO: implement getClip
    var mdh = MediaQuery.of(context).size.height;
    var mdw = MediaQuery.of(context).size.width;
    
    var firstControlPoint = Offset(mdw*(5/100), mdh*(49.5/100));
    var firstEndPoint = Offset(mdw*(40/100), mdh*(50.0/100));

     ////////////////////   Second Path    //////////////////////////////////////
    var secControlPoint = Offset(mdw * (12/100), mdh * (12.5/100));
    var secEndPoint = Offset( mdw, mdh * (39.5/100) );

    path.lineTo(0.0, mdh*(40/100));
    
    // sec beziere
    path.quadraticBezierTo(
                        firstControlPoint.dx, firstControlPoint.dy, 
                        firstEndPoint.dx, firstEndPoint.dy
                        );
                        
    path.lineTo(mdw*(20/100), mdh*(45.0/100));

    path.lineTo(size.width, mdh*(40.0));
   // path.lineTo(mdw * (80/100), mdh*(49.0));

    //path.lineTo(mdw, mdh*(40.5));
              // first beziere
    // path.quadraticBezierTo(
    //                     secControlPoint.dx, secControlPoint.dy, 
    //                     secEndPoint.dx, secEndPoint.dy
    //                     );
    path.lineTo(size.width, 0.0);


    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}

