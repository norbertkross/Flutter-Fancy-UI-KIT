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

class _WavyHeaderImageState extends State<WavyHeaderImage> {
bool butnHit = false;

  @override
  Widget build(BuildContext context) {
    var mdh = MediaQuery.of(context).size.height;
    var mdw = MediaQuery.of(context).size.width;    
    return 
    Stack(
      children: <Widget>[
        
Column(
  children: <Widget>[



        Stack(
            children: <Widget>[
        Container(
              height: mdh*(100/100),
              color: Colors.red,
            ), 
           
        ClipPath(
          clipper: BottomClipperpath(context),   
            child: Container(
              height: mdh*(100/100),
              width: mdw*(96/100),
              color: Colors.indigo,
            ),    
          ), 

        Column(
          children: <Widget>[
          Padding(
            padding: MediaQuery.of(context).orientation == Orientation.landscape?EdgeInsets.only(top: mdh*.72): EdgeInsets.only(top: mdh*.75),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
         FloatingActionButton(
                    heroTag: "htag",
                    onPressed: (){},
                    child: Icon(Icons.menu,size: 40.0,),
                  ),
                  //SizedBox(width: mdw*.03,)
            ],
          )
  
          ],
        )          
                        
        ],
      ),
    ],
  ),
       
            
                 ],
                );
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

// P1
    var fcp = Offset(mw*(70/100), mh*(80/100));
    var fep = Offset(mw*(100/100),mh*(70/100));
// // P2
//     var fcp1 = Offset(mw*(99/100), mh*(84/100));
//     var fep1 = Offset(mw*(70/100), mh*(86/100));
// // P3
//     var fcp2 = Offset(mw*(97/100), mh*(75/100));
//     var fep2 = Offset(mw*(84/100), mh*(73.9/100));

  path.lineTo(0.0, mh*(100/100));
  
  path.lineTo(mw,  mh*(100/100));

  path.lineTo(mw, 0.0);
  
  path.moveTo(mw*(100/100), mh*(90/100));
        // C1
        path.quadraticBezierTo(fcp.dx, fcp.dy, fep.dx, fep.dy);
      
        // path.moveTo(mw*(100/100), mh*(90/100));
        // // C2
        // path.quadraticBezierTo(fcp1.dx, fcp1.dy, fep1.dx, fep1.dy);

        //       path.moveTo(mw*(100/100),mh*(70/100));
        //       //path.lineTo(0.0,0.0);
        //       // C3
        //       path.quadraticBezierTo(fcp2.dx, fcp2.dy, fep2.dx, fep2.dy);


         
        

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}
