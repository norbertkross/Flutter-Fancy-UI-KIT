import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class LayOver extends StatefulWidget {
  @override
  _LayOverState createState() => _LayOverState();
}

class _LayOverState extends State<LayOver> {
Color bgcolor = Color(0xFF060B43);
int theirGroupValue = 0;

final Map<int, Widget> logoWidgets = const<int,Widget>{

  0:Padding(
    padding: EdgeInsets.all(5.0),
    child: Icon(Icons.home,
    //color: Colors.pink ,
    ),
  ),
  1:Padding(
    padding: EdgeInsets.all(5.0),
    child: Icon(Icons.edit,
    //color: Colors.green,
    ),
  ),

  2:Padding(
    padding: EdgeInsets.all(5.0),
    child: Icon(Icons.perm_media,
    //color: Colors.green,
    ),
  ),  
  
  

};  
  @override
  Widget build(BuildContext context) {

Widget roundContainer({String title, String subTitle, String picture, String subPicture}){
  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
             borderRadius: BorderRadius.circular(20),
             child: Container(  
               color: Colors.white,        
              child: ListTile(
                leading: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage(picture),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 8,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                     mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(width: 42,),
                        Column(
                          children: <Widget>[
                            SizedBox(height: 35,),
                            CircleAvatar(
                              backgroundImage: AssetImage(subPicture),
                              radius: 10,
                            ),
                          ],
                        ),
                      ],
                    ),                  
                  ],
                ),
                trailing: CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.green,child: Icon(Icons.done),
                ),
                title: Text(title,style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                subtitle: Text(subTitle
                ,style: TextStyle(color: Colors.black,)),
              ),),
           ),
  );
}

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: bgcolor,
        title: Text("Inbox"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          SizedBox(width: 20.0,)
        ],
        bottom: PreferredSize(
                  preferredSize: Size(double.infinity, 45.0),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.0,bottom: 10.0),child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CupertinoSegmentedControl(
                            selectedColor: Colors.white,
                            borderColor: Colors.white,
                            unselectedColor: Colors.green,                  
                            groupValue:theirGroupValue,
                            onValueChanged: (changeFromGroupValue){
                              setState(() {
                                theirGroupValue =changeFromGroupValue;
                              });
                            },
                            children: logoWidgets,
                          ),
                        ),              
                      ],
                    ),
                  ),
                ),
      ),
  body:ListView(
    shrinkWrap: true,
    children: <Widget>[
      //SizedBox(height: 20,),
        roundContainer(
          title: "Heyman",
          subTitle: "lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium",
          picture: "pix/d.jpg",
          subPicture: "pix/e.png",
        ),
        roundContainer(
          title: "Aberor",
          subTitle: "lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium",
          picture: "pix/d.jpg",
          subPicture: "pix/e.png",
        ),
        roundContainer(
          title: "John",
          subTitle: "lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium",
          picture: "pix/d.jpg",
          subPicture: "pix/e.png",
        ),
        roundContainer(
          title: "Cowboy",
          subTitle: "lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium",
          picture: "pix/d.jpg",
          subPicture: "pix/e.png",
        ),  
        roundContainer(
          title: "Heyman",
          subTitle: "lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium lorem Ipsium",
          picture: "pix/d.jpg",
          subPicture: "pix/e.png",
        ),                              
    ]),
        
    );
  }
}