import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String dp;
  final String name;
  final String time;
  final String img;
  
  PostItem({
    this.dp,
    this.name,
    this.time,
    this.img
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {

        },
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('${dp}'),
              ),
              contentPadding: EdgeInsets.all(0),
              title: Text('$name', style: TextStyle(
               fontWeight: FontWeight.bold 
              )),
              trailing: Text('$time', style: TextStyle(
               fontWeight: FontWeight.w300,
               fontSize: 11
              )),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.asset('$img', width: double.infinity, height: 170, fit: BoxFit.cover),
            )
          ],
        ),
      ),
    );
  }
}
