import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  String heroTag;
  String theImage;
  DetailPage(this.heroTag,this.theImage);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
bool isCollapsed = true;  
Duration animDuration = Duration(milliseconds: 500);  

List<String>  holdIMGList =[
   "pix/a.jpg",
   "pix/b.png",
    "pix/c.png",
    "pix/d.jpg",
    "pix/e.png",
    "pix/f.png",
    "pix/g.jpg",
    "pix/h.jpg",
    "pix/i.jpg",
    "pix/j.jpg",
    "pix/k.png",

];

String curntimg = "pix/e.png";

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("rndInt Hero Tag : ${widget.heroTag}");
    setState(() {
     curntimg = widget.theImage; 
    });
  }


    Widget  popupMenuButton(){
      return PopupMenuButton<String>(
        icon: Icon(Icons.menu,color: Colors.white,),
         itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[

               PopupMenuItem<String>(
                value:
                'Hoteliers',
                child:Row(children: <Widget>[Icon(Icons.hotel,color: Colors.green,),Text(
                  ' Hoteliers'
                  
                  ,style: TextStyle(color: Colors.green),),],),  
              ),

            ],
            onSelected: ( result) {
              print(result);
            
    }  );
    }




  @override
  Widget build(BuildContext context) {
   double mwidth = MediaQuery.of(context).size.width; 
   double mheight = MediaQuery.of(context).size.height;    

Widget floatingImage(Color clr,{String imageName,}){
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
              SizedBox(width:5.0),
            GestureDetector(
              onTap:(){
                setState(() {
                curntimg = imageName; 
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("$imageName")
                    )
                  ),
                  //color: clr,
                  height:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.30:mheight*.2,
                  width:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.30:mheight*.2,
                ),
              ),
            ),      
        ],
      ),
    ],
  );
}


    return Scaffold(
      body:Stack(
        children: <Widget>[
          Stack(
                children: <Widget>[
                  AnimatedPositioned(
                duration: animDuration,
                top:isCollapsed ?0 : 0,
                bottom:isCollapsed ?0 :MediaQuery.of(context).orientation == Orientation.landscape?
                mheight*.3:mheight*.25,
                right:isCollapsed ?0 : 0,
                left:isCollapsed ?0 :0, 
                child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("$curntimg"),
                      )
                    ),
                    ),
                  ),
                ),                  
                  
                //   AnimatedPositioned(
                // duration: animDuration,
                // top:isCollapsed ?0 : 0,
                // bottom:isCollapsed ?0 :mheight*.8,
                // right:isCollapsed ?0 : 0,
                // left:isCollapsed ?0 :0,   
                //     child:
                     GestureDetector(
                      onTap: (){
                        print("Tapping body");
                        if(isCollapsed == false){
                          setState(() {
                            isCollapsed = true;
                          });
                        }
                      },                       
                       child: ListView(
                        children: <Widget>[
                          ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(.2),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back,color: Colors.white,),
                                onPressed: (){
                                  Navigator.of(context).pop();

                                  },
                              ),
                            ),
                            trailing: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(.2),
                              child: IconButton(
                                icon: Icon(isCollapsed == true?Icons.menu:Icons.close,color: Colors.white,),
                                onPressed: (){
                                  setState(() {
                                   isCollapsed = !isCollapsed; 
                                  });                              
                                },
                              ),
                            ), //popupMenuButton(),
                          ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                  color: Colors.white.withOpacity(.4),
                                 // height: 50.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(CupertinoIcons.heart,color: Colors.white,),
                                        Text("2756",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                              ),
                                ),
                                BackdropFilter(
                                  filter: prefix0.ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0,)
                          ],
                        ),

                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Maldives Tour",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                           SizedBox(height: 20.0,),
                         Row(
                          children: <Widget>[
                            //SizedBox(width: 30.0,),
                            Row(
                              children: <Widget>[
                                Icon(Icons.timer,color: Colors.white,),
                                Text("30 DAYS",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold))
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.flag,color: Colors.white,),
                                Text("863 KM",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold))
                              ],
                            ),  
                            SizedBox(width: 30.0,),                                      
                          ],
                        ),                        
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height:30),

                        Text("""One of the largest artificial Islands, it is accessible by monorail which runs down a tree trunk.This is an amazing locaation for your perfect holidays"""
                        ,style: TextStyle(color:Colors.white,)
                        ),
                        SizedBox(height:30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                  color: Colors.white.withOpacity(.4),
                                 // height: 50.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.star,color: Colors.white,),
                                        Text("2756",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                              ),
                                ),
                                BackdropFilter(
                                  filter: prefix0.ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                  color: Colors.white.withOpacity(.4),
                                 // height: 50.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(CupertinoIcons.heart,color: Colors.white,),
                                        Text("2756",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                              ),
                                ),
                                BackdropFilter(
                                  filter: prefix0.ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
                                ),
                              ],
                            ),                    
                            SizedBox(width: 20.0,)
                          ],
                        ),

                        SizedBox(height:250),
                        ],
                    ),
                     ),
                //  ),
                 isCollapsed == true? Padding(
                    padding: EdgeInsets.only(
                      top:MediaQuery.of(context).orientation == Orientation.landscape?mheight*.67:mheight*.77),
                    child: Container(
                      //color: Colors.red,
                      height: MediaQuery.of(context).orientation == Orientation.landscape?
                      mheight*.6:mheight*.4,//mheight*.4,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                        floatingImage(Colors.green,imageName: holdIMGList[6]),
                        floatingImage(Colors.brown,imageName: holdIMGList[3]),
                        floatingImage(Colors.blue,imageName: holdIMGList[1]),
                        floatingImage(Colors.white,imageName: holdIMGList[8]),                                                            
                        ],
                      ),
                    ),
                  ):Container(),
                ],
              ),
