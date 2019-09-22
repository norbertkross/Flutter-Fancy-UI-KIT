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

Widget tileList(String title,subtitle,img_path){

return  ListTile(
              title: Text("$title",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              subtitle: Text("$subtitle",style: TextStyle(color: Colors.white),),
              leading:ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 50.0,
              width: 50.0,
             // color: Colors.red,
                            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("$img_path")
                )
              ),
            ),
          ),
          trailing:     IconButton(
      icon: Icon(Icons.cancel, color: Colors.white,),
      onPressed: (){

          },
        ),
            );

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

          children: <Widget>[ 
    
            ListTile(
              title: Text("Download",style: TextStyle(color: Colors.white),),
              leading:IconButton(
                icon: Icon(Icons.home, color: Colors.white,size: 35.0,),
                onPressed: (){},
              ),
          trailing:IconButton(
      icon: Icon(Icons.menu, color: Colors.white,),
      onPressed: (){},
    )  ,
            ),  
            tileList("Imagine Dragons","Believer","pix/panda.jpg"),
            Divider(color: Colors.white,height: 30.0,),
             tileList("Imagine Dragons","Believer","pix/objs.jpg"),
            Divider(color: Colors.white,height: 30.0,),  
            tileList("Imagine Dragons","Believer","pix/panda.jpg"),
            
            Divider(color: Colors.white,height: 30.0,),
            tileList("Imagine Dragons","Believer","pix/objs.jpg"),
            Divider(color: Colors.white,height: 30.0,),
             tileList("Imagine Dragons","Believer","pix/panda.jpg"),
              Divider(color: Colors.white,height: 30.0,),
               ],            
            ),
        ),


          Stack(
            children: <Widget>[
        ClipPath(
          clipper: BottomClipperpath(context),
          child:
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top:  mdh*(5/100)),
                  ),
                  Container(
                    height:  mdh*(5/100),
                    color: Colors.red,
                  ),
                ],
              ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              height: mdh*(10/100),
              color: Colors.red,
            ),
          ),              
            ],
          ),
          

        ),  

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu,color: Colors.white,),
                onPressed: (){},
              ),

              SizedBox(
                height: 40.0,
                width: 40.0,
              ),
              IconButton(
                icon: Icon(Icons.phone_iphone,color: Colors.white,),
                onPressed: (){},
              ),
            ],
          ),               
            ],
          ) ,
  ],
),

Column(
  children: <Widget>[
 Padding(
   padding: EdgeInsets.only(top:mdh*(84/100)),
 ),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
              FloatingActionButton(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                heroTag: "f-lot",
                child: Icon(butnHit == false? Icons.file_download:Icons.cancel),
                onPressed: (){
                  setState(() {
                   butnHit = !butnHit; 
                  });
                },
              ),    
  ],
)
  ],
)


           
            
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

/// second // middle Curve
    var fcp = Offset(mw/2.0, mh*(140/100));
    var fep = Offset(mw*(5.5/9),0.0);

  
  path.lineTo(mw, 0.0);
  
  path.lineTo(mw, mh*(100/100));
  
  path.lineTo(0.0,  mh*(100/100));
  
  path.lineTo(0.0,0.0);
  path.lineTo(mw*(3.5/9), 0.0);
  
        path.quadraticBezierTo(fcp.dx, fcp.dy, fep.dx, fep.dy); 



         
        

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}
