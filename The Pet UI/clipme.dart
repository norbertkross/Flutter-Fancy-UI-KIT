import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ClipMeClip extends StatefulWidget {
  ClipMeClip({Key key}) : super(key: key);

  _ClipMeClipState createState() => _ClipMeClipState();
}

class _ClipMeClipState extends State<ClipMeClip> {
  bool love = false;
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
       body: ListView(
         children: <Widget>[


        Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[

          Container(
           height:MediaQuery.of(context).orientation == Orientation.portrait?
            MediaQuery.of(context).size.height*(50/100):MediaQuery.of(context).size.height*(75/100),
           width: MediaQuery.of(context).size.width,
           decoration: BoxDecoration(
             image: DecorationImage(
               fit: BoxFit.cover,
               image: AssetImage("pix/panda.jpg")),
           ),
  
         ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              icon: Icon(love == false?CupertinoIcons.heart:CupertinoIcons.heart_solid,size: 30.0,color:Colors.red,),
              onPressed: (){
                setState(() {
                 love = !love; 
                });
              },
            ),
            // IconButton(
            //   icon: Icon(CupertinoIcons.heart_solid,size: 30.0,color: love == false?Colors.white:Colors.red,),
            //   onPressed: (){},
            // ),            
          ],
        ),

              ],
            ),
            
            // Card(
            //   child: 
Column(
  children: <Widget>[
    Padding(
      padding: EdgeInsets.only(top:
      MediaQuery.of(context).orientation == Orientation.portrait?
                    MediaQuery.of(context).size.height*(40/100):
                    MediaQuery.of(context).size.height*(55/100),
       ),
    ),
            ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child:  Container(
                color: Colors.white,
                // height: MediaQuery.of(context).orientation == Orientation.portrait?
                //     MediaQuery.of(context).size.height*(65/100):
                //     MediaQuery.of(context).size.height*(95/100),
                width:MediaQuery.of(context).size.width ,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    Text("Little Darlene "
                    ,style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,color: Colors.green),
                    ),
                    Text("Small Dogs can bring big rewards"),
                    SizedBox(
                      height: 20.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15.0,
                            ),
                        Text("Age    \b: "
                        ,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.orange),
                        ),  
                         Text(" 2 months")                          
                          ],
                        ),
                        // Row(
                        //   children: <Widget>[
                           
                        //     SizedBox(width: 20.0,)
                        //   ],
                        // )
                     
                      ],
                    ),

                  SizedBox(height: 5.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15.0,
                            ),
                        Text("Sex    \b: "
                        ,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.orange),
                        ),  
                         Text(" Female")                          
                          ],
                        ),
                        // Row(
                        //   children: <Widget>[
                           
                        //     SizedBox(width: 20.0,)
                        //   ],
                        // )
                     
                      ],
                    ),

                     SizedBox(height: 5.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15.0,
                            ),
                        Text("Color  \b: "
                        ,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.orange),
                        ),  
                         Text(" White")                          
                          ],
                        ),
                        // Row(
                        //   children: <Widget>[
                           
                        //     SizedBox(width: 20.0,)
                        //   ],
                        // )
                     
                      ],
                    ),  

                     SizedBox(height: 5.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15.0,
                            ),
                        Text("Weight : "
                        ,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.orange),
                        ),  
                         Text("12 kg")                          
                          ],
                        ),
                        // Row(
                        //   children: <Widget>[
                           
                        //     SizedBox(width: 20.0,)
                        //   ],
                        // )
                     
                      ],
                    ),     

                     SizedBox(height: 20.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15.0,
                            ),
                        Text("Description "
                        ,style: TextStyle(fontSize: 20.0,color: Colors.green),
                        ),                          
                          ],
                        ),


                     
                      ],
                    ),                     

                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            """lorem ipsium lorem ipsium ipsium lorem ipsium lorem ipsium lorem ipsium lorem ipsium lorem ipsium"""
                          ),
                        ), 

        /////// green Button //////

  Container(
              height: 55.0,
              width:250.0 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                border: Border.all(color: Colors.white,width: 2.0),
              ),
              child:Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                border: Border.all(color: Colors.green,width: 0.0),
                color: Colors.green.withOpacity(0.85),
              ),
                //color: Colors.redAccent.withOpacity(0.85),
                child:Center(
                child:Text("Adoption",style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),),
              ),
              ) 
            ),  

        SizedBox(height: 20.0,)                                 

                  ],
                ),
              ),
            ),
  ],
)            

             //,
            //)
          ],
        )
                   
         ],
       ) 

         );
  }
}

