import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/clipme.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
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
                     height:MediaQuery.of(context).size.height*(40/100),
                    width: MediaQuery.of(context).size.width*(100/100)
                    ,),
                    // Container(
                    //   color: Colors.red,
                    //   height: 70,
                    //   width: 500,
                    // ),
                    // Container(
                    //   color: Colors.red,
                    //   height: 70,
                    //   width: 500,
                    // ),
                    // Container(
                    //   color: Colors.red,
                    //   height: 70,
                    //   width: 500,
                    // ),       
                    // Container(
                    //   color: Colors.red,
                    //   height: 70,
                    //   width: 500,
                    // ),  

                    // Container(
                    //   color: Colors.red,
                    //   height: 70,
                    //   width: 500,
                    // ),  
                    // Container(
                    //   color: Colors.red,
                    //   height: 70,
                    //   width: 500,
                    // ),                                                                                               

                            ],),),

// Column(
//   children: <Widget>[
//     Padding(padding: EdgeInsets.only(top: 10.0),),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          IconButton(
//            icon: Icon(CupertinoIcons.back,color: Colors.white,),
//            onPressed: (){print("hello");},
//          ),

//           popupMenuButton(),
                    
//                    ],
//                  ),
//               ],
//             ),


    ],
  ),


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
    // var mqh = size.height;
    // var mqw = size.width;
    path.lineTo(0.0, mqh*(30/100));
    //path.lineTo(mqw, 0.0);
    var fcp1 = Offset(mqw*(10/100), mqh*(40/100));
    var fep1 = Offset(mqw*(20/100), mqh*(25/100));

    var fcp2 = Offset(mqw*(90/100), mqh*(40/100));
    var fep2 = Offset(mqw*(40/100), mqh*(25/100));

    var fcp = Offset(mqw*(50/100), mqh*(50/100));
    var fep = Offset(mqw, mqh*(30/100));

    // // Quadratic beziere
    // path.quadraticBezierTo(
    //                     firstControlPoint.dx, firstControlPoint.dy, 
    //                     firstEndPoint.dx, firstEndPoint.dy
    //                     );
    // path.lineTo(mqw, 0.0);   
    // path.lineTo(mqw, mqh*(30/100)); 
    // path.lineTo(0.0, mqh*(30/100));
    // path.lineTo(0.0,0.0);
   // path.quadraticBezierTo(fcp1.dx, fcp1.dy, fep1.dx, fep1.dy);
    path.quadraticBezierTo(fcp.dx, fcp.dy, fep.dx, fep.dy);
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

