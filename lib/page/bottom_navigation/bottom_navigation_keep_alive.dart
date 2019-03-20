import 'package:flutter/material.dart';
import 'package:redux_todolist/page/bottom_navigation/pages_keep_alive/airplay_screen.dart';
import 'package:redux_todolist/page/bottom_navigation/pages_keep_alive/email_screen.dart';
import 'package:redux_todolist/page/bottom_navigation/pages_keep_alive/home_screen.dart';
import 'package:redux_todolist/page/bottom_navigation/pages_keep_alive/pages_screen.dart';

class BottomNavigationKeepAlive extends StatefulWidget {
  @override
  _BottomNavigationKeepAliveState createState() {
    return _BottomNavigationKeepAliveState();
  }
}

class _BottomNavigationKeepAliveState extends State<BottomNavigationKeepAlive> {
  final Color _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          AirPlayScreen(),
          EmailScreen(),
          HomeScreen(),
          PagesScreen()
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        //          onTap: (index)=> _controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn),
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'HOME',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'Email',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'PAGES',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.airplay,
                color: _bottomNavigationColor,
              ),
              title: Text(
                'AIRPLAY',
                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
      ),
    );
  }
}
