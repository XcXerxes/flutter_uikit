import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_uikit/util/data.dart';
import 'package:flutter_uikit/widget/post_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCount = 1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        title: Text('_HomePageState'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: (){

            },
          )
        ],
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,),
        onPressed: () {
          setState(() {
            currentCount = currentCount == 1 ? 2 : 1;
          });
        },
      ),
    );
  }

  _buildList() {
    return EasyRefresh(
      header: BallPulseHeader(),
      onRefresh: () async {

      },
//      child: GridView.builder(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: currentCount, childAspectRatio: 1.5),
//        itemBuilder: (BuildContext context, int index) {
//          Map post = posts[index];
//          return PostItem(
//            dp: post['dp'],
//            name: post['name'],
//            img: post['img'],
//            time: post['time']
//          );
//        },
//        itemCount: posts.length,
//        padding: EdgeInsets.symmetric(horizontal: 15.0),
//      ),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (BuildContext context, int index) {
          Map post = posts[index];
          return PostItem(
            dp: post['dp'],
            name: post['name'],
            img: post['img'],
            time: post['time']
          );
        },
        itemCount: posts.length,
      ),
    );
  }
}
