import 'package:flutter/material.dart';
import 'package:flutter_uikit/pages/chat/conversation_page.dart';

class ChatItem extends StatelessWidget {

  final String dp;
  final String name;
  final String time;
  final String msg;
  final bool isOnline;
  final int counter;

  ChatItem({
    this.dp,
    this.name,
    this.time,
    this.msg,
    this.isOnline,
    this.counter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return ConversationPage();
            })
          );
        },
        contentPadding: EdgeInsets.all(0),
        leading: Stack(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(
                '${dp}'
              ),
              radius: 25,
            ),
            _buildPoint()
          ],
        ),
        title: Text(
          '$name',
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          '$msg',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              '$time',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 11
              ),
            ),
            SizedBox(height: 5),
            _buildCounter()
          ],
        ),
      ),
    );
  }

  _buildCounter() {
    return counter == 0 ? SizedBox() : Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(6)
      ),
      constraints: BoxConstraints(
        minWidth: 11,
        minHeight: 11
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 1, left: 5, right: 5),
        child: Text(
          '$counter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _buildPoint() {
    return Positioned(
      bottom: 0,
      left: 6,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6)
        ),
        height: 11,
        width: 11,
        child: Center(
          child: Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: isOnline ? Colors.greenAccent : Colors.grey,
              borderRadius: BorderRadius.circular(6)
            ),
          ),
        ),
      ),
    );
  }
}
