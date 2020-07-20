import 'package:flutter/material.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart' as extended;
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_uikit/util/data.dart';
import 'package:flutter_uikit/widget/chat_item.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> with SingleTickerProviderStateMixin {

  /// Tab控制器
  TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: extended.NestedScrollView(
        pinnedHeaderSliverHeightBuilder: () {
          return MediaQuery.of(context).padding.top + kToolbarHeight;
        },
        innerScrollPositionKeyBuilder: () {
          if(_tabController.index == 0) {
            return Key('Tab0');
          }
          return Key('Tab1');
        },
        headerSliverBuilder: headerSliverBuilder,
        body: _buildBody(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {

        },
      ),
    );
  }

  Widget _buildBody() {
    return IndexedStack(
      index: _tabIndex,
      children: <Widget>[
        extended.NestedScrollViewInnerScrollPositionKeyWidget(
          Key('Tab0'),
          EasyRefresh(
            header: BallPulseHeader(),
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 2), () {
                if(mounted) {
                  setState(() {

                  });
                }
              });
            },
            child: ListView.separated(
              padding: EdgeInsets.all(10),
              separatorBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: .5,
                    width: double.infinity,
                    child: Divider(),
                  ),
                );
              },
              itemBuilder: (context, index) {
                Map chat = chats[index];
                return ChatItem(
                  dp: chat['dp'],
                  name: chat['name'],
                  isOnline: chat['isOnline'],
                  counter: chat['counter'],
                  msg: chat['msg'],
                  time: chat['time'],
                );
              },
              itemCount: chats.length,
            ),
          )
        ),
        _buildTabView1()
      ],
    );
  }

  List<Widget> headerSliverBuilder(context, innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {

          },
        ),
        title: TextField(decoration: InputDecoration.collapsed(hintText: 'Search')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: (){},
          )
        ],
        centerTitle: true,
        flexibleSpace: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(),
        ),
        floating: true,
        snap: true,
        pinned: false,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 46),
          child: TabBar(
            controller: _tabController,
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
            tabs: <Widget>[
              Tab(text: 'Messages'),
              Tab(text: 'Groups')
            ],
          ),
        ),
      )
    ];
  }

  _buildTabView1() {
    return extended.NestedScrollViewInnerScrollPositionKeyWidget(
        Key('Tab1'),
        EasyRefresh(
          header: BallPulseHeader(),
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              if(mounted) {
                setState(() {

                });
              }
            });
          },
          child: ListView.separated(
            padding: EdgeInsets.all(10),
            separatorBuilder: (BuildContext context, int index) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: .5,
                  width: double.infinity,
                  child: Divider(),
                ),
              );
            },
            itemBuilder: (context, index) {
              Map group = groups[index];
              return ChatItem(
                dp: group['dp'],
                name: group['name'],
                isOnline: group['isOnline'],
                counter: group['counter'],
                msg: group['msg'],
                time: group['time'],
              );
            },
            itemCount: chats.length,
          ),
        )
    );
  }
}
