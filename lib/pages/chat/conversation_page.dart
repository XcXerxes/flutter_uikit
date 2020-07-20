import 'package:flutter/material.dart';
import 'package:flutter_uikit/util/data.dart';
import 'package:flutter_uikit/widget/chat_bubble.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  String name = names[random.nextInt(10)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: _buildTitle(),
        titleSpacing: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: (){},
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  _buildTitle() {
    return InkWell(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 0, right: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/cm${random.nextInt(10)}.jpeg'
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('$name', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14
                )),
                SizedBox(height: 5,),
                Text(
                  'Online',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBody() {
    return Container(
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: conversation.length,
              reverse: true,
              itemBuilder: (BuildContext context, int index) {
                Map msg = conversation[index];
                return ChatBubble(
                  message: msg['type'] == "text"
                      ? messages[random.nextInt(10)]
                      : "assets/cm${random.nextInt(10)}.jpeg",
                  username: msg["username"],
                  time: msg["time"],
                  type: msg['type'],
                  replyText: msg["replyText"],
                  isMe: msg['isMe'],
                  isGroup: msg['isGroup'],
                  isReply: msg['isReply'],
                  replyName: name,
                );
              },
            ),
          ),
         _buildBottomAppBar()
        ],
      ),
    );
  }

  _buildBottomAppBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BottomAppBar(
        elevation: 10,
        color: Theme.of(context).primaryColor,
        child: Container(
          constraints: BoxConstraints(
              maxHeight: 100
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.add),
                color: Theme.of(context).accentColor,
              ),
              Flexible(
                child: TextField(
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).textTheme.title.color
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: 'Write your message...',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).textTheme.title.color
                    )
                  ),
                  maxLines: null,
                ),
              ),
              IconButton(
                icon: Icon(Icons.mic, color: Theme.of(context).accentColor),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
