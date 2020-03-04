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

  Color bgcolor = Color(0xFF4A4A58);
  //Color bgcolor1 = Colors.black;
  bool isCollapsed = true;
  AnimationController animationController;


  @override
  Widget build(BuildContext context) {
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height; 

  Widget decorBoxSet({
    String aT1,String aT2,String aT3,String aT4, /// titles  of boxes 1 - 4
    String aP1,String aP2,String aP3,String aP4, /// pictures  of boxes 1 - 4
    Function aR1,Function aR2,Function aR3,Function aR4,  /// rounds  of boxes 1 - 4
    }){
    
    return Stack(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                  //boxes 1 of 4      
                    Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: GestureDetector(
                            onTap: aR1,
                            child: Container(
                                    height: mheight*.3,
                                    width: mwidth*.48,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(aP1),),
                                    ),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Column(
                            children: <Widget>[
                              SizedBox(height:mheight*.10),
                              Text(aT1
                              ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),
                              ),
                              SizedBox(height:10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  height: mheight*.08,
                                  width: mwidth*.3,
                                  color: Colors.white,
                                  child: Icon(Icons.arrow_right),
                                ),
                              )
                            ],
                        ),
                                    ),
                                  ),
                          ),
                        ),

                        
                      ],
                    ),
                  //boxes 2 of 4 
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: GestureDetector(
                        onTap: aR2,
                        child: Container(
                                height: mheight*.4,
                                width: mwidth*.48,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(aP2),),
                                ),
                                child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Column(
                            children: <Widget>[
                              SizedBox(height:mheight*.10),
                              Text(aT2 
                              ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),
                              ),
                              SizedBox(height:10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  height: mheight*.08,
                                  width: mwidth*.3,
                                  color: Colors.white,
                                  child: Icon(Icons.arrow_right),
                                ),
                              )
                            ],
                          ),
                                    ),
                              ),
                      ),
                    ),

                      ],
                    ),
          /// Second alternative row
                    Padding(
                      padding: EdgeInsets.only(top: mheight*.31),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                    //boxes 3 of 4       
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: GestureDetector(
                          onTap: aR3,
                          child: Container(
                                  height: mheight*.4,
                                  width: mwidth*.48,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(aP3),),
                                ),
                                child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Column(
                            children: <Widget>[
                              SizedBox(height:mheight*.10),
                              Text(aT3
                              ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),
                              ),
                              SizedBox(height:10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  height: mheight*.08,
                                  width: mwidth*.3,
                                  color: Colors.white,
                                  child: Icon(Icons.arrow_right),
                                ),
                              )
                            ],
                          ),
                                    ),
                                ),
                        ),
                      ),
                    //boxes 4 of 4   
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: GestureDetector(
                          onTap: aR4,
                          child: Container(
                                  height: mheight*.3,
                                  width: mwidth*.48,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(aP4),),
                                ),
                                child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Column(
                            children: <Widget>[
                              SizedBox(height:mheight*.10),
                              Text(aT4
                              ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0),
                              ),
                              SizedBox(height:10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  height: mheight*.08,
                                  width: mwidth*.3,
                                  color: Colors.white,
                                  child: Icon(Icons.arrow_right),
                                ),
                              )
                            ],
                          ),
                                    ),
                                ),
                        ),
                      ), 

                        ],
                      ),
                    ),                    
                  ],
                );
  }


   return Scaffold(
     backgroundColor: bgcolor,
          body:CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              backgroundColor: Colors.green,
              leading: Icon(Icons.menu,color: Colors.white,),
              middle:Text("Homepage",style: TextStyle(color: Colors.white),) ,
              trailing: Icon(Icons.search,color: Colors.white,),
            ),
            child: ListView(
              children: <Widget>[

                SizedBox(height: 10.0,),
                ListTile(
                  title: Text("Hi! Jesse,") ,
                 // subtitle:Text("Hi! Jesse,")  ,
                  trailing:CircleAvatar(
                    backgroundImage: AssetImage("pix/objs.jpg"),
                  ) ,
                ),
                ListTile(
                  title: Text("Mau Liburan Kemana Nih?, Siapkan Barangmu. Kitta Akan Pergi, Lorem ipsium Lorem Ipsium",style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),) ,
                 // subtitle:Text("Hi! Jesse,")  ,

                ), 
                Row(
                  children: <Widget>[
                    Container(
                      //color: Colors.deepOrange,
                      height: mheight*.1,
                      width: mwidth*.8,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                //color: Colors.deepPurple,
                      height: mheight*.1,
                                child: Text("  Top   \b",style: TextStyle(
                                  color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                              ),
                          Container(
                      height: mheight*.1,
                            child: Text("Categories    \b",style: TextStyle(
                                  color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                          ),
                          Container(
                      height: mheight*.1,
                            child: Text("Hidden Germs   \b",style: TextStyle(
                                  color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                          ),  
                              Container(
                      height: mheight*.1,
                                child: Text("Flight   \b",style: TextStyle(
                                  color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                              ),
                          Container(
                      height: mheight*.1,
                            child: Text("Breakfast    \b",style: TextStyle(
                                  color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                          ),
                          Container(
                      height: mheight*.1,
                            child: Text("Machine   \b",style: TextStyle(
                                  color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                          ),                                                       
                            ],
                          ),
                                                   
                        ],
                      ),
                    ),
                    Container(
                      height: mheight*.1,
                      width: mwidth*.2,
                      //color: Colors.green,
                      child: IconButton(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(10.0),
                        icon: Icon(Icons.sort),
                        onPressed: (){},
                      ),
                    ),                    
                  ],
                ),               


                    SizedBox(height: 20,),
                     /// DecoreBoxes Set Go Here
                     decorBoxSet(
                       aP1: "pix/e.png",aP2: "pix/a.jpg",aP3: "pix/b.png",aP4: "pix/d.jpg",
                       aT1: "Categories Here" ,aT2: "The Booba",aT3: "Hidden Germs" ,aT4: "SPecial To The Creator",
                       aR1:(){print("Hell-O ");},aR2:(){print("Hello yeah");},aR3:(){},aR4: (){},
                     ),
                     Padding(padding: EdgeInsets.only(top: mheight*.02),),
                     decorBoxSet(
                       aP1: "pix/e.png",aP2: "pix/a.jpg",aP3: "pix/b.png",aP4: "pix/d.jpg",
                       aT1: "Categories Here" ,aT2: "The Booba",aT3: "Hidden Germs" ,aT4: "SPecial To The Creator",
                       aR1:(){},aR2:(){print("Hello yeah");},aR3:(){},aR4: (){},
                     ),


              ],

            ),
          )
                  );
                }  


              }

           
