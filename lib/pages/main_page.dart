import 'package:flutter/material.dart';
import 'package:flutter_uikit/pages/chat/chats_page.dart';
import 'package:flutter_uikit/pages/friends_page.dart';
import 'package:flutter_uikit/pages/home_page.dart';
import 'package:flutter_uikit/pages/notifications_page.dart';
import 'package:flutter_uikit/pages/profile_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  PageController _pageController;

  int _page = 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }


  _buildBottomNavBarItem(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      title: Text('$title')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        children: <Widget>[
          ChatsPage(),
          FriendsPage(),
          HomePage(),
          NotificationsPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(color: Colors.grey[500])
          )
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            _buildBottomNavBarItem(Icons.message, '信息'),
            _buildBottomNavBarItem(Icons.group, '群组'),
            _buildBottomNavBarItem(Icons.home, '首页'),
            _buildBottomNavBarItem(Icons.notifications, '消息'),
            _buildBottomNavBarItem(Icons.person, '我的')
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  navigationTapped(int index) {
    _pageController.jumpToPage(index);
  }

  onPageChanged(int index) {
    setState(() {
      _page = index;
    });
  }
}
