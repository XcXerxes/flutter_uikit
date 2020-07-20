import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_uikit/util/data.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {

        }),
        title: TextFormField(
          decoration: InputDecoration.collapsed(hintText: 'Search'),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list), onPressed: () {

          })
        ],
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return EasyRefresh(
      header: BallPulseHeader(),
      onRefresh: () async {

      },
      child: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: .5,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Divider(),
            ),
          );
        },
        itemCount: friends.length,
        itemBuilder: (BuildContext context, int index) {
          Map friend = friends[index];
          return _buildItem(friend);
        },
      ),
    );
  }

  _buildItem(Map friend) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        onTap: () {

        },
        leading: CircleAvatar(
          backgroundImage: AssetImage(friend['dp']),
          radius: 25,
        ),
        contentPadding: EdgeInsets.all(0),
        title: Text(friend['name']),
        subtitle: Text(friend['status']),
        trailing: friend['isAccept'] ? FlatButton(
          onPressed: () {

          },
          color: Colors.grey,
          child: Text('未关注', style: TextStyle(
           color: Colors.white
          )),
        ) : FlatButton(onPressed: () {

        }, child: Text('已关注', style: TextStyle(
          color: Colors.white
        )), color: Theme.of(context).accentColor),
      ),
    );
  }
}
