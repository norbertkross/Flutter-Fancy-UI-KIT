import 'dart:ui';
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

   Duration animDuration = Duration(milliseconds: 500); 
   Duration duration = Duration(milliseconds: 500);   
    Color bgcolor = Color(0xFF060B43);
    Color avtarcolor = Color(0xFF05047E);
    bool onlyBase = true;
    int quant = 23;
    int timess = 1;
    bool revealed = true;
    bool stared = false;
    ScrollController _controller;
    bool itemDetailsShow = false;
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


Widget bItems(String pic){
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;  
  return Padding(
                padding:EdgeInsets.all(8.0),
                child: GestureDetector(
            onVerticalDragStart: (__){
              print("Dragging1 ... $onlyBase");
              setState(() {
               onlyBase = ! onlyBase; 
               revealed = ! revealed;
              });
            },

                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(pic),
                          )
                        ),
                        width: MediaQuery.of(context).orientation == Orientation.landscape?
                        mheight*.20:mheight*.13,
                      ),
                    )
                  ),
                ),
              );
}




Widget giveProductCalcs({String imageName,String price,String body,String times}){
  return ListTile(
            leading: Container(
              child: CircleAvatar(
                backgroundImage: AssetImage(imageName),
              ),
            ),
            trailing: Text("\$ $price",style:TextStyle(color: Colors.white)),
            title: Text("$timess x \n$body",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          );
}


Widget deliverable({String price,}){
  return ListTile(
            leading: Container(
              child: CircleAvatar(
                backgroundColor: avtarcolor,
               child: Icon(CupertinoIcons.car),
              ),
            ),
            trailing: Text("\$ $price",style:TextStyle(color: Colors.white)),
            title: Text("Delivery",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            subtitle: Text("All orders of \$ 40 or more qualify for free delivery"
            ,style:TextStyle(color: Colors.white,fontWeight: FontWeight.w300),
            ),
          );
}

Widget whenRevealed(){

    double mwidth = MediaQuery.of(context).size.width; 
    double mheight = MediaQuery.of(context).size.height;    
    return Container(                   
       child:Stack(
          children: <Widget>[
            AnimatedPositioned(
                    duration: duration,
                    top:revealed == false?mheight*.0 :MediaQuery.of(context).orientation == Orientation.landscape?
                    mheight:mheight ,
                    bottom:revealed ?0 : 0,
                    right:revealed ?0: 0,
                    left:revealed ?0:0, 
                    child: Container(
                      color: bgcolor,
                      child: ListView(
                        controller: _controller,
                        children: <Widget>[
                          SizedBox(height: mheight*.2,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.shopping_cart,color: Colors.white,),
                              ),
                              Text("Cart",style:TextStyle(fontSize: 24,color: Colors.white),),
                            ],
                          ),
                          // Container(
                          //   height: 100,
                          //   width: 100,
                          //   color: Colors.white10,
                          // ),
                          SizedBox(height:20),
                          giveProductCalcs(
                            imageName:"pix/b.png", 
                            price:"12.50",
                             body:"Newman's Own Pasta Source Sockarooni",
                             times:"1",
                             ),
                          giveProductCalcs(
                            imageName:"pix/b.png", 
                            price:"17.09",
                             body:"Newman's Own Pasta Source Sockarooni",
                             times:"1",
                             ),
                          giveProductCalcs(
                            imageName:"pix/b.png", 
                            price:"27.0",
                             body:"Newman's Own Pasta Source Sockarooni",
                             times:"1",
                             ), 
                             SizedBox(
                               height: 60,
                             ),
                          deliverable(price: "57"),
                             SizedBox(
                               height: 20,
                             ),
                          ListTile(
                            leading: Text("Total:",style:TextStyle(color: Colors.white,),),
                            trailing: Text("\$ 234",style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                          ) ,
                             SizedBox(
                               height: 20,
                             ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CupertinoButton(
                                child: Text("      Next       \b",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(20),
                                onPressed: (){},
                              ),
                            ],
                          ),
                             SizedBox(
                               height: 20,
                             ),                            

                        ],
                      ),
                    ),
                    ),              
            ],
          ) ,
                );
}



  Widget bottomPage(){
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;    
    return Stack(
      children: <Widget>[
        //onlyBase == true? 
        Container(
          //backgroundColor: bgcolor,
          color:bgcolor,
          child: Row(
            children: <Widget>[
              GestureDetector(
                onVerticalDragStart: (__){
                  setState(() {
                  onlyBase = !onlyBase;
                  revealed = ! revealed; 
                  print("Dragging2 ... $onlyBase");                
                  });

                },
                child: Container(
                  width: mwidth*.80,
                  child: Padding(
                    padding: MediaQuery.of(context).orientation == Orientation.landscape?
                    EdgeInsets.only(top: mheight*.75):EdgeInsets.only(top: mheight*.85),
                    child: onlyBase == true? Container(
                      //color: Colors.green,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          
                          Row(
                            children: <Widget>[
                            SizedBox(
                              width: 10.0,
                            ),                  
                            Text("Cart"
                            ,style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,color: Colors.white),),
                            SizedBox(
                              width: 20.0,
                            ),
                            ],
                          ),
                          
                          bItems("pix/b.png"),
                          bItems("pix/e.png"),
                          bItems("pix/f.png"),
                          bItems("pix/h.jpg"),
                          bItems("pix/a.jpg"),
                          
                        ],
                      ),
                    ):Container(),
                  ),
                ),
              ),
              Padding(
                padding: MediaQuery.of(context).orientation == Orientation.landscape?
                EdgeInsets.only(top: mheight*.75):EdgeInsets.only(top: mheight*.85),
                child: GestureDetector(  
                onTap: (){
                  print("ontaped pad");
                  setState(() {
                  // itemDetailsShow = !itemDetailsShow; 
                  });
                },
                onVerticalDragStart: (__){
                  print("should drag $onlyBase and revealed $revealed");
                  setState(() {
                   onlyBase = ! onlyBase; 
                   revealed = ! revealed;
                   print("should drag $onlyBase and revealed $revealed");
                  });
                },           
                  child: onlyBase == true? Container(
                    width: mwidth*.20,
                    height: mheight*.2,
                    color: Colors.white10.withOpacity(.001),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 5.0,),
                        Icon(Icons.vertical_align_top,color: Colors.white,),
                        Text("${quant.toString()}",style:TextStyle(color: Colors.white),),
                      ],
                    ),
                  ):Container(),
                ),
              )
            ],
          ),
        ),
        //:whenRevealed()
        whenRevealed()
        ,
      ],
    );
  }


