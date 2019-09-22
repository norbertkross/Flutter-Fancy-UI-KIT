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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: (){},
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF3e89c2),
        unselectedItemColor: Colors.orangeAccent,
        selectedItemColor: Colors.green,
        //fixedColor: Color(0xFF3e89c2),
        currentIndex: curntIndex,
        onTap: (newIndex){
          setState(() {
           curntIndex = newIndex; 
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.account_box,),title: Text('one')),
          BottomNavigationBarItem(icon: Icon(Icons.headset),title: Text('two')),
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.phone),title: Text('three')),
          BottomNavigationBarItem(icon: Icon(Icons.school),title: Text('four')),
        ],
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

    return 
    Stack(
      children: <Widget>[
        ClipPath(
          clipper: BottomWaveClipper(context),
          child:Column(
                children: <Widget>[
                    Container(
                       decoration: BoxDecoration(
                         gradient: LinearGradient(
                           colors: [
                             //Color(0xFF3e89c2),
                             Colors.deepOrange,
                             Colors.green
                            // Color(0xFF446cb7),                     
                           ]
                         )
                       ),
                        height:MediaQuery.of(context).size.height*(40/100),
                        width: MediaQuery.of(context).size.width*(100/100),
                      ),



                ],
              ),
         ),

MediaQuery.of(context).size.width > MediaQuery.of(context).size.height? Container():ClipPath(
  clipper: NewClipperpath(context),
  child:   Column(
  
    children: <Widget>[
  
  Padding(
    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*(70.5/100)),
  ),
  
  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.red,
            ]
          )
        ),
        height:MediaQuery.of(context).size.height*(20/100),
        width: MediaQuery.of(context).size.width*(100/100),
      ), 
    ],
  ),
),   
              Padding(
                padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*(45/100) ),
                child: Center(
                  child: Column(
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
                                width: 150.0,
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
                              Icon(Icons.arrow_forward,color: Colors.green, 
                              size: 40.0,)
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
),
              )      
     ],
    );
  }
}






//clipper class
class BottomWaveClipper extends CustomClipper<Path>{
  final context;
  BottomWaveClipper(@required this.context);

  @override

  Path getClip(Size size){

    var path = Path();

   path.lineTo(0.0, MediaQuery.of(context).size.height*(30/100) );

   var firstControlPoint = Offset(size.width/4, MediaQuery.of(context).size.height*(38/100));
   var secondControlPoint = Offset(size.width * .75, MediaQuery.of(context).size.height*(10/100));
   var firstEndPoint = Offset(size.width/2.5, MediaQuery.of(context).size.height*(30/100));
   var secondEndPoint = Offset(size.width, MediaQuery.of(context).size.height*(12/100));

   path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
   path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, MediaQuery.of(context).size.height*(12/100));

    path.lineTo(size.width, 0.0);

    path.close();

    return path;

  }

 @override 

 bool shouldReclip(CustomClipper<Path> oldCliper)=>false;

}



/////////////// upper bottom wave clipper ///////////////////////////  but this did not work  /////////////////////////

class UpperWaveClipper extends CustomClipper<Path>{
  final context;
  UpperWaveClipper(this.context);

  @override

  Path getClip(Size size){
   var firstControlPoint1 = Offset(size.width/2.1, MediaQuery.of(context).size.height*(89.5/100));
   var endPoint1 = Offset(size.width, MediaQuery.of(context).size.height*(70.5/100));
   var path = Path();


path.moveTo(size.width, MediaQuery.of(context).size.height*(70.5/100));
path.lineTo(0.0, MediaQuery.of(context).size.height*(90.5/100));
path.quadraticBezierTo(firstControlPoint1.dx, firstControlPoint1.dy, endPoint1.dx, endPoint1.dy);

path.lineTo(size.width, MediaQuery.of(context).size.height*(90.5/100));
path.lineTo(size.width, MediaQuery.of(context).size.height*(70.5/100));
    path.close();

    return path;

  }

 @override 

 bool shouldReclip(CustomClipper<Path> oldCliper)=>false;

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




class NewClipperpath extends CustomClipper<Path>{
  final context;
  NewClipperpath(this.context);
  @override
  Path getClip(Size size) {
    var path = Path();
    // TODO: implement getClip
   var firstControlPoint1 = Offset(size.width/4, MediaQuery.of(context).size.height*(75.5/100));
  //  var endPoint1 = Offset(size.width, MediaQuery.of(context).size.height*(70.5/100));
   var endPoint1 = Offset(size.width/2.0, MediaQuery.of(context).size.height*(78.5/100));

   var secondControlPoint1 = Offset(size.width/3.0, MediaQuery.of(context).size.height*(89.5/100));
    var secondendPoint1 = Offset(size.width, MediaQuery.of(context).size.height*(70.5/100));

    path.moveTo(size.width, MediaQuery.of(context).size.height*(70.5/100));
    path.lineTo(size.width, MediaQuery.of(context).size.height*(90.5/100));
    path.lineTo(0.0, MediaQuery.of(context).size.height*(90.5/100));
    path.quadraticBezierTo(firstControlPoint1.dx, firstControlPoint1.dy, endPoint1.dx, endPoint1.dy);
    path.quadraticBezierTo(secondControlPoint1.dx, secondControlPoint1.dy, secondendPoint1.dx, secondendPoint1.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}