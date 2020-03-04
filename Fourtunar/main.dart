import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_app/clipme.dart';

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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child: Icon(Icons.add),
      // ),
      body: 
      //ClipMeClip(),
      WavyHeaderImage(), //
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
        
Column(
  children: <Widget>[
        Flexible(
          child: ListView(
            //shrinkWrap: true,
    
      
    
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
                           height:MediaQuery.of(context).size.height*(40/100),
                          width: MediaQuery.of(context).size.width*(100/100)
                          ,),    
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
        
                popupMenuButton(),
                                  
                         ],
    
                       ),
                       Padding(padding: EdgeInsets.only(top: 10.0),),
                       Text("Rose",style: TextStyle(color: Colors.white,fontSize: 24.0,fontWeight: FontWeight.bold),),
                       Text("Ships spring 2019",style: TextStyle(color: Colors.white,),),
    
                    ],
    
                  ),    
          ],
    
      ),

    
   


    
                                                                                         
],            
      ),
        ),
      // Padding(
      //   padding: EdgeInsets.only(top: ),
      // ),
      // Flexible(
      //   child: 

          Stack(
            children: <Widget>[
        ClipPath(
          clipper: BottomClipperpath(context),
          child:Container(
            height: mdh*(10/100),
            color: Colors.red,
          ),
        ),              
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu,color: Colors.white,),
                onPressed: (){},
              ),
              FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                heroTag: "f-lot",
                child: Icon(Icons.shopping_cart),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.phone_iphone,color: Colors.white,),
                onPressed: (){},
              ),
            ],
          ),               
            ],
          ) ,


      //)
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

    var mqh = MediaQuery.of(context).size.height;
    var mqw = MediaQuery.of(context).size.width;

    path.lineTo(0.0, mqh*(20/100));

    //first curve
    var fcp1 = Offset(mqw*(10/100), mqh*(20/100));
    var fep1 = Offset(mqw*(20/100), mqh*(25/100));

/// third curve
    var fcp2 = Offset(mqw*(90/100), mqh*(20/100));
    var fep2 = Offset(mqw, mqh*(20/100));

/// second // middle curve
    var fcp = Offset(mqw*(50/100), mqh*(40/100));
    var fep = Offset(mqw*(80/100), mqh*(25/100));

    path.quadraticBezierTo(fcp1.dx, fcp1.dy, fep1.dx, fep1.dy);
    path.quadraticBezierTo(fcp.dx, fcp.dy, fep.dx, fep.dy);
    path.quadraticBezierTo(fcp2.dx, fcp2.dy, fep2.dx, fep2.dy);
    
    //path.moveTo(x, y)
    //path.quadraticBezierTo(fcp2.dx, fcp2.dy, fep2.dx, fep2.dy);

    path.lineTo(mqw, mqh*(30/100));
    path.lineTo(mqw, 0.0);
    path.lineTo(0.0, 0.0);
    


    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}





////////////////////////////  Bottom Clipper  /////////////////////////


class BottomClipperpath extends CustomClipper<Path>{
  BuildContext context;
  BottomClipperpath(this.context);

  @override
  Path getClip(Size size) {
    var path = Path();
    // TODO: implement getClip
    
    var mh = size.height;
    var mw = size.width;    
//  First Curve maybe 
    var fcp1 = Offset(mw/3.5, mh*(20/100));
    var fep1 = Offset(mw/2,mh*(150/100));
/// second // middle Curve
    var fcp = Offset(mw/2.0, mh*(170/100));
    var fep = Offset(mw,0.0);
//  Third curve maybe 
    var fcp3 = Offset(mw/.75, mh*(20/100));
    var fep3 = Offset(mw/2,mh*(110/100));  

  
  path.lineTo(mw, 0.0);
  
  path.lineTo(mw, mh*(100/100));
  
  path.lineTo(0.0,  mh*(100/100));
  
  path.lineTo(0.0,0.0);

        path.quadraticBezierTo(fcp.dx, fcp.dy, fep.dx, fep.dy); 

        var _path = Path();
        _path.moveTo(mw, 0.0);
        _path.lineTo(mw, mh*(170/100));
        _path.lineTo(mw/2,  mh*(170/100));
        _path.moveTo(mw, 0.0); 
           

         
        

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}