////// Bottom upwards

//AnimatedBottomUp(isCollapsed),

AnimatedPositioned(
    duration: animDuration,
    top:isCollapsed ? MediaQuery.of(context).orientation == Orientation.landscape?mheight:mheight
    :MediaQuery.of(context).orientation == Orientation.landscape?mheight*.4: mheight*.55,
    bottom:isCollapsed ?0 :0,
    right:isCollapsed ?0 : 0,
    left:isCollapsed ?0 :0,        
        child: GestureDetector(
          onTap: (){
            setState(() {
             isCollapsed = !isCollapsed; 
            });
          },
          child: Stack(
            children: <Widget>[
              ClipRRect(
                //borderRadius: BorderRadius.circular(30),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                child: Container(
                  // height: MediaQuery.of(context).orientation == Orientation.landscape?mheight*.4:mheight*.9,
                  // // mheight*.4,
                  color: Colors.white,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                            // floatingImage(Colors.green,imageName: holdIMGList[6]),
                            // floatingImage(Colors.brown,imageName: holdIMGList[3]),
                            // floatingImage(Colors.blue,imageName: holdIMGList[1]),
                            // floatingImage(Colors.white,imageName: holdIMGList[8]),        
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Maldives",style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("In paradise, you can wake up with the sunrise, fall asleep with the sound of waves and feel as if you are one with nature",style: TextStyle(
                                    color: Colors.grey,
                                  
                                  ),),
                                ), 

                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: FittedBox(
                           fit: BoxFit.scaleDown,
                           child: Row(
                            children: <Widget>[
                              //SizedBox(width: 30.0,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.timer,color: Colors.blue,),
                                    Text("30",style: TextStyle(color:Colors.redAccent,fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.flag,color: Colors.green,),
                                    Text("863 KM",style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ), 
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.star_border,color: Colors.purple,),
                                    Text("863 KM",style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.exit_to_app,color: Colors.orange,),
                                    Text("863 KM",style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),  
                                                                                                             
                            ],
                      ),
                         ),
                       ),     

                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                        child: Container(
                         color: Colors.grey.withOpacity(.4),
                         //height: mheight*.8,
                         child: Column(
                           children: <Widget>[
                             Divider(color: Colors.grey.withOpacity(.4),height: .1,),
                             SizedBox(height: 30.0,),
                             CupertinoButton(
                               onPressed: (){},
                               borderRadius: BorderRadius.circular(20),
                               color: Colors.white,
                               child: Container(
                                 //color: Colors.deepOrange,
                                  //  height:  mheight*.25,
                                  //  width: mwidth*.9,
                                   child: Column(
                                         children: <Widget>[
                                          Icon(Icons.location_on,color: Colors.blue,),
                                          Text("Accra Girls senior high school, Accra,Ghana, West Africa,Africa."
                                          ,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),
                                          )
                                         ],
                                       ),
                                 ),
                             ),
                             SizedBox(height: 30.0,),
                             CupertinoButton(
                               child: Text("Commence The Tour"),
                               color: CupertinoColors.activeBlue,
                               onPressed: (){},
                             ),
                             SizedBox(height: 30.0,),
                           ],
                         ),
                       ) ,
                      ),
                                                
                              ],
                            ),           
                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Card(
                    shape: CircleBorder(),
                    child: IconButton(
                      icon: Icon(Icons.send,color: Colors.blue,),
                      onPressed: (){},
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )





        ],
      ),
    );
  }
}

