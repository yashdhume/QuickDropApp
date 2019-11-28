import 'package:flutter/material.dart';
import 'NavigationDrawer.dart';
import 'GradientAppBar.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context){
    return Scaffold(
      key: _key,
      drawer: buildDrawer(),
      bottomNavigationBar: BottomNavyBar(

        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),

        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Color(0xff48c6ef),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.folder),
            title: Text('Files'),
            activeColor: Color(0xff48c6ef),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Freinds'),
            activeColor: Color(0xff48c6ef),
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Quick Drop"),
          new Container(),
        ],
      ),
    );
  }
}