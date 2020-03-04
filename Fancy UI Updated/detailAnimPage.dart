import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubDetailPage extends StatefulWidget {
String img  ;
SubDetailPage(this.img);
  @override
  _SubDetailPageState createState() => _SubDetailPageState();
}

class _SubDetailPageState extends State<SubDetailPage> {
//bool isCollapsed = true;  
Duration animDuration = Duration(milliseconds: 500);  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            ListTile(
              trailing: IconButton(
                icon: Icon(Icons.close,color: Colors.white,),
                onPressed: (){Navigator.pop(context);},
              ),
            ),
            Center(
              child: Image.asset(widget.img),
            ),
          ],
        ),
               );
            }
        }

