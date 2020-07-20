import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_uikit/util/data.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.custom(
        header: BallPulseHeader(),
        onRefresh: () async {
          Future.delayed(Duration(seconds: 2), () => {
            if(mounted) {

            }
          });
        },
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _buildBody(),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Image.asset(
                      'assets/cm${random.nextInt(10)}.jpeg',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              childCount: 15,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1
            ),
          )
        ],
      ),
    );
  }

  _buildBody() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: 60),
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/cm${random.nextInt(10)}.jpeg'
              ),
              radius: 50,
            ),
            SizedBox(height: 10),
            Text(
              names[random.nextInt(10)],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Status should be here',
              style: TextStyle(

              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                  child: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  color: Colors.grey,
                  onPressed: () {},
                ),
                SizedBox(width: 10),
                FlatButton(
                  child: Icon(Icons.add, color: Colors.white),
                  color: Theme.of(context).accentColor,
                  onPressed: (){},
                )
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildCategory('Posts'),
                  _buildCategory('Friends'),
                  _buildCategory('Groups'),
                ],
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  _buildCategory(String title) {
    return Column(
      children: <Widget>[
        Text(random.nextInt(10000).toString(), style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22
        )),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(),
        )
      ],
    );
  }
}
