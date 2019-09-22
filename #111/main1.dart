import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:  WavyHeaderImage(), //
    );
  }
}


class  WavyHeaderImage extends StatefulWidget {
  @override
  _WavyHeaderImageState createState() => _WavyHeaderImageState();
}

class _WavyHeaderImageState extends State<WavyHeaderImage> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomWaveClipper(),
      child: Column(
        children: <Widget>[
          // Center(
          //   child:
            Card(
              child: Container(
                color: Colors.red,
                height:MediaQuery.of(context).size.height*(50/100),
                width: MediaQuery.of(context).size.width*(100/100),
              ),
            ),
         // ),
        ],
      ),
    );
  }
}




//clipper class
class BottomWaveClipper extends CustomClipper<Path>{
  @override

  Path getClip(Size size){

    var path = Path();
    
    path.lineTo(0.0, size.height-(size.height*(50/100)));
    //path.lineTo(size.width*(20/100), (size.height-(size.height*(50/100))));

    // {size.width/4 , (size.height-(size.height*(50/100)))-(size.height*(35/100))}
    var firstControlPoint = Offset(size.width/4 , (size.height-(size.height*(50/100)))-(size.height*(25/100)));
    // {size.width/2.5 , (size.height-(size.height*(50/100)))-(size.height*(20/100)) }
    var firstEndPoint = Offset(size.width/2.0 , (size.height-(size.height*(50/100)))-(size.height*(10/100)));
    // path
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    //  {size.width *(.75) , size.height-(size.height*(50/100)) }
    var secondControlPoint = Offset(size.width *(.75) , size.height-(size.height*(50/100)) );
    // {size.width , (size.height-(size.height*(50/100)))-(size.height*(35/100)) }
    var secondEndPoint = Offset(size.width , (size.height-(size.height*(50/100)))-(size.height*(35/100)));
    // path
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);


    path.lineTo(size.width, (size.height-(size.height*(50/100)))-(size.height*(10/100)));
    path.lineTo(size.width, 0.0);

    path.close();

    return path;

  }

 @override 

 bool shouldReclip(CustomClipper<Path> oldCliper)=>false;

}