gridBox(int index,String pik,String pik2){
  return Stack(
            children: <Widget>[
              GestureDetector(
                      onTap: (){
                        print("touching ");
                        if(revealed == true){
                        setState(() {
                         itemDetailsShow = ! itemDetailsShow; 
                        });                          
                        }else{
              setState(() {
               onlyBase = !onlyBase; 
               revealed = ! revealed;
              });                        
              }
                      },                
                child: Container(
                  //color: Colors.green,                                                      
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(index % 2 == 0?pik:pik2),
                    )
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(stared == true? Icons.star:Icons.star_border,color: Colors.red,),
                        onPressed: (){
                          
                          setState(() {
                            stared = ! stared;                                                                  
                          });
                        },
                      )
                    ],
                  ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text("\$ 369.99",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                SizedBox(height: 5.0,),
                // FittedBox(
                //   fit: BoxFit.scaleDown,
                //   child:
                    GestureDetector(
                      onTap: (){
                        print("touching yeei");
                        if(revealed == true){
                        setState(() {
                         itemDetailsShow = ! itemDetailsShow; 
                        });                          
                        }else{
              setState(() {
               onlyBase = !onlyBase; 
               revealed = ! revealed;
              });                        
              }

                      },
                      child: Text("Samptious Blona Organic White Fussillill mnjbhn scvdbfngmh,j.",style:TextStyle(color: Colors.white,)
                      ),
                    )
                  // )    

                ],
              ),
            ],
          );
}


  Widget pageOnTop(){
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;     
    return AnimatedPositioned(
                    duration: animDuration,
                    top:revealed ?0 : 0,
                    bottom:revealed == false?mheight*.85:MediaQuery.of(context).orientation == Orientation.landscape?
                    mheight*.25:mheight*.15 ,
                    right:revealed ?0 : 0,
                    left:revealed ?0 :0, 
                    child: Container(
                        child: ClipRRect(
                              borderRadius: BorderRadius.vertical(bottom:Radius.circular(40)),
                              child: 
                              Card(
                                elevation: 15,
                                margin: EdgeInsets.all(0),
                                child: Container(
                                  height: mheight*.8,
                                  color: Colors.red, 
                                  child:Flex(
                                    direction: Axis.vertical,
                                    children: <Widget>[
                                      Flexible(
                                        child: Container(
                                         // height: mheight*.9,
                                          width: mwidth,
                                          color: Colors.cyan,
                                  child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5.0,
                                      mainAxisSpacing: 10.0,
                                      ),
                                    shrinkWrap: true,
                                    itemCount: 50,
                                    cacheExtent:600 ,
                                    itemBuilder: (context,index){
                                      return Container(
                                        //color: Colors.yellow,
                                       child: 
                                        // child: ListView(
                                        //   children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(30),
                                              child: Container(
                                                child: gridBox(
                                                  index,
                                                  "pix/b.png",
                                                  "pix/e.png"
                                                ),
                                              ),
                                            ),
                                        //   ],
                                        // ),
                                      );
                                    },
                                  ),
                                        ),
                                      ),
                                    ],
                                  ),
                                    
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }



Widget showItemsDetail(){
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;  
    return AnimatedPositioned(
                    duration: animDuration,
                    top:itemDetailsShow ?0 : 0,
                    bottom:itemDetailsShow == false?mheight*.15:MediaQuery.of(context).orientation == Orientation.landscape?
                    mheight*.0:mheight*.0 ,
                    right:itemDetailsShow ?0 : 0,
                    left:itemDetailsShow ?0 :0, 
                    child: Container(
                        child: ClipRRect(
                              borderRadius: BorderRadius.vertical(bottom:
                              itemDetailsShow == true?Radius.zero:Radius.circular(40)),
                              child: 
                              Card(
                                elevation: 15,
                                margin: EdgeInsets.all(0),
                                child: Container(
                                  height: mheight*.8,
                                  color: Colors.white10, 
                                  child:ListView(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                                            child: Container(
                                              height: mheight*.4,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:AssetImage("pix/e.png"), )
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            contentPadding: EdgeInsets.all(0),
                                            trailing: IconButton(
                                              icon: CircleAvatar(
                                                backgroundColor: Colors.black38,
                                                child: Icon(Icons.close,color: Colors.red,)),
                                              onPressed: (){
                                              setState(() {
                                               itemDetailsShow = ! itemDetailsShow;                                                
                                              });                                                
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      ListTile(
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(height: 10.0,),
                                            Text("Biona Organic White Spelt Food Organic White Spelt",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                                            SizedBox(height: 10.0,),                                            
                                            Text("Weight: 500g"),
                                            SizedBox(height: 20,),

  
                  Row(  
                    mainAxisSize: MainAxisSize.max,  
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                    /// Row for buttons  
                    children: <Widget>[  
                              Material(
                                borderRadius: BorderRadius.circular(30),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(height: 10.0,),
                                    Container(
                                    child:Row(  
                                        mainAxisSize: MainAxisSize.min,  
                                        children: <Widget>[  
                                          GestureDetector(  
                                            onTap: (){dec();},  
                                            child:Icon(Icons.minimize ,color: Colors.green, 
                                            ),  
                                          ),    
                                          Container(  
                                            width: 100.0,  
                                            height: 20.0,  
                                            child:FittedBox(  
                                            child: Row(  
                                              children: <Widget>[  
                                                 Text("$numb   "
                                                   ,style: TextStyle(  
                                            //color: Colors.red,  
                                            fontSize: 20.0,  
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
                                    ),
                                     SizedBox(height: 10.0,),
                                  ],
                                ),
                              ),
                  Text("\$ 453.98",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                    ],  
                  ),

                  SizedBox(height: 20,),                  
                  Text("About the Product",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Lorem ipsium lorem ipsium lorem ipsium  Lorem ipsium lorem ipsium lorem ipsium  Lorem ipsium lorem ipsium lorem ipsium Lorem ipsium lorem ipsium lorem ipsium Lorem ipsium lorem ipsium lorem ipsium Lorem ipsium lorem ipsium lorem ipsium Lorem ipsium lorem ipsium lorem ipsium Lorem ipsium lorem ipsium lorem ipsium Lorem ipsium lorem ipsium lorem ipsium Lorem ipsium lorem ipsium lorem ipsium Lorem ipsium lorem ipsium lorem ipsium"),
                  SizedBox(height: 20,), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 18,
                          child: Icon(Icons.favorite_border),
                        ),

                      ),
                      CupertinoButton(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30),
                        child: Text("Add to cart"),
                        onPressed: (){},
                      )
                    ],
                  ),
                  SizedBox(height: 20,), 


                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                    
                                    ),
                                  ),
                                ),
                              ),
                            );  

}                          


_scrollListener() {

  //// top of list   
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
               onlyBase = !onlyBase; 
               revealed = ! revealed;        
        print("top reached");
      });
    }

  //// bottom of list
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
       print("Reached Bottom");
      });
    }    
  }

@override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double mwidth = MediaQuery.of(context).size.width; 
    double mheight = MediaQuery.of(context).size.height; 


               return Scaffold(    
                      body: Stack(
                      children: <Widget>[
                        bottomPage(),              
                        itemDetailsShow == false?pageOnTop():
                        showItemsDetail(),
                      ],
                    ),    
                  );
                }  
              